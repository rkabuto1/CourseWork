CC = gcc
CFLAGS = -Wall -std=c18 -ggdb

%.s : %.c ; ${CC} ${CFLAGS} -O0 -S -fverbose-asm $<

x86cf.obj.txt : x86cf
	objdump --disassemble=x86cf -SlrRw $< | tee $@
	
gdb : x86cf
	gdb -x gdb_cmds.txt --args ./x86cf
	
clean :
	-rm x86cf x86cf.s x86cf.obj.txt	
