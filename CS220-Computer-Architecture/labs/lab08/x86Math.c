#include <stdio.h>
#include <stdlib.h>

int myAdd(int x, int y);
int myMult(int x, int y);
int mySubtract(int x, int y);
int myDivide(int x, int y);

int main(int argc, char **argv) {
	if (argc < 2) {
		printf("Invoke as %s <number>\n",argv[0]);
		return 1;
	}
	int x=atoi(argv[1]);
	int ans=myMult(x,x);
	int term=myMult(4,x);
	ans=mySubtract(ans,term);
	ans=myAdd(ans,4);
	term=mySubtract(x,2);
	int check=myDivide(ans,term);
	printf("x=%d, x squared - 4x + 4 =%d divided by x-2=%d\n",x,ans,check);
	return 0;
}

#ifdef SIMPLE
	int myAdd(int x, int y) { return x+y; }
	int mySubtract(int x, int y) { return x-y; }
	int myMult(int x, int y) { return x*y; }
	int myDivide(int x, int y) { return x/y; }
#else

	int myAdd(int x, int y) {
		int op1=x;
		int op2=y;
		int res=op1+op2;
		return res;
	}

	int mySubtract(int x, int y) {
		int op1=x;
		int op2=y;
		int res=op1-op2;
		return res;
	}

	int myMult(int x, int y) {
		int op1=x;
		int op2=y;
		int res=op1*op2;
		return res;
	}

	int myDivide(int x, int y) {
		int op1=x;
		int op2=y;
		int res=op1/op2;
		return res;
	}
#endif