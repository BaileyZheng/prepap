#include "online_monitor.h"
//#define DEBUG_QUEUE

jmp_buf exp1;

pid_t cur_pid;
int WIN_SIZE=31;
int Q1_WIN_NUM=50000;
int Q2_WIN_NUM=30;
int pids[1+MAXLENGTH>>5];
int queue1[QUEUELENGTH];
int start1=0;
int end1=0;
int size1=0;
int queue2[QUEUELENGTH];
int start2=0;
int end2=0;
int size2=0;
int queue3[QUEUELENGTH];
int start3=0;
int end3=0;
int size3=0;
int white_ksmtuned=-1;
pthread_mutex_t mut0;
pthread_mutex_t mut1;
pthread_mutex_t mut2;
pthread_mutex_t mut3;
pthread_mutex_t mut4;
pthread_mutex_t mut5;
int interval=0;
DIR* dir;
int eventSet=PAPI_NULL;
char *events[NUMEVENTS]={"PAPI_L3_LDM","PAPI_L3_TCA","PAPI_TOT_CYC","PAPI_TOT_INS"};
const char perf_usage_string[] = "perf [--version] [--help] [OPTIONS] COMMAND [ARGS]";

const char perf_more_info_string[] = "See 'perf help COMMAND' for more information on a specific command.";

const char *input_name;

static void pthread__block_sigwinch(void){
	sigset_t set;
	sigemptyset(&set);
	sigaddset(&set, SIGWINCH);
	pthread_sigmask(SIG_BLOCK, &set, NULL);
}

void pthread__unblock_sigwinch(void){
	sigset_t set;
	sigemptyset(&set);
	sigaddset(&set, SIGWINCH);
	pthread_sigmask(SIG_UNBLOCK, &set, NULL);
}

int main(int argc, char* argv[]){
	init();
	if(argc==4){
		Q1_WIN_NUM=atoi(argv[1]);
		Q2_WIN_NUM=atoi(argv[2]);
		WIN_SIZE=atoi(argv[3]);
	}
#ifdef DEBUG
	printf("current pid:%d\n",cur_pid);
	printf("q1_num:%d, q2_num:%d, win_size:%d\n",Q1_WIN_NUM,Q2_WIN_NUM,WIN_SIZE);
#endif
	create_pthread_ok();
	pthread_mutex_destroy(&mut0);
	pthread_mutex_destroy(&mut1);
	pthread_mutex_destroy(&mut2);
	pthread_mutex_destroy(&mut3);
	pthread_mutex_destroy(&mut4);
	pthread_mutex_destroy(&mut5);
	Py_Finalize();
	int retval = PAPI_cleanup_eventset(eventSet);
	if(retval!=PAPI_OK){
		handle_error("PAPI_cleanup_eventset");
		return;
	}
	retval = PAPI_destroy_eventset(&eventSet);
	if(retval!=PAPI_OK){
		handle_error("PAPI_destroy_eventset");
		return;
	}
        return 0;
}

void produce_pid(){
	struct dirent *next;
        while(1){
		int i;
#ifdef DEBUG //_QUEUE
//		printQues();
#endif
		dir=opendir("/proc");
		if(!dir)continue;
		int newpids[1+MAXLENGTH>>5];
		memset(newpids,0,sizeof(newpids));
		while((next=readdir(dir))!=NULL){
			if(isdigit(next->d_name[0])){
				int idx=atoi(next->d_name);
				if((pids[idx>>5]&(1<<(idx&0x1F)))==0&&check_exists(idx)){
					if(size1<QUEUELENGTH){
						pthread_mutex_lock(&mut1);
						queue1[end1]=idx;
						end1=(end1+1)&QUEUELENGTH;
						size1++;
						pthread_mutex_unlock(&mut1);
						pthread_mutex_lock(&mut5);
						queue3[end3]=idx;
						end3=(end3+1)&QUEUELENGTH;
						size3++;
						pthread_mutex_unlock(&mut5);
					}
				}
				newpids[idx>>5]|=(1<<(idx&0x1F));
			}
//			fprintf(stdout,"-_-");
		}
		closedir(dir);
//		fprintf(stdout,"-_-");
		for(i=0;i<1+MAXLENGTH>>5;i++)pids[i]=newpids[i];
//		usleep(1000);
	}
}

