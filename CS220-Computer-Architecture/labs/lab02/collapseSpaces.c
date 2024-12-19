#include <stdio.h>
#include <stdlib.h> // for atoi

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Please invoke as %s <n>\n", argv[0]);
        return 1; // Indicate something went wrong
    }

    int n = atoi(argv[1]); // Convert the string in argv[1] to an integer

    int nextChar = getchar();
    int consecutiveSpaces = 0; // Counter to track consecutive spaces

    while (nextChar != EOF) {
        if (nextChar == ' ') {
            consecutiveSpaces++; // Increment consecutive spaces count
            if (consecutiveSpaces == n) {
                putchar('\t'); // Replace n consecutive spaces with a tab
                consecutiveSpaces = 0; // Reset consecutive spaces count
            }
        } else {
            // Output any accumulated consecutive spaces
            for (int i = 0; i < consecutiveSpaces; i++) {
                putchar(' ');
            }
            consecutiveSpaces = 0; // Reset consecutive spaces count
            putchar(nextChar); // Output the non-space character
        }
        nextChar = getchar(); // Read the next character
    }
       if(consecutiveSpaces > 0)
	{
	for(int i = 0; i < consecutiveSpaces; i++)
		putchar(' '); 
	}

    return 0;
}

