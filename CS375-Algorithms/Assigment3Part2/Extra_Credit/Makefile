CXX = g++
CXXFLAGS = -Wall -std=c++11
SOURCES_Q2 = Q2.cpp
SOURCES_Q4 = Q4.cpp
EXECUTABLE_Q2 = Q2
EXECUTABLE_Q4 = Q4

all: $(EXECUTABLE_Q2) $(EXECUTABLE_Q4)

$(EXECUTABLE_Q2): $(SOURCES_Q2)
	$(CXX) $(CXXFLAGS) $(SOURCES_Q2) -o $(EXECUTABLE_Q2)

$(EXECUTABLE_Q4): $(SOURCES_Q4)
	$(CXX) $(CXXFLAGS) $(SOURCES_Q4) -o $(EXECUTABLE_Q4)

clean:
	rm -f $(EXECUTABLE_Q2) $(EXECUTABLE_Q4)

.PHONY: all clean

