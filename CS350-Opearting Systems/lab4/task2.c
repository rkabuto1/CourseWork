#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Error");
        return 1;
    }
    pid_t found_pid = fork();
    switch (found_pid) {
        case -1:
            perror("Error For Child");
            return 1;
        case 0:
            printf("IN CHILD: pid=%d\n", getpid());
            execvp(argv[1], &argv[1]);
            perror("Error for Exec");
            return 1;
        default:
            {
                int x;
                waitpid(found_pid, &x, 0);
                printf("In PARENT: successfully waited child (pid=%d)\n", found_pid);
            }
    }
    return 0;
}

