#include <stdio.h>

int main(int argc, char **argv) {

	int x=7; int y=-1;

	if (x>4) x++;
	else x--;
	y=x;

	while(x>6) {
		x--;
		y++;
	}

	do {
		x++;
		y--;
	} while(x<10);

	for(y=7;y>x;y-=2) {
		x++;
	}

	return 0;
}
