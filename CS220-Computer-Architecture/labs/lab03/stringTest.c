#include <stdio.h>


#include "stringLib.h"

int main(int argc,char **argv) {

	char * str1="This is a test. ";
	// str1 is a pointer to a literal string
	// It is declared as "const" to indicate it cannot be changed
	char str2[100]="This is only a test. ";
	// str2 is an array of 100 characters initialized to
	//   the string "This is only a test. "
	//   Since "This is only a test. " is shorter than 100 characters
	//   the remainder of str2 is filled with 0's
	char * str3="For the next sixty seconds, close your ears!";
	// str3 is a pointer to a literal string, as above
	char str4[100]={0};
	// str4 is an array of 100 characters, initialized to 0
	// The first character is explicitly initialized.
	// Since the initializer is less than 100 chars, the
	// remaining characters are initialized to 0x00

	printf("str1 length=%d\n",stringLength(str1));
	printf("str2 length=%d\n",stringLength(str2));
	printf("str3 length=%d\n",stringLength(str3));

	stringCopy(str4,str1);
	printf("after copy str1->str4, str4=%s\n",str4);

	stringCat(str4,str2);
	printf("after cat str4+str2, str4=%s\n",str4);

	stringCat(str4,str3);
	printf("after cat str4+str3, str4=%s\n",str4);
	return 0;
}
