CXX = g++
CXXFLAGS = -Wall -std=c++11

EXECUTABLE = P1

SOURCES = MainP1.cpp P1.cpp
HEADERS = closest_pair.h

OBJECTS = $(SOURCES:.cpp=.o)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(EXECUTABLE) $(OBJECTS)

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f $(OBJECTS) $(EXECUTABLE)


