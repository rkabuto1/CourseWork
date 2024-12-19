CC = gcc
CFLAGS = -Wall -std=c18 -ggdb

test : testA testP
	
testA : strTestA
	./strTestA
	
testP: strTestP
	./strTestP
	
strTestA : stringTest.c stringLibA.c stringLib.h
	$(CC) $(CFLAGS) -o strTestA  stringTest.c stringLibA.c
	
strTestP : stringTest.c stringLibP.c stringLib.h 
	$(CC) $(CFLAGS) -DPOINTER_NOTATION -o strTestP stringTest.c stringLibP.c

clean :
	-rm strTestA strTestP