CC = gcc
CFLAGS = -Wall -std=c18 -ggdb

test : showFloat 
	./showFloat 1 0 3.14 6.23e22
	
gdb : showFloat
	gdb --args ./showFloat 1
	
showFloat : showFloat.c bitFields.c bitFields.h	
	$(CC) $(CFLAGS) -o showFloat showFloat.c bitFields.c
	
clean :
	-rm showFloat