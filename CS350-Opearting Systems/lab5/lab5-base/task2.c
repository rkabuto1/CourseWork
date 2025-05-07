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
    char *argv3[] = {"wc", "-l", NULL};
    setbuf(stdout, NULL);
    int f_pipe[2]; 
    int e_pipe[2];
    int s;

    if (pipe(f_pipe) == -1) {
        perror("pipe1 failed");
        exit(1);
    }

    pid_t c1 = fork();
    switch (c1) {
        case -1:
            perror("fork failed");
            exit(1);
        case 0:
            printf("In CHILD-1 (PID=%d): executing command %s ...\n", getpid(), argv1[0]);
            if (dup2(f_pipe[1], STDOUT_FILENO) == -1) {
                perror("dup2 failed in CHILD-1");
                exit(1);
            }
            close(f_pipe[0]);
            close(f_pipe[1]);
            execvp(argv1[0], argv1);
            perror("execvp failed in CHILD-1");
            exit(1);
    }

    if (pipe(e_pipe) == -1) {
        perror("pipe2 failed");
        exit(1);
    }

    pid_t c2 = fork();
    switch (c2) {
        case -1:
            perror("fork failed");
            exit(1);
        case 0:
            printf("In CHILD-2 (PID=%d): executing command %s ...\n", getpid(), argv2[0]);
            if (dup2(f_pipe[0], STDIN_FILENO) == -1) {
                perror("dup2 failed in CHILD-2 (stdin)");
                exit(1);
            }
            if (dup2(e_pipe[1], STDOUT_FILENO) == -1) {
                perror("dup2 failed in CHILD-2 (stdout)");
                exit(1);
            }
            close(f_pipe[0]);
            close(f_pipe[1]);
            close(e_pipe[0]);
            close(e_pipe[1]);
            execvp(argv2[0], argv2);
            perror("execvp failed in CHILD-2");
            exit(1);
    }

    close(f_pipe[0]);
    close(f_pipe[1]);

    pid_t c3 = fork();
    switch (c3) {
        case -1:
            perror("fork failed");
            exit(1);
        case 0:
            printf("In CHILD-3 (PID=%d): executing command %s ...\n", getpid(), argv3[0]);
            if (dup2(e_pipe[0], STDIN_FILENO) == -1) {
                perror("dup2 failed in CHILD-3");
                exit(1);
            }
            close(e_pipe[0]);
            close(e_pipe[1]);
            execvp(argv3[0], argv3);
            perror("execvp failed in CHILD-3");
            exit(1);
    }
    close(e_pipe[0]);
    close(e_pipe[1]);

    waitpid(c1, &s, 0);
    printf("In PARENT (PID=%d): successfully reaped child (PID=%d)\n", getpid(), c1);
    waitpid(c2, &s, 0);
    printf("In PARENT (PID=%d): successfully reaped child (PID=%d)\n", getpid(), c2);  
    waitpid(c3, &s, 0);
    printf("In PARENT (PID=%d): successfully reaped child (PID=%d)\n", getpid(), c3);
    return 0;
}
