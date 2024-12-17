CXX = g++
CXXFLAGS = -Wall -std=c++11
all: mainP1

mainP1: mainP1.o predictors.o complicatedpredictor.o
	$(CXX) $(CXXFLAGS) -o mainP1 mainP1.o predictors.o complicatedpredictor.o

mainP1.o: mainP1.cpp functions.h
	$(CXX) $(CXXFLAGS) -c mainP1.cpp

predictors.o: predictors.cpp functions.h
	$(CXX) $(CXXFLAGS) -c predictors.cpp

complicatedpredictor.o: complicatedpredictor.cpp functions.h
	$(CXX) $(CXXFLAGS) -c complicatedpredictor.cpp

clean:
	rm -f *.o mainP1

