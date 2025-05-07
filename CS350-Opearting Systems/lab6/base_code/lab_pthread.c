#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int curr = 0;
int arguments = 0;
int total = 0;
char **X;
pthread_mutex_t trap = PTHREAD_MUTEX_INITIALIZER;
pthread_t t1, t2;

void *thread_work(void *arg) {
    int Thread1 = (int)(long)arg;
    long *self_counter = malloc(sizeof(long));
    *self_counter = 0;
    int loop = 1;

    while (loop) {
        pthread_mutex_lock(&trap);
        if (curr >= total) {
            pthread_mutex_unlock(&trap);
            loop = 0;
            continue;
        }
        curr++;
        printf("%d: In thread %d (TID=%lu): ", curr, Thread1, pthread_self());
        switch (Thread1) {
            case 1:
                for (int i = 0; i < arguments; ++i)
                    printf("%s ", X[i]);
                break;
            case 2:
                for (int i = arguments - 1; i >= 0; --i)
                    printf("%s ", X[i]);
                break;
            default:
                printf("Error");
                break;
        }
        printf("\n");
        (*self_counter)++;
        pthread_mutex_unlock(&trap);
    }
    return (void *)self_counter;
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("There must be 2 arguments following the binary!\n");
        return 0;
    }
    total = atoi(argv[1]);
    arguments = argc - 2;
    X = argv + 2;

    void *t1_ret;
    void *t2_ret;

    pthread_create(&t1, NULL, thread_work, (void *)1);
    pthread_create(&t2, NULL, thread_work, (void *)2);
    pthread_join(t1, &t1_ret);
    pthread_join(t2, &t2_ret);
    printf("In main thread: T1 printed %ld times. T2 printed %ld times.\n", *(long *)t1_ret, *(long *)t2_ret);
    
    free(t1_ret);
    free(t2_ret);
    return 0;
}
