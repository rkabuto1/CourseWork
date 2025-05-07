#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

#define INPUT_FILE "./input/if1"  
#define OUTPUT_FILE "result"

int main(int argc, char *argv[]) {
    int iFD, oFD, s;
    pid_t pid; 
    if (argc < 2) {
        return 1;
    }  
    iFD = open(INPUT_FILE, O_RDONLY);
    if (iFD < 0) {
        return 1;
    }   
    oFD = open(OUTPUT_FILE, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (oFD < 0) {
        close(iFD);
        return 1;
    }
    switch ((pid = fork())) {
        case -1:
            perror("Error: Fork");
            close(iFD);
            close(oFD);
            return 1;
        case 0:
            printf(">>> In CHILD: pid=%d\n", getpid());
            switch (dup2(iFD, STDIN_FILENO) < 0) {
                case 1:
                    perror("Error: Standard Input");
                    close(iFD);
                    close(oFD);
                    return 1;
            }
            switch (dup2(oFD, STDOUT_FILENO) < 0) {
                case 1:
                    perror("Error: Standard Output");
                    close(iFD);
                    close(oFD);
                    return 1;
            }
            close(iFD);
            close(oFD);
            execvp(argv[1], &argv[1]);
            perror("Error: Exec");
            return 1;
    }
    waitpid(pid, &s, 0);
    printf(">>> In PARENT: successfully waited child (pid=%d)\n", pid);
    close(iFD);
    close(oFD);
    return 0;
}
