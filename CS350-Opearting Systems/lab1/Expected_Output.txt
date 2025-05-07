This is the output that I got when I ran my Makefile.

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make
gcc -Wall -DBSD -DNDEBUG -c flip.c -o flip.o
gcc -Wall -DBSD -DNDEBUG -c getopt.c -o getopt.o
gcc -Wall -DBSD -DNDEBUG -o flip flip.o getopt.o
nroff -man flip.1 > flip.man

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make
make: Nothing to be done for 'all'.

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make
gcc -Wall -DBSD -DNDEBUG -c flip.c -o flip.o
gcc -Wall -DBSD -DNDEBUG -c getopt.c -o getopt.o
gcc -Wall -DBSD -DNDEBUG -o flip flip.o getopt.o

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make
make: Nothing to be done for 'all'.

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make
gcc -Wall -DBSD -DNDEBUG -c flip.c -o flip.o
gcc -Wall -DBSD -DNDEBUG -o flip flip.o getopt.o

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make
gcc -Wall -DBSD -DNDEBUG -c getopt.c -o getopt.o
gcc -Wall -DBSD -DNDEBUG -o flip flip.o getopt.o

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make
make: Nothing to be done for 'all'.

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make clean
rm -f flip.o getopt.o flip flip.man

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make flip
gcc -Wall -DBSD -DNDEBUG -c flip.c -o flip.o
gcc -Wall -DBSD -DNDEBUG -c getopt.c -o getopt.o
gcc -Wall -DBSD -DNDEBUG -o flip flip.o getopt.o

rkabuto1@remote04:~/Desktop/CS350/lab1_rickkabuto$ make flip.man
nroff -man flip.1 > flip.man