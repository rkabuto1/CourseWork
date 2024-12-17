CXX = g++
CXXFLAGS = -Wall -std=c++11
TARGET = Q1
OBJS = MainFileQ1.o CitiesQ1.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

MainFileQ1.o: MainFileQ1.cpp CitiesQ1.h
	$(CXX) $(CXXFLAGS) -c MainFileQ1.cpp

CitiesQ1.o: CitiesQ1.cpp CitiesQ1.h
	$(CXX) $(CXXFLAGS) -c CitiesQ1.cpp

clean:
	rm -f $(TARGET) $(OBJS)

