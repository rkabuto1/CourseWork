#define _GNU_SOURCE
#include <stdio.h>
#include <ctype.h>


int main(int argc, char **argv) {
	setbuf(stdout,0);
	setbuf(stdin,0);
	int ascii=1;
	int nc=0;
	int pos=0;
	// printf("checking...\n");
	while(ascii) {
		nc=getchar();
		pos++;
		// printf(" %d=%hhx ",pos,nc);
		if (nc==EOF) break;
		if (!isprint(nc) && !isspace(nc) && nc!=0x7f) {
			fprintf(stderr,"Unprintable character %c = 0x%hhx found at position %d\n",nc,nc,pos);
			ascii=0;
		}
		// putchar(nc);
		// fflush(stdout);
	}
	if (ascii) {
		fprintf(stderr,"All characters are ASCII printable characters\n");
		return 0;
	}
	return 1;
}
