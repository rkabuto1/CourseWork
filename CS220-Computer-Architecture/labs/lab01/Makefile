CC = gcc
CFLAGS = -Wall -ggdb

test : addArgs
	./addArgs 3 12 abc 4

gdb : addArgs
	gdb --args ./addArgs 3 12 abc 4	
	
clean :
	-rm addArgs