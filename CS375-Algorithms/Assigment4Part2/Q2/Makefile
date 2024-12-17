CXX = g++
CXXFLAGS = -std=c++11 -Wall

all: main

Q2.o: Q2.cpp Q2.h
	$(CXX) $(CXXFLAGS) -c Q2.cpp

main.o: main.cpp Q2.h
	$(CXX) $(CXXFLAGS) -c main.cpp

main: main.o Q2.o
	$(CXX) $(CXXFLAGS) -o main main.o Q2.o

clean:
	rm -f *.o main