void mon_short(){
	while(1){
		printQues();
		if(size1>0){
			pthread_mutex_lock(&mut1);
			if(size1<=0){
				pthread_mutex_unlock(&mut1);
				continue;
			}
			int t=queue1[start1];
			start1=(start1+1)&QUEUELENGTH;
			size1--;
			pthread_mutex_unlock(&mut1);
			if(!check_exists(t))continue;			
			pthread_mutex_lock(&mut3);
			monhpc(t,1);
			pthread_mutex_unlock(&mut3);
#ifdef DEBUG_QUEUE
			int i=0;
			if(size1>0){
				printf("\033[0;34m\n1th queue:");
				if(start1<end1){
					for(i=start1;i<end1;i++){
						printf("%d ",queue1[i]);
					}
				}else{
					for(i=start1,i<QUEUELENGTH;i++){
						printf("%d ",queue1[i]);
					}
					for(i=0;i<end1;i++){
						printf("%d ",queue1[i]);
					}
				}
				printf("\033[0m");
			}
#endif
#ifdef FILTER_EXCEPTION
			if(setjmp(exp1)==0){
//				printf("\nsomething error\n");
				longjmp(exp1,1);
			}
#endif		
//		}else{
//			usleep(100);
		}
	}
}

void mon_long(){
	while(1){
		printQues();
		if(size2==0)continue;
		pthread_mutex_lock(&mut2);
		if(size2<=0){
			pthread_mutex_unlock(&mut2);
			continue;
		}
		int t=queue2[start2];
		start2=(start2+1)&QUEUELENGTH;
		size2--;
//		fprintf(stdout,"mon_long,delete. start2=%d,end2=%d,size2=%d\n",start2,end2,size2);
		pthread_mutex_unlock(&mut2);
		if(!check_exists(t))continue;
		pthread_mutex_lock(&mut3);
		monhpc(t,2);
		pthread_mutex_unlock(&mut3);
#ifdef DEBUG_QUEUE
		int i=0;
		if(size2>0){
			printf("\033[0;34m\n2th queue:");
			if(start2<end2){
				for(i=start2;i<end2;i++){
					printf("%d ",queue2[i]);
				}
			}else{
				for(i=start2;i<QUEUELENGTH;i++){
					printf("%d ",queue2[i]);
				}
				for(i=0;i<end2;i++){
					printf("%d ",queue2[i]);
				}
			}
			printf("\033[0m");
		}
#endif
#ifdef FILTER_EXCEPTION
		if(setjmp(exp1)==0){
//			printf("\nsomething error\n");
			longjmp(exp1,1);
		}
#endif
	}
}

void mon_syscall(){
	while(1){
		if(size3==0)continue;
		pthread_mutex_lock(&mut5);
		if(size3<=0){
			pthread_mutex_unlock(&mut5);
			continue;
		}
		int t=queue3[start3];
		start3=(start3+1)&QUEUELENGTH;
		size3--;
		pthread_mutex_unlock(&mut5);
		if(!check_exists(t))continue;
		int argc=2;
		const char **argv;
		argv[0]="syscalls:sys_enter_sched_yield";
		char pstr[10];
		argv[1]=itos(t,pstr);
		pthread__block_sigwinch();
		int status=cmd_stat(argc,argv);
		fprintf(stdout,"status:%d\n",status);
		if(status==10000){
			kill(t,SIGTSTP);
			call_PIN_tool(t);
			kill(t,SIGCONT);
		}
	}
}

void handle_error(char* msg){
	fprintf(stdout,"%s error!\n",msg);
}

