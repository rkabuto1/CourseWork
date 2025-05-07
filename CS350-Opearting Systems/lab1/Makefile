COMPILER     := gcc
CFLAGS  := -Wall -DBSD -DNDEBUG
MANPAGE := flip.1
OUTPUT  := flip
SRC     := flip.c getopt.c
OBJ    := $(SRC:.c=.o)


.PHONY: all clean rebuild

all: $(OUTPUT) flip.man

$(OUTPUT): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c flip.h
	$(CC) $(CFLAGS) -c $< -o $@

flip.man: 
	cat $(MANPAGE) | nroff -man > flip.man

clean:
	: > flip.man; rm -f $(OBJ) $(OUTPUT) flip.man

rebuild: clean all
