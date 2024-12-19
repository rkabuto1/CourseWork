CC = gcc
CFLAGS = -Wall -std=c18 -ggdb -O0

test : x86Math
	./x86Math 7

%.s : %.c ; ${CC} ${CFLAGS} -S -fverbose-asm $<

gdb : x86Math
	gdb --command=gdb_cmds.txt -args ./x86Math 7
	
clean :
	-rm x86Math *.s