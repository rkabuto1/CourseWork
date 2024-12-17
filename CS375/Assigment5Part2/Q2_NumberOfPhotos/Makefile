CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra
TARGET = Q2
SRCS = Q2.cpp mainQ2.cpp
OBJS = $(SRCS:.cpp=.o)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

Q2.o: Q2.cpp Q2.h
	$(CXX) $(CXXFLAGS) -c Q2.cpp

mainQ2.o: mainQ2.cpp Q2.h
	$(CXX) $(CXXFLAGS) -c mainQ2.cpp

clean:
	rm -f $(OBJS) $(TARGET)

