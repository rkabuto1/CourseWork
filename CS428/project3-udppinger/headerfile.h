#ifndef UDP_SERVER_H
#define UDP_SERVER_H
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <ctime>
#include <chrono>
#include <thread>
#include <vector>
#include <algorithm>
#include <sstream>
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
void Server1(int PortNumber);
void Client1(const char* ProtocolAddress, int ServerPort); 
void Server2(int PortNumber);
void Client2(const char* ProtocolAddress, int ServerPort); 
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#endif 