void monhpc( int tpid,int fromque)
{
//	printf("%d\n",tpid);
	pid_t pidt=tpid;
        if (pidt<=0) {
#ifdef DEBUG
            fprintf(stderr, "Please specify a PID to attach\n");
#endif
	    return;
        }
        int numEventSets = 1; 
        int idx;
        int retval;
	int iterations=-1;
	if(fromque==1)
	        iterations=Q1_WIN_NUM*WIN_SIZE;
	else if(fromque==2)
		iterations=Q2_WIN_NUM*WIN_SIZE;
	if(!check_exists(pidt))return;
        retval = PAPI_attach( eventSet, ( unsigned long ) pidt );
        if ( retval != PAPI_OK ){
//		handle_error("PAPI_attach");
		return;
	}
        long long **values=NULL;
	pthread_mutex_lock(&mut0);
	values=(long long ** )malloc((size_t)numEventSets*sizeof(long long * ));
	pthread_mutex_unlock(&mut0);
	if( values == NULL )exit( 1 );
	memset( values, 0x0, ( size_t ) numEventSets * sizeof ( long long * ) );
	for ( idx = 0; idx < numEventSets; idx++ ) {
		pthread_mutex_lock(&mut4);
		values[idx] =( long long * ) malloc( ( size_t ) NUMEVENTS * sizeof ( long long ) );
		pthread_mutex_unlock(&mut4);
		if ( values[idx] == NULL )exit( 1 );
		memset( values[idx], 0x00, ( size_t ) NUMEVENTS* sizeof ( long long ) );
	}
        retval = PAPI_start( eventSet );
        if ( retval != PAPI_OK ){
//		handle_error("PAPI_start");
		return;
	}
	bool isalive=check_exists(tpid);
	long long arr[WIN_SIZE+1][NUMEVENTS];
        for (idx = 0; isalive&&idx < iterations; idx++) {
//            usleep(interval);
	    retval = PAPI_read( eventSet, values[0] );
	    if ( retval != PAPI_OK ){
//		handle_error("PAPI_read");
		break;
	    }
	    retval = PAPI_reset( eventSet );
	    if ( retval != PAPI_OK ){
//		handle_error("PAPI_reset");
		break;
	    }
            if (interval > 0)
                usleep(interval);
	    int i=0;
	    for(i=0;i<NUMEVENTS;i++){
		arr[idx&WIN_SIZE][i]=values[0][i];
//		fprintf(stdout,"%d,",arr[idx&WIN_SIZE][i]);
	    }
//	    fflush(stdout);
	    if((idx&WIN_SIZE)==WIN_SIZE){
		    int dres=detection(WIN_SIZE+1,NUMEVENTS,arr);
		    if(dres==-1)continue;
		    resolve_prediction(pidt,fromque,dres);
		    fflush(stdout);
	    }
            if (kill(pidt, 0) < 0) {
                if (errno == ESRCH) {
			isalive=false;
			break;
                }
            }
        }
	if((idx&WIN_SIZE)>=(WIN_SIZE>>1)){
		int dres=detection(idx&WIN_SIZE,NUMEVENTS,arr);
	    	if(dres!=-1){
			resolve_prediction(pidt,fromque,dres);
		}
	    	fflush(stdout);
	}
	if(isalive&&!check_white(pidt)){
		pthread_mutex_lock(&mut2);
		if(size2<QUEUELENGTH){
			queue2[end2]=pidt;
			end2=(end2+1)&QUEUELENGTH;
			size2++;
//			fprintf(stdout,"monhpc,add. start2=%d,end2=%d,size2=%d\n",start2,end2,size2);
		}
		pthread_mutex_unlock(&mut2);
	}
	if(values!=NULL&&values[0]!=NULL){
		retval = PAPI_stop( eventSet, values[0]);
		if ( retval != PAPI_OK ){
		//		handle_error("PAPI_stop");
			return;
		}
	}
	retval=PAPI_detach(eventSet);
	if(retval!=PAPI_OK){
//		handle_error("PAPI_detach");
		return;
	}
/*	if(values){
		for(idx=0;idx<numEventSets;idx++)
			free(values[idx]);
		free(values);
	}*/
}

void resolve_prediction(int tpid,int fromque,int dres){
	if(dres==0){
		fprintf(stdout,"\n\033[0;32mpid:%d,prediction_result:%d,fromqueue:%d\n\033[0m",tpid,dres,fromque);
	}else{ 
//		if(dres==1){
//			fprintf(stdout,"\n\033[0;33mpid:%d,prediction_result:%d,fromqueue:%d\n\033[0m",tpid,dres,fromque);
//		}else{
			kill(tpid,SIGTSTP);
			call_PIN_tool(tpid);
			kill(tpid,SIGCONT);
//			if(dres==2){
//				fprintf(stdout,"\n\033[0;35mpid:%d,prediction_result:%d,fromqueue:%d\n\033[0m",tpid,dres,fromque);
//			}else{
//			    	fprintf(stdout,"\n\033[31mpid:%d,prediction_result:%d,fromqueue:%d\n\033[0m",tpid,dres,fromque);
//			}
//		}
	}
}

