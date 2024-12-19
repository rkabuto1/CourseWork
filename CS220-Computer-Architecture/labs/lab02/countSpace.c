#include <stdio.h>
#include <ctype.h> // for isspace

int main(int argc, char *argv[]) {
	int numWhiteSpace=0; // Initialize number of white space characters to zero
    // See https://man7.org/linux/man-pages/man3/getchar.3.html for documentation of the C library getchar function
    int nextChar=getchar();
    while(nextChar!=EOF) {
        // See https://man7.org/linux/man-pages/man3/isspace.3.html for documentation of the C library function isspace
        if (isspace(nextChar)) numWhiteSpace++;
        // See https://man7.org/linux/man-pages/man3/putchar.3.html for documentation of the C library putchar function
        putchar(nextChar);
        nextChar=getchar();
    }
    // See https://man7.org/linux/man-pages/man3/fprintf.3p.html for documentation of the C fprint library function
    fprintf(stderr,"Found %d whitespace characters.\n",numWhiteSpace);
    return 0;
}
