cmd_util/sort.o := gcc -Wp,-MD,util/.sort.o.d -Wp,-MT,util/sort.o -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wshadow -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wstrict-aliasing=3 -fno-strict-aliasing -DHAVE_ARCH_X86_64_SUPPORT -Iarch/x86/include/generated -DHAVE_SYSCALL_TABLE_SUPPORT -DHAVE_PERF_REGS_SUPPORT -DHAVE_ARCH_REGS_QUERY_REGISTER_OFFSET -O6 -fno-omit-frame-pointer -ggdb3 -funwind-tables -Wall -Wextra -std=gnu99 -fstack-protector-all -D_FORTIFY_SOURCE=2 -I/home/zbl/prepap/monitoring/linux/tools/perf/util/include -I/home/zbl/prepap/monitoring/linux/tools/perf/arch/x86/include -I/home/zbl/prepap/monitoring/linux/tools/include/uapi -I/home/zbl/prepap/monitoring/linux/tools/include/ -I/home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi -I/home/zbl/prepap/monitoring/linux/tools/arch/x86/include/ -I/home/zbl/prepap/monitoring/linux/tools/arch/x86/ -I/home/zbl/prepap/monitoring/linux/tools/perf/util -I/home/zbl/prepap/monitoring/linux/tools/perf -I/home/zbl/prepap/monitoring/linux/tools/lib/ -I/usr/include/python2.7/ -I/home/zbl/temp/papi/src -I/home/zbl/temp/papi/src/testlib /home/zbl/temp/papi/src/testlib/do_loops.o /home/zbl/temp/papi/src/testlib/test_utils.o /home/zbl/temp/papi/src/testlib/dummy.o /home/zbl/temp/papi/src/libpapi.a -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DHAVE_SYNC_COMPARE_AND_SWAP_SUPPORT -DHAVE_PTHREAD_ATTR_SETAFFINITY_NP -DHAVE_PTHREAD_BARRIER -DHAVE_EVENTFD -DHAVE_GET_CURRENT_DIR_NAME -DHAVE_DWARF_GETLOCATIONS_SUPPORT -DHAVE_GLIBC_SUPPORT -DHAVE_AIO_SUPPORT -DHAVE_SCHED_GETCPU_SUPPORT -DHAVE_SETNS_SUPPORT -DHAVE_LIBELF_SUPPORT -DHAVE_LIBELF_MMAP_SUPPORT -DHAVE_ELF_GETPHDRNUM_SUPPORT -DHAVE_GELF_GETNOTE_SUPPORT -DHAVE_ELF_GETSHDRSTRNDX_SUPPORT -DHAVE_DWARF_SUPPORT -DHAVE_LIBBPF_SUPPORT -DHAVE_BPF_PROLOGUE -DHAVE_SDT_EVENT -DHAVE_JITDUMP -DHAVE_DWARF_UNWIND_SUPPORT -DNO_LIBUNWIND_DEBUG_FRAME -DHAVE_LIBUNWIND_SUPPORT -DHAVE_LIBCRYPTO_SUPPORT -I/usr/include/slang -DHAVE_SLANG_SUPPORT -DHAVE_GTK2_SUPPORT -DHAVE_LIBPERL_SUPPORT -DHAVE_TIMERFD_SUPPORT -DHAVE_LIBPYTHON_SUPPORT -DHAVE_CPLUS_DEMANGLE_SUPPORT -DHAVE_LIBBFD_SUPPORT -DHAVE_ZLIB_SUPPORT -DHAVE_LZMA_SUPPORT -DHAVE_BACKTRACE_SUPPORT -DHAVE_LIBNUMA_SUPPORT -DHAVE_KVM_STAT_SUPPORT -DHAVE_PERF_READ_VDSO32 -DHAVE_AUXTRACE_SUPPORT -D"BUILD_STR(s)=$(pound)s" -c -o util/sort.o util/sort.c

source_util/sort.o := util/sort.c

deps_util/sort.o := \
  /usr/include/stdc-predef.h \
  /usr/include/errno.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-64.h \
  /usr/include/bits/errno.h \
  /usr/include/linux/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/../../arch/x86/include/uapi/asm/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/errno.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/errno-base.h \
  /usr/include/inttypes.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/bits/wchar.h \
  /usr/include/regex.h \
  /usr/include/sys/types.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/time.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/bits/byteswap.h \
  /usr/include/bits/byteswap-16.h \
  /usr/include/sys/select.h \
  /usr/include/bits/select.h \
  /usr/include/bits/sigset.h \
  /usr/include/bits/time.h \
  /usr/include/bits/select2.h \
  /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/mman.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/mman.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/mman.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/mman-common.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/hugetlb_encode.h \
  util/sort.h \
  util/../builtin.h \
  util/../util/util.h \
  /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h \
  /usr/include/bits/fcntl-linux.h \
  /usr/include/bits/uio.h \
  /usr/include/linux/falloc.h \
  /usr/include/bits/stat.h \
  /usr/include/bits/fcntl2.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdbool.h \
  /usr/include/stdlib.h \
  /usr/include/bits/waitflags.h \
  /usr/include/bits/waitstatus.h \
  /usr/include/xlocale.h \
  /usr/include/alloca.h \
  /usr/include/bits/stdlib-float.h \
  /usr/include/bits/stdlib.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/compiler.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/compiler-gcc.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/types.h \
  /usr/include/asm/types.h \
  /usr/include/asm-generic/types.h \
  /usr/include/asm-generic/int-ll64.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/../../arch/x86/include/uapi/asm/bitsperlong.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/asm-generic/bitsperlong.h \
  /usr/include/asm/posix_types.h \
  /usr/include/asm/posix_types_64.h \
  /usr/include/asm-generic/posix_types.h \
  util/color.h \
  /usr/include/stdio.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \
  /usr/include/bits/stdio.h \
  /usr/include/bits/stdio2.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/list.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/poison.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/kernel.h \
  /usr/include/assert.h \
  /usr/include/byteswap.h \
  util/cache.h \
  util/strbuf.h \
  /usr/include/string.h \
  /usr/include/bits/string.h \
  /usr/include/bits/string2.h \
  /usr/include/bits/string3.h \
  /home/zbl/prepap/monitoring/linux/tools/lib/subcmd/pager.h \
  util/../ui/ui.h \
  /usr/include/pthread.h \
  /usr/include/sched.h \
  /usr/include/bits/sched.h \
  /usr/include/bits/timex.h \
  /usr/include/bits/setjmp.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/string.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/rbtree.h \
  /usr/include/linux/stddef.h \
  util/map_symbol.h \
  util/symbol_conf.h \
  util/callchain.h \
  util/event.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/limits.h \
  /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/syslimits.h \
  /usr/include/limits.h \
  /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h \
  /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h \
  /usr/include/bits/xopen_lim.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/bpf.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/bpf_common.h \
  util/../perf.h \
  /home/zbl/prepap/monitoring/linux/tools/include/uapi/linux/perf_event.h \
  /usr/include/linux/ioctl.h \
  /usr/include/asm/ioctl.h \
  /usr/include/asm-generic/ioctl.h \
  /usr/include/asm/byteorder.h \
  /usr/include/linux/byteorder/little_endian.h \
  /usr/include/linux/swab.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/util/include/asm/swab.h \
  util/../perf-sys.h \
  /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h \
  /usr/include/bits/environments.h \
  /usr/include/bits/confname.h \
  /usr/include/getopt.h \
  /usr/include/bits/unistd.h \
  /usr/include/sys/syscall.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/unistd.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/asm/unistd_64.h \
  /usr/include/bits/syscall.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/barrier.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/../../arch/x86/include/asm/barrier.h \
  util/../util/target.h \
  util/build-id.h \
  util/tool.h \
  util/perf_regs.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/arch/x86/include/perf_regs.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/uapi/asm/perf_regs.h \
  util/branch.h \
  util/values.h \
  util/debug.h \
  util/../ui/helpline.h \
  util/../ui/../util/cache.h \
  util/../ui/progress.h \
  util/../ui/util.h \
  util/header.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/bitmap.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/bitops.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/bits.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/__ffs.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/__ffz.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/fls.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/__fls.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/fls64.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/find.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/hweight.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/arch_hweight.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/const_hweight.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/atomic.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm-generic/bitops/non-atomic.h \
  util/env.h \
  util/cpumap.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/refcount.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/atomic.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/atomic.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/../../arch/x86/include/asm/atomic.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/../../arch/x86/include/asm/rmwcc.h \
  /home/zbl/prepap/monitoring/linux/tools/arch/x86/include/asm/cmpxchg.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/perf.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/util/debug.h \
  util/pmu.h \
  util/parse-events.h \
  /home/zbl/prepap/monitoring/linux/tools/lib/subcmd/parse-options.h \
  util/hist.h \
  util/evsel.h \
  util/xyarray.h \
  util/counts.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/ui/progress.h \
  util/../ui/keysyms.h \
  util/../ui/libslang.h \
  /usr/include/slang/slang.h \
  util/srcline.h \
  util/comm.h \
  util/map.h \
  util/symbol.h \
  util/path.h \
  /usr/include/libelf.h \
  /usr/include/elf.h \
  /usr/include/gelf.h \
  util/dso.h \
  util/rwsem.h \
  util/thread.h \
  util/srccode.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/util/strlist.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/util/rblist.h \
  /home/zbl/prepap/monitoring/linux/tools/perf/util/intlist.h \
  util/evlist.h \
  /home/zbl/prepap/monitoring/linux/tools/lib/api/fd/array.h \
  util/mmap.h \
  /home/zbl/prepap/monitoring/linux/tools/include/linux/ring_buffer.h \
  /usr/include/aio.h \
  /usr/include/bits/siginfo.h \
  util/auxtrace.h \
  util/session.h \
  util/trace-event.h \
  /home/zbl/prepap/monitoring/linux/tools/lib/traceevent/event-parse.h \
  /home/zbl/prepap/monitoring/linux/tools/lib/traceevent/trace-seq.h \
  /home/zbl/prepap/monitoring/linux/tools/lib/traceevent/trace-seq.h \
  util/machine.h \
  util/map_groups.h \
  util/data.h \
  util/ordered-events.h \
  util/util.h \
  /usr/include/signal.h \
  /usr/include/bits/signum.h \
  /usr/include/bits/sigaction.h \
  /usr/include/bits/sigcontext.h \
  /usr/include/bits/sigstack.h \
  /usr/include/sys/ucontext.h \
  /usr/include/bits/sigthread.h \
  util/strlist.h \
  util/mem-events.h \
  util/stat.h \
  /usr/include/sys/time.h \
  /usr/include/sys/resource.h \
  /usr/include/bits/resource.h \
  /usr/include/sys/wait.h \
  util/rblist.h \
  util/annotate.h \
  /home/zbl/prepap/monitoring/linux/tools/include/asm/bug.h \

util/sort.o: $(deps_util/sort.o)

$(deps_util/sort.o):