void call_PIN_tool(int pid){
	char pstr[10];
	char *pidstr=itos(pid,pstr);
	char path[100];
	strcpy(path,"/proc/");
	strcat(path,pidstr);
	strcat(path,"/status");
	int len,uid,n,fd=open(path,O_RDONLY|O_NOATIME);
	char buf[4096],whitespace[50];
	if(0<(len=read(fd,buf,4096))){
		n=sscanf(buf,"Uid:%s%d ",whitespace,&uid);
	}
	close(fd);
	struct passwd *pws;
	pws=getpwuid(uid);
	char *username=pws->pw_name;
	FILE *fstream=NULL;
	char cmd[1024];
	strcpy(cmd,"runuser -l ");
	strcat(cmd,username);
	strcat(cmd," -c ");
	strcat(cmd,"'/home/zbl/pin/pin -pid ");
	strcat(cmd,pidstr);
	strcat(cmd," -t /home/zbl/pin/source/tools/MyPinTool/obj-intel64/detect_attacks.so'");
	fstream=popen(cmd,"r");
	pclose(fstream);
}

void printQues(){
	int i=0;
	if(size1>0){
//		printf("\033[0;34m\n1th queue:");
		fprintf(stdout,"start1:%d,end1:%d,size1:%d\n",start1,end1,size1);
		if(start1<=end1){
			for(i=start1;i<end1;i++){
				printf("%d ",queue1[i]);
			}
		}else{
			for(i=start1;i<QUEUELENGTH;i++){
				printf("%d ",queue1[i]);
			}
			for(i=0;i<end1;i++){
				printf("%d ",queue1[i]);
			}
		}/**/
//		printf("\033[0m");
	}
	if(size2>0){
//		printf("\033[0;34m\n2th queue:");
		fprintf(stdout,"start2:%d,end2:%d,size2:%d\n",start2,end2,size2);
		if(start2<=end2){
			for(i=start2;i<end2;i++){
				printf("%d ",queue2[i]);
			}
		}else{
			for(i=start2;i<QUEUELENGTH;i++){
				printf("%d ",queue2[i]);
			}
			for(i=0;i<end2;i++){
				printf("%d ",queue2[i]);
			}
		}/**/
//		printf("\033[0m");
	}
	fflush(stdout);
}

void init(){
//init white list---------------------------------------
	printf("Initializing white list....\n");
	FILE *fstream=NULL;
        char buff[10];
        memset(buff,0,sizeof(buff));
	fstream=popen("pgrep ksmtuned","r");
	if(fstream==NULL){
	       return;
	}
	while(fgets(buff,sizeof(buff),fstream)!=NULL){
		white_ksmtuned=atoi(buff);
	}
	pclose(fstream);
	cur_pid=getpid();
	printf("White list initialized!\n");
//init mutex lock-------------------------------------------
	printf("Initializing locks....\n");
	pthread_mutex_init(&mut0,NULL);
	pthread_mutex_init(&mut1,NULL);
	pthread_mutex_init(&mut2,NULL);
	pthread_mutex_init(&mut3,NULL);
	pthread_mutex_init(&mut4,NULL);
	pthread_mutex_init(&mut5,NULL);
	printf("Locks initialized!\n");	

//init python---------------------------------------------
	printf("Initializing python detection module....\n");
	Py_Initialize();
	initmydetection();
	printf("Python detection module initialized!\n");
	
//init Papi----------------------------------------------
	printf("Initializing papi....\n");
	int retval;
	const PAPI_hw_info_t *hw_info;
	const PAPI_component_info_t *cmpinfo;
	retval = PAPI_library_init( PAPI_VER_CURRENT );
	if ( retval != PAPI_VER_CURRENT )
		test_fail( __FILE__, __LINE__, "PAPI_library_init", retval );
	if ( ( cmpinfo = PAPI_get_component_info( 0 ) ) == NULL )
		test_fail( __FILE__, __LINE__, "PAPI_get_component_info", 0 );
	if ( cmpinfo->attach == 0 )
		test_skip( __FILE__, __LINE__, "Platform does not support attaching", 0 );
	hw_info = PAPI_get_hardware_info(  );
	if ( hw_info == NULL )
		test_fail( __FILE__, __LINE__, "PAPI_get_hardware_info", 0 );
	printf("Papi initialized!\n");

//init eventset----------------------------------------
	printf("Initializing eventset....\n");
	retval = PAPI_create_eventset(&eventSet);
	if(retval!=PAPI_OK){
		handle_error("PAPI_create_eventset");
	}
	retval = PAPI_assign_eventset_component(eventSet, 0 );
	if(retval!=PAPI_OK){
		handle_error("PAPI_assign_eventset_component");
	}
	int idx;
	for(idx=0;idx<NUMEVENTS;idx++){
		int eventCode = 0;
		char msg[PAPI_MAX_STR_LEN];
		retval = PAPI_add_named_event(eventSet, events[idx]);
		if(retval!=PAPI_OK)
			handle_error("PAPI_add_named_event");
	}
	printf("Eventset initialized!....\n");

//init pids----------------------------------------------
	printf("Initializing pids....\n");
	struct dirent *next;
	while(1){
		dir=opendir("/proc");
		if(!dir)continue;
		memset(pids,0,sizeof(pids));
		while((next=readdir(dir))!=NULL){
			if(isdigit(next->d_name[0])){
				int idx=atoi(next->d_name);
				if(check_exists(idx))
					pids[idx>>5]|=(1<<(idx&0x1F));
			}
		}
		closedir(dir);
		break;
	}
	printf("Pids initialized!\n");	
}

