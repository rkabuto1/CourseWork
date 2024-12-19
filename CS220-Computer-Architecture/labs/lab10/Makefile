CC = gcc
CFLAGS = -Wall -std=c18 -ggdb -O0
	
gdb : tryList
	gdb --command=gdb_cmds.txt --args ./tryList 12 45 10 21 32 12 61
	
tryList : tryList.c node.c node.h list.c list.h
	${CC} ${CFLAGS} -o tryList tryList.c node.c list.c

clean: 
	-rm tryList 