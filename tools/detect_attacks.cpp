#include <iostream>
#include <fstream>
#include "pin.H"
#include "xed-iclass-enum.h"
#include <signal.h>
#include <string.h>
ofstream OutFile;

//static UINT64 icount = 0;
static INT32 tpid;
static INT64 fence_count=0;
static INT64 rdtsc_count=0;

VOID kill() {kill(tpid,SIGKILL);}
VOID count_fence(){
	fence_count=fence_count+1;
	if(fence_count>=20)
		kill(tpid,SIGKILL);
}
VOID count_rdtsc(){
	rdtsc_count=rdtsc_count+1;
	if(rdtsc_count>=20)
		kill(tpid,SIGKILL);
}
    
VOID Instruction(INS ins, VOID *v)
{
    if(INS_Opcode(ins)==XED_ICLASS_CLFLUSH){
	    INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)kill, IARG_END);
    }
    else{
	    if(INS_Opcode(ins)==XED_ICLASS_LFENCE||INS_Opcode(ins)==XED_ICLASS_MFENCE||INS_Opcode(ins)==XED_ICLASS_CPUID){
		    INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)count_fence, IARG_END);
	    }
	    else if(INS_Opcode(ins)==XED_ICLASS_RDTSC||INS_Opcode(ins)==XED_ICLASS_RDTSCP){
		    INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)count_rdtsc, IARG_END);
	    }
    }
}

KNOB<string> KnobOutputFile(KNOB_MODE_WRITEONCE, "pintool", "o", "inscount.out", "specify output file name");

VOID Fini(INT32 code, VOID *v)
{
//    OutFile.setf(ios::showbase);
//    OutFile << "fence_Count " << fence_count << endl;
//    OutFile << "rdtsc_Count " << rdtsc_count << endl;
//    OutFile.close();
}

INT32 Usage()
{
    cerr << "This tool counts the number of dynamic instructions executed" << endl;
    cerr << endl << KNOB_BASE::StringKnobSummary() << endl;
    return -1;
}

int main(int argc, char * argv[])
{
    tpid=atoi(argv[5]);

    if (PIN_Init(argc, argv)) return Usage();

//    OutFile.open(KnobOutputFile.Value().c_str());

    INS_AddInstrumentFunction(Instruction, 0);

    PIN_AddFiniFunction(Fini, 0);
    
    PIN_StartProgram();
    
    return 0;
}
