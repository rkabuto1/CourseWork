CC=gcc
CFLAGS=-ggdb -Wall -std=c18 -O0

test: target solution.txt
	setarch linux64 -R ./target <solution.txt
	
target.s : target
	objdump -dSl target > target.s	
	
showhex : solution.txt
	od -Ax -c -tx1 solution.txt
	
solution.txt : mix mix_in.txt
	./mix <mix_in.txt >solution.txt
	
mix : mix.c
	${CC} ${CFLAGS} -o mix mix.c
	
gdb: target solution.txt
	gdb -x gdb_cmds.txt target		
		
clean:
	-rm target target.s solution.txt mix
