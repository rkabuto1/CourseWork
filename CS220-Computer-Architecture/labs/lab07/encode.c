#include <stdio.h>
int encode(int in,char keyVal);

int main(int argc, char **argv) {
	char * key=argv[1];
	int keyPos=0;
	while(!feof(stdin)) {
		int next=getchar();
		if (next==EOF) break;
		putchar(encode(next,key[keyPos]));
		keyPos++;
		if (key[keyPos]=='\0') keyPos=0;
	}
	return 0;
}

int encode(int in,char keyVal) {
	if (in<0x20 || in>0x80) return in; // Leave special chars unchanged
	int result=in&0xF; // Extract the last four bits from in
	result+=keyVal & 0x0F; //
	if (result>=16) result-=16;
	result |=(in & 0xF0); // reset the left nibble
	return result;
}