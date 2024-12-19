#include <stdio.h>
#include <stdlib.h> // for atoi

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Please invoke as %s <n>\n", argv[0]);
        return 1; // Indicate something went wrong
    }
    
    int n = atoi(argv[1]); // Convert the string in argv[1] to an integer
    int nextChar = getchar();
    while (nextChar != EOF) {
        if (nextChar == '\t') {
            // Replace tab character with n spaces
            for (int i = 0; i < n; i++) {
                putchar(' ');
            }
        } else {
            // Output other characters as they are
            putchar(nextChar);
        }
        nextChar = getchar();
    }

    return 0;
}


	// TODO: convert the string in argv[1] into an integer
        // and save the result in "n".
        // Note... look at the atoi C library function!
        // https://man7.org/linux/man-pages/man3/atoi.3p.html


  	// TODO: if nextChar is a tab, write n blanks
        //      Otherwise, write the character to standard output
        //      You can check for a tab using the C literal '\t'
        //      Remember, in C, = is assignment and == is "is equal"
        //      You can write a single blank to stdout using "putchar(' ');"
 
