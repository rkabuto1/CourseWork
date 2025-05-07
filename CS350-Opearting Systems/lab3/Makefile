CC = gcc
CFLAGS = -Wall -Wextra
TARGET = timing
SRC = timing.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)
	
clean:
	rm -f $(TARGET)

.PHONY: all clean
