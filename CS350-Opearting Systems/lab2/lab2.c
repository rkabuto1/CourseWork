#include "types.h"
#include "user.h"

void echoFunc(int i, int n, char *v[]) {
    if (i >= n) {
        printf(1, "\n");
        return;
    }
    printf(1, "%s ", v[i]);
    echoFunc(i + 1, n, v);
}

int main(int c, char *v[]) {
    if (c < 2) {
        printf(1, "Error, to run Echo: lab2 [your type of string]\n");
        exit();
    }
    echoFunc(1, c, v);
    exit();
}
