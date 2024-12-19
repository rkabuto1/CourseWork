CC = gcc
CFLAGS = -Wall -std=c18 
# -ggdb Debug is turned off... no C code hints in the executable

test : intMath
	./intMath

intMath.obj.txt  : intMath
	objdump -dS intMath | tee intMath.obj.txt
	
gdb_intMath : intMath
	gdb -ex "break funcA" -ex "set disassemble-next-line on" -ex "run" ./intMath
	
clean :
	-rm intMath.obj.txt