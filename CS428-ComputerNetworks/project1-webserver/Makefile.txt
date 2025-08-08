CXX = g++
CXXFLAGS = -Wall -O2 -std=c++17

TARGETS = webserver1 webserver2
SRCS = $(addsuffix .cpp, $(TARGETS))
OBJS = $(SRCS:.cpp=.o)

all: $(TARGETS)

%: %.o
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(TARGETS) $(OBJS)
