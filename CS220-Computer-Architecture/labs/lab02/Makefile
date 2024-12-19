CC = gcc
CFLAGS = -Wall -std=c18 -ggdb

test : test_expandTabs test_collapseSpaces

test_expandTabs : countSpace expandTabs
	./countSpace <example.txt 
	./expandTabs 3 <example.txt | ./countSpace >/dev/null
	./expandTabs 5 <example.txt | ./countSpace >/dev/null

test_collapseSpaces : countSpace expandTabs collapseSpaces	
	./expandTabs 5 <example.txt | ./collapseSpaces 3 | ./countSpace >/dev/null
	./expandTabs 4 <example.txt | ./collapseSpaces 2 | ./countSpace >/dev/null 
	
gdb : countSpace
	gdb --args ./expandTabs 3 <example.txt

gdb_collapse : collapseSpaces
	gdb --args ./collapseSpaces 3 <example.txt	

clean :
	-rm countSpace expandTabs collapseSpaces
