CXX = g++
CXXFLAGS = -Wall -std=c++11
TARGET = kabuto
SRC = mainP2.cpp P2.cpp
OBJ = mainP2.o P2.o

all: $(TARGET)

mainP2.o: mainP2.cpp P2.h
	$(CXX) $(CXXFLAGS) -c mainP2.cpp -o mainP2.o

P2.o: P2.cpp P2.h
	$(CXX) $(CXXFLAGS) -c P2.cpp -o P2.o

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) $(OBJ) -o $(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)
