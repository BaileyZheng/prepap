#include <Python.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <dirent.h>
#ifndef _REENTRANT
#define _REENTRANT
#endif
#include <pthread.h>
#include <stdbool.h>
#include <semaphore.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "papi_test.h"
#include "mydetection.h"

#define MAXLENGTH 32769
#define MAX_CMD_SIZE 2048
#define MAX_EVENTS 50
#define MAX_STR_LEN PAPI_MAX_STR_LEN
#define MAX_PATH_CHAR_SIZE 4096
#define NUMEVENTS 4
#define QUEUELENGTH 65535

#define DEBUG
#define FILTER_EXCEPTION
/*
# ifndef __ASSEMBLER__
extern int *__errno_location(void) __THROW __attribute__ ((__const__));
#  if !defined _LIBC || defined _LIBC_REENTRANT
#   define errno (*__errno_location())
#  endif
# endif*/
void init();

void produce_pid();
void mon_danger();
void mon_short();
void mon_long();

void monhpc( int pid,int fromque);
void resolve_prediction(int tpid,int fromque,int *count_attack,int *count_pval,int dres);
void addElemToQue(int quenum,int value);
int delElemFromQue(int quenum);
void printQues();
//bool check_exists(int pid);
bool check_running(int pid);
void wait4children(int signo);
char* itos(int in,char* res);
