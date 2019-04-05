#include <Python.h>
#include "test_python_to_call.h"
#include <pthread.h>
pthread_mutex_t count_lock=PTHREAD_MUTEX_INITIALIZER;
void call_python(){
//	pthread_mutex_lock(&count_lock);
	int i=0;
	for(i=0;i<100;i++){
		int a[30][4];
		int j=0;
		for(j=0;j<30;j++){
			a[j][0]=rand()%1000;
			a[j][1]=rand()%1000;
			a[j][2]=rand()%1000;
			a[j][3]=rand()%1000;
		}
		printf("%d\n",test_function(a,30,4));
	}	
//	pthread_mutex_unlock(&count_lock);
	return;
}
int main(int argc, char *argv[]){
	int i=0;
	Py_Initialize();
	inittest_python_to_call();
	for(i=0;;i++){
		int temp;
		int ret;
		void *retval;
		pthread_t producer;
		ret=pthread_create(&producer,NULL,(void *)call_python,NULL);
		if(ret!=0){
			printf("failed to create a thread\n");
		}else{
			printf("create succeed\n");
		}
		temp=pthread_join(producer,&retval);
		if(temp!=0){
			printf("cannot join with the thread\n");
		}else{
			printf("join succeed\n");
		}
	}
	Py_Finalize();
	return 0;
}
