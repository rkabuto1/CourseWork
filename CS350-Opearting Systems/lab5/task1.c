#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(void) {
    char *argv1[] = {"cat", "Makefile", NULL};
    char *argv2[] = {"head", "-4", NULL};
    //char *argv2[] = {"wc", "-l", NULL}; // Uncomment for part2 of task1.c
    int s;
    setbuf(stdout, NULL);

    int pFD[2];
    if (pipe(pFD) == -1) {
        perror("pipe");
        exit(1);  
    }

    pid_t c_1 = fork();
    switch (c_1) {
        case -1:
            perror("fork");
            exit(1);
        case 0:
            printf("In CHILD-1 (PID=%d): executing command %s...\n", getpid(), argv1[0]);
            fflush(stdout);
            if (dup2(pFD[1], STDOUT_FILENO) == -1) {
                perror("dup2 failed in CHILD-1");
                exit(1);
            }
            close(pFD[0]);
            close(pFD[1]);
            execvp(argv1[0], argv1);
            perror("execvp failed in CHILD-1");
            exit(1);
    }
    pid_t c_2 = fork();
    switch (c_2) {
        case -1:
            perror("fork");
            exit(1);
        case 0:
            printf("In CHILD-2 (PID=%d): executing command %s...\n", getpid(), argv2[0]);
            fflush(stdout);
            if (dup2(pFD[0], STDIN_FILENO) == -1) {
                perror("dup2 failed in CHILD-2");
                exit(1);
            }
            close(pFD[1]);
            close(pFD[0]);
            execvp(argv2[0], argv2);
            perror("execvp failed in CHILD-2");
            exit(1);
    }

    close(pFD[0]);
    close(pFD[1]);

    waitpid(c_1, &s, 0);
    printf("In PARENT (PID=%d): successfully reaped child (PID=%d)\n", getpid(), c_1);
    waitpid(c_2, &s, 0);
    printf("In PARENT (PID=%d): successfully reaped child (PID=%d)\n", getpid(), c_2);
    return 0;
}
