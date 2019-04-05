#include <errno.h>
#include <inttypes.h>
#include <signal.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#include <sys/resource.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <linux/atomic.h>
#include <linux/kernel.h>
#include <linux/list.h>
#include <linux/rbtree.h>

#include "perf.h"
#include "builtin.h"
#include "evlist.h"
#include "util/stat.h"
#include "util/thread_map.h"
#include <linux/time64.h>
#include <subcmd/parse-options.h>

static struct perf_evlist	*evsel_list;

static struct target target = {
	.uid	= UINT_MAX,
};

static volatile pid_t		child_pid			= -1;
static bool			sync_run			= false;
static struct timespec		ref_time;

static struct perf_pmu_event_symbol *perf_pmu_events_list;
static int perf_pmu_events_list_num;

struct perf_stat {
	struct perf_data	 data;
	u64			 bytes_written;
	struct perf_tool	 tool;
	bool			 maps_allocated;
	struct cpu_map		*cpus;
	struct thread_map	*threads;
	enum aggr_mode		 aggr_mode;
};

struct caggr_data {
	double avg, avg_enabled, avg_running;
};

static volatile int done = 0;

static struct perf_stat_config stat_config = {
	.aggr_mode		= AGGR_GLOBAL,
	.scale			= true,
	.unit_width		= 4,
	.run_count		= 1,
	.walltime_nsecs_stats	= &walltime_nsecs_stats,
	.big_num		= true,
};

static inline void diff_timespec(struct timespec *r, struct timespec *a, struct timespec *b){
	r->tv_sec = a->tv_sec - b->tv_sec;
	if (a->tv_nsec < b->tv_nsec) {
		r->tv_nsec = a->tv_nsec + NSEC_PER_SEC - b->tv_nsec;
		r->tv_sec--;
	} else r->tv_nsec = a->tv_nsec - b->tv_nsec ;
}

static int read_counter(struct perf_evsel *counter){
	int nthreads = thread_map__nr(evsel_list->threads);
	int ncpus, cpu, thread;
	if (target__has_cpu(&target) && !target__has_per_thread(&target))ncpus = perf_evsel__nr_cpus(counter);
	else ncpus = 1;
	if (!counter->supported)return -ENOENT;
	if (counter->system_wide)nthreads = 1;
	for (thread = 0; thread < nthreads; thread++) {
		for (cpu = 0; cpu < ncpus; cpu++) {
			struct perf_counts_values *count;
			count = perf_counts(counter->counts, cpu, thread);
			if (!count->loaded && perf_evsel__read_counter(counter, cpu, thread)) {
				counter->counts->scaled = -1;
				perf_counts(counter->counts, cpu, thread)->ena = 0;
				perf_counts(counter->counts, cpu, thread)->run = 0;
				return -1;
			}
			count->loaded = false;
			if (verbose > 1) {
				fprintf(stat_config.output,"%s: %d: %" PRIu64 " %" PRIu64 " %" PRIu64 "\n",perf_evsel__name(counter),cpu,count->val, count->ena, count->run);
			}
		}
	}
	return 0;
}

static bool is_target_alive(struct target *_target, struct thread_map *threads){
	struct stat st;
	int i;
	if (!target__has_task(_target))	return true;
	for (i = 0; i < threads->nr; i++) {
		char path[PATH_MAX];
		scnprintf(path, PATH_MAX, "%s/%d", procfs__mountpoint(), threads->map[i].pid);
		if (!stat(path, &st))return true;
	}
	return false;
}

static int __run_perf_stat(int run_idx){
	int interval = stat_config.interval;
	char msg[8192];
	unsigned long long t0, t1;
	struct perf_evsel *counter;
	struct timespec ts,tts,rs;
	size_t l;
	int status = 0;
	ts.tv_sec  = interval / USEC_PER_MSEC;
	ts.tv_nsec = (interval % USEC_PER_MSEC) * NSEC_PER_MSEC;
	evlist__for_each_entry(evsel_list, counter) {
try_again:
		if (create_perf_stat_counter(counter, &stat_config, &target) < 0) {
			if ((errno == EINVAL || errno == EBADF) && counter->leader != counter && counter->weak_group) {
				counter = perf_evlist__reset_weak_group(evsel_list, counter);
				goto try_again;
			}
			if (errno == EINVAL || errno == ENOSYS || errno == ENOENT || errno == EOPNOTSUPP || errno == ENXIO) {
				if (verbose > 0)ui__warning("%s event is not supported by the kernel.\n", perf_evsel__name(counter));
				counter->supported = false;
				if ((counter->leader != counter) || !(counter->leader->nr_members > 1))continue;
			} else if (perf_evsel__fallback(counter, errno, msg, sizeof(msg))) {
                                if (verbose > 0)ui__warning("%s\n", msg);
                                goto try_again;
			} else if (target__has_per_thread(&target) && evsel_list->threads && evsel_list->threads->err_thread != -1) {
				if (!thread_map__remove(evsel_list->threads, evsel_list->threads->err_thread)) {
					evsel_list->threads->err_thread = -1;
					goto try_again;
				}
			}
			perf_evsel__open_strerror(counter, &target, errno, msg, sizeof(msg));
			ui__error("%s\n", msg);
			if (child_pid != -1)kill(child_pid, SIGTERM);
			return -1;
		}
		counter->supported = true;
		l = strlen(counter->unit);
		if (l > stat_config.unit_width)stat_config.unit_width = l;
		if ((counter->attr.read_format & PERF_FORMAT_ID) && perf_evsel__store_ids(counter, evsel_list))return -1;
	}
	t0 = rdclock();
	clock_gettime(CLOCK_MONOTONIC, &ref_time);
	if (stat_config.initial_delay)usleep(stat_config.initial_delay * USEC_PER_MSEC);
	if (!target__none(&target) || stat_config.initial_delay)perf_evlist__enable(evsel_list);
	while (!done) {
		double uval;
		nanosleep(&ts, NULL);
		if (!is_target_alive(&target, evsel_list->threads))break;
		evlist__for_each_entry(evsel_list, counter) {
			read_counter(counter);
			perf_stat_process_counter(&stat_config, counter);
		}
		clock_gettime(CLOCK_MONOTONIC, &tts);
		diff_timespec(&rs, &tts, &ref_time);
		init_stats(&walltime_nsecs_stats);
		update_stats(&walltime_nsecs_stats, stat_config.interval * 1000000);
		evlist__for_each_entry(evsel_list, counter) {
			struct caggr_data cd = { .avg = 0.0 };
			struct perf_stat_evsel *ps = counter->stats;
			cd.avg += avg_stats(&ps->res_stats[0]);
			cd.avg_enabled += avg_stats(&ps->res_stats[1]);
			cd.avg_running += avg_stats(&ps->res_stats[2]);
			uval = cd.avg * counter->scale;
			fprintf(stdout,"%.0f\n",uval);
			if(uval>3000){
				return 10000;
			}
		}
	}
	if (!target__none(&target)) perf_evlist__disable(evsel_list);
	t1 = rdclock();
	if (stat_config.walltime_run_table)stat_config.walltime_run[run_idx] = t1 - t0;
	update_stats(&walltime_nsecs_stats, t1 - t0);
	evlist__for_each_entry(evsel_list, counter) {
		read_counter(counter);
		perf_stat_process_counter(&stat_config, counter);
	}
	perf_evlist__close(evsel_list);
	return WEXITSTATUS(status);
}

static int run_perf_stat(int run_idx){
	int ret;
	if (sync_run)sync();
	ret = __run_perf_stat(run_idx);
	return ret;
}

static volatile int signr = -1;

static void skip_signal(int signo){
	if ((child_pid == -1) || stat_config.interval)done = 1;
	signr = signo;
	child_pid = -1;
}

static void sig_atexit(void){
	sigset_t set, oset;
	sigemptyset(&set);
	sigaddset(&set, SIGCHLD);
	sigprocmask(SIG_BLOCK, &set, &oset);
	if (child_pid != -1)kill(child_pid, SIGTERM);
	sigprocmask(SIG_SETMASK, &oset, NULL);
	if (signr == -1)return;
	signal(signr, SIG_DFL);
	kill(getpid(), signr);
}

static struct option stat_options[] = {
	OPT_CALLBACK('e', "event", &evsel_list, "event", "event selector. use 'perf list' to list available events", parse_events_option),
	OPT_END()
};

static int cpu_map__get_max(struct cpu_map *map){
	int i, max = -1;
	for (i = 0; i < map->nr; i++)
		if (map->map[i] > max)max = map->map[i];
	return max;
}

static int perf_stat_init_aggr_mode(void){
	int nr;
	nr = cpu_map__get_max(evsel_list->cpus);
	stat_config.cpus_aggr_map = cpu_map__empty_new(nr + 1);
	return stat_config.cpus_aggr_map ? 0 : -ENOMEM;
}

static void perf_stat__exit_aggr_mode(void){
	cpu_map__put(stat_config.aggr_map);
	cpu_map__put(stat_config.cpus_aggr_map);
	stat_config.aggr_map = NULL;
	stat_config.cpus_aggr_map = NULL;
}

static void runtime_stat_delete(struct perf_stat_config *config){
	int i;
	if (!config->stats)return;
	for (i = 0; i < config->stats_num; i++)
		runtime_stat__exit(&config->stats[i]);
	free(config->stats);
}

int cmd_stat(int argc, const char **argv){
	int status = -EINVAL, run_idx;
	FILE *output = stderr;
	unsigned int interval=100;
	evsel_list = perf_evlist__new();
	stat_config.interval = interval;
	(*stat_options->callback)(stat_options,"syscalls:sys_enter_sched_yield",0);
	target.pid=argv[1];
	stat_config.output = output;
	stat_config.ru_display = true;
	target__validate(&target);
	perf_evlist__create_maps(evsel_list, &target);
	perf_evlist__alloc_stats(evsel_list, interval);
	perf_stat_init_aggr_mode();
	stat_config.identifier = true;
	atexit(sig_atexit);
	signal(SIGINT,  skip_signal);
	signal(SIGCHLD, skip_signal);
	signal(SIGALRM, skip_signal);
	signal(SIGABRT, skip_signal);
	status = 0;
	for (run_idx = 0; run_idx < stat_config.run_count; run_idx++)
		status = run_perf_stat(run_idx);
	perf_stat__exit_aggr_mode();
	perf_evlist__free_stats(evsel_list);
	free(stat_config.walltime_run);
	perf_evlist__delete(evsel_list);
	runtime_stat_delete(&stat_config);
	return status;
}
