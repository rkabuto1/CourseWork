CC = gcc
CFLAGS = -Wall -std=c18 -ggdb
FUNCTION=main

%.s : %.c ; ${CC} ${CFLAGS} -O0 -S -fverbose-asm $<

%.obj.txt : % ; objdump --disassemble=${FUNCTION} -SlrRw $< | tee $@

gdb_% : % ; gdb -ex "b ${FUNCTION}" -ex "set disassemble-next-line on" -ex "run" -ex "disassemble /m"  $< 

	
clean :
	-rm *.s *.obj.txt
