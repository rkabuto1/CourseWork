#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/types.h>
//---------------------------------------------------------------------------------------------------
// To calculate the difference between two timevals:
//    timeval_subtract(&diff, &end, &start)
// ------
// Subtract the ‘struct timeval’ values X and Y,
// storing the result in RESULT.
// Return 1 if the difference is negative, otherwise 0.
// source: https://www.gnu.org/software/libc/manual/html_node/Elapsed-Time.html
//-------------------------------------------------Given Code From Lab------------------------------------------
int timeval_subtract (struct timeval *result, struct timeval *x, struct timeval *y)
{
  //Perform the carry for the later subtraction by updating y. 
  if (x->tv_usec < y->tv_usec) {
    int nsec = (y->tv_usec - x->tv_usec) / 1000000 + 1;
    y->tv_usec -= 1000000 * nsec;
    y->tv_sec += nsec;
  }
  if (x->tv_usec - y->tv_usec > 1000000) {
    int nsec = (x->tv_usec - y->tv_usec) / 1000000;
    y->tv_usec += 1000000 * nsec;
    y->tv_sec -= nsec;
  }
  // Compute the time remaining to wait. tv_usec is certainly positive
  result->tv_sec = x->tv_sec - y->tv_sec; 
  result->tv_usec = x->tv_usec - y->tv_usec;
  return x->tv_sec < y->tv_sec; /// Return 1 if result is negative.
}
//---------------------------------------------------------------------------------------------------
// TODO: Add you implementation here
// Use the following print statement to output the reslts once you've calcualted the time of execution 
// (Example, diff)
// USE THE FOLLOWING COMMAND TO COMPILE:
// gcc timer.c -o timer
//------------------------------------TODO Implementation---------------------------------------------
int main(int argc, char *argv[]) {
    struct timeval beg, finish, x;
    pid_t pid = fork();

    if (argc < 2) {
        fprintf(stderr, "Invalid Command Line: %s Command Space Argument\n", argv[0]);
        return 1;
    }

    switch (pid) {
        case -1: 
            printf("error.");
            return 1;

        case 0:  
            gettimeofday(&beg, NULL);
            execvp(argv[1], &argv[1]);
            fprintf(stderr, "The Command you wrote \"%s\" does not exist.\n", argv[1]);
            exit(1);

        default:  
            gettimeofday(&beg, NULL);
            printf("The Parent (%d) Created Child -> (%d)\n", getpid(), pid);
            wait(NULL);

            gettimeofday(&finish, NULL);
            timeval_subtract(&x, &finish, &beg);
            printf("Our Running Time For Program: %ld.%04ld (s)\n", x.tv_sec, x.tv_usec / 1000);
            break;
    }
    return 0;
}
//----------------------------------------------------------------------------------------------------
