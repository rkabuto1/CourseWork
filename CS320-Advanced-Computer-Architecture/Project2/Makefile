CXX = g++
CXXFLAGS = -std=c++17 -Wall -O2
TARGET = caches
SRCS = cache-part1.cpp cache-part2.cpp main.cpp
OBJS = $(SRCS:.cpp=.o)
HEADERS = caches.h

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^
	
%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	./$(TARGET)

