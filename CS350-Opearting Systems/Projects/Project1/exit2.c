#include "types.h"
#include "stat.h"
#include "user.h"

/* ATTENTION: to ensure correct compilation of the base code,
   stub functions for the system call user space wrapper functions are provided.
   REMEMBER to disable the stub functions (by commenting the following macro) to
   allow your implementation to work properly. */

// #define STUB_FUNCS
// #ifdef STUB_FUNCS
// void exit2(int status) {}
// #endif

/* IMPORTANT INSTRUCTION: the code below should not be changed.
    Failure to follow this instruction will lead to zero point
    for this part */

int main(int argc, char * argv[])
{
	if(argc != 2){
        printf(1, "Please provide a positive integer argument as a test exit status");
        exit();
    }
    int status = atoi(argv[1]);
    exit2(status); //return 0;
}