CC = g++
CFLAGS = -Wall -Wextra -O2
TARGET = kabuto
OBJS = mainNDFA.o Parse.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

mainNDFA.o: mainNDFA.cpp Parse.h
	$(CC) $(CFLAGS) -c mainNDFA.cpp

Parse.o: Parse.cpp Parse.h
	$(CC) $(CFLAGS) -c Parse.cpp

clean:
	rm -f $(OBJS) $(TARGET)
