#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(void) {
    pid_t found_pid = fork();  
    switch (found_pid) {
        case -1:
            perror("Error");
            return 1;
        case 0:
            printf("IN CHILD: pid=%d\n", getpid());
            execlp("ls", "ls", "-l", "-a", NULL);
            perror("Error");
            return 1;
        default:
            {
                int s;
                waitpid(found_pid, &s, 0);
                printf("In PARENT: successfully waited child (pid=%d)\n", found_pid);
            }
    }
    return 0;
}

