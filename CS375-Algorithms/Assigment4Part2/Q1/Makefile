# Compiler
CXX = g++
# Compiler flags
CXXFLAGS = -std=c++11 -Wall
# Target executable
TARGET = Q1

# Build rules
all: $(TARGET)

$(TARGET): Q1.o
	$(CXX) $(CXXFLAGS) -o $(TARGET) Q1.o

Q1.o: Q1.cpp Q1.h
	$(CXX) $(CXXFLAGS) -c Q1.cpp

# Clean rule
clean:
	rm -f $(TARGET) *.o

