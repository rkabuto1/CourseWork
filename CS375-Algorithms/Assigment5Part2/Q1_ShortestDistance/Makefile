CXX = g++
CXXFLAGS = -std=c++11 -Wall
TARGET = Q1
SOURCES = Q1.cpp mainQ1.cpp
OBJECTS = $(SOURCES:.cpp=.o)
HEADERS = Q1.h

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJECTS)

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@
	
clean:
	rm -f $(OBJECTS) $(TARGET)