void create_pthread_ok(){
	int ret=-1;
	pthread_t producer;
	while(1){
		ret=pthread_create(&producer,NULL,(void *)produce_pid,NULL);
		if(ret!=0){
			printf("Failed to create producer...\nTry again...");
		}else{
			printf("Succeed to create producer!\n");
			break;
		}
	}
	pthread_t round_consumer;
	while(1){
		ret=pthread_create(&round_consumer,NULL,(void *)mon_long,NULL);
		if(ret!=0){
			printf("Failed to create round consumer...\nTry again...");
		}else{
			printf("Succeed to create round consumer!\n");
			break;
		}
	}
/*	pthread_t syscall_consumer;
	while(1){
		ret=pthread_create(&syscall_consumer,NULL,(void *)mon_syscall,NULL);
		if(ret!=0){
			printf("Failed to create syscall consumer...\nTry again...");
		}else{
			printf("Succeed to create syscall consumer!\n");
			break;
		}
	}*/
	pthread_t win_consumer1;
	while(1){
		ret=pthread_create(&win_consumer1,NULL,(void *)mon_short,NULL);
		if(ret!=0){
			printf("Failed to create win consumer1...\nTry again...");
		}else{
			printf("Succeed to create win consumer1!\n");
			break;
		}
	}
	pthread_t win_consumer2;
	while(1){
		ret=pthread_create(&win_consumer2,NULL,(void *)mon_short,NULL);
		if(ret!=0){
			printf("Failed to create win consumer2...\nTry again...");
		}else{
			printf("Succeed to create win consumer2!\n");
			break;
		}
	}
	pthread_t win_consumer3;
	while(1){
		ret=pthread_create(&win_consumer3,NULL,(void *)mon_short,NULL);
		if(ret!=0){
			printf("Failed to create win consumer3...\nTry again...");
		}else{
			printf("Succeed to create win consumer3!\n");
			break;
		}
	}
	while(1){
		ret=pthread_join(producer,NULL);
		if(ret!=0){
			printf("Failed to join producer...\nTry again...");
		}else{
			printf("Succeed to join producer!\n");
			break;
		}
	}
	ret=pthread_join(round_consumer,NULL);
//	ret=pthread_join(syscall_consumer,NULL);
	ret=pthread_join(win_consumer1,NULL);
	ret=pthread_join(win_consumer2,NULL);
	ret=pthread_join(win_consumer3,NULL);
}

bool check_exists(int pid){
	if(pid<=0)return false;
	if (kill(pid, 0) < 0) {
	    if (errno == ESRCH) {
		return false;
	    }
	}
	return true;
}

bool check_white(int pid){
	int ppid;
	char filename[100];
	char pstr[10];
	strcpy(filename,"/proc/");
	strcat(filename,itos(pid,pstr));
	strcat(filename,"/stat");
	FILE *f = fopen(filename, "r");
	if(f){
		fscanf(f, "%*d %*s %*c %d",&ppid);
		fclose(f);
		if(ppid==2||ppid==cur_pid||ppid==white_ksmtuned){
			return true;
		}
	}
	return false;
}

char* itos(int in,char* res){
	const char digits[11]="0123456789";
	int t=in;
	res+=10;
	*res='\0';
	while(t){
		*--res=digits[t%10];
		t/=10;
	}
	return res;
}

void wait4children(int signo){
	int status;
	wait(&status);
}
