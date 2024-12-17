CXX = g++
CXXFLAGS = -Wall -std=c++11

EXECUTABLE = submission
SOURCES = MainP2.cpp P2.cpp
HEADERS = P2.h
OBJECTS = $(SOURCES:.cpp=.o)

INPUT_FILE = inputFile.txt
OUTPUT_FILE = outputFile.txt

all: $(EXECUTABLE) run

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(EXECUTABLE) $(OBJECTS)

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $<

run: $(EXECUTABLE)
	./$(EXECUTABLE) $(INPUT_FILE) $(OUTPUT_FILE)

clean:
	rm -f $(OBJECTS) $(EXECUTABLE) $(INPUT_FILE) $(OUTPUT_FILE)

