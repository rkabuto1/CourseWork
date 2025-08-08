CXX = g++
CXXFLAGS = -Wall -std=c++17

all: client1 server1 client2 server2

client1: udppinger-client1.cc headerfile.h
	$(CXX) $(CXXFLAGS) -o client1 udppinger-client1.cc

server1: udppinger-server1.cc headerfile.h
	$(CXX) $(CXXFLAGS) -o server1 udppinger-server1.cc

client2: udppinger-client2.cc headerfile.h
	$(CXX) $(CXXFLAGS) -o client2 udppinger-client2.cc

server2: udppinger-server2.cc headerfile.h
	$(CXX) $(CXXFLAGS) -o server2 udppinger-server2.cc

clean:
	rm -f client1 server1 client2 server2
