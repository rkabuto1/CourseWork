#include "headerfile.h"
#include <iostream>
#include <chrono>
#include <thread>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sstream>
#include <algorithm>
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// 1) Read IP address and port number from command line arguments
// 2) Create a UDP socket using SOCK_DGRAM
// 3) Set a 1 second receive timeout using setsockopt
// 4) Setup server address using sockaddr_in
// 5) Check that the IP address is valid using inet_pton
// 6) Set total number of ping attempts 90
// 7) For each ping:
//      - Record the time it was sent using high_resolution_clock
//      - Build the ping message
//      - Send the message using sendto
//      - Wait for a reply using recvfrom
//      - If reply is received then calculate RTT and print it
//      - If reply is not received: print timeout message
//      - Wait 1 second before next ping
// 8) Close the UDP socket after all pings are complete
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
using namespace std;
using namespace std::chrono;

void Client1(const char* ProtocolAddress, int ServerPort) {
    int UDP_FileDescriptor = socket(AF_INET, SOCK_DGRAM, 0);
    if (UDP_FileDescriptor < 0) {
        cerr << "There was a Socket Error" << endl;
        exit(EXIT_FAILURE);
    }
    timeval Timeout;
    Timeout.tv_sec = 1;
    Timeout.tv_usec = 0;
    setsockopt(UDP_FileDescriptor, SOL_SOCKET, SO_RCVTIMEO, (const char*)&Timeout, sizeof(Timeout));

    sockaddr_in AddressOfServer = {};
    socklen_t SizeOfAddress = sizeof(AddressOfServer);
    AddressOfServer = {
        .sin_family = AF_INET,
        .sin_port = htons(ServerPort)
    };

    if (inet_pton(AF_INET, ProtocolAddress, &AddressOfServer.sin_addr) <= 0) {
        cerr << "You put the Incorrect Format For the IP Address" << endl;
        exit(EXIT_FAILURE);
    }

    const int TotalPings = 90;
    char BufferSize[1024];
    int NumberSequence = 1;

    while (true) {
        if (NumberSequence > TotalPings) break;

        auto ExactTime = high_resolution_clock::now();
        long long CompleteTimeStamp = duration_cast<nanoseconds>(ExactTime.time_since_epoch()).count();

        string PingMessage = "ping," + to_string(NumberSequence) + "," + to_string(CompleteTimeStamp);
        cout << "We are currently sending " << PingMessage << endl;

        sendto(UDP_FileDescriptor, PingMessage.c_str(), PingMessage.length(), 0, (sockaddr*)&AddressOfServer, SizeOfAddress);

        memset(BufferSize, 0, sizeof(BufferSize));
        int NumberOfBytes = recvfrom(UDP_FileDescriptor, BufferSize, sizeof(BufferSize), 0, (sockaddr*)&AddressOfServer, &SizeOfAddress);

        switch (static_cast<int>(NumberOfBytes < 0)) {
            case 1:
                cout << "Client UDP Pinger Timed Out" << endl;
                break;
            case 0:
                auto ResponseTime = high_resolution_clock::now();
                string Received(BufferSize);
                vector<string> Tokens;
                stringstream ss(Received);
                string Token;

                while (getline(ss, Token, ',')) Tokens.push_back(Token);
                if (Tokens.size() != 3 || Tokens[0] != "echo" || stoi(Tokens[1]) != NumberSequence) {
                    cout << "Invalid echo or mismatched sequence number. Skipping RTT calc." << endl;
                    break;
                }
                long long RoundTripTime = duration_cast<nanoseconds>(ResponseTime - ExactTime).count();
                cout << "We Recieved ->  " << BufferSize << endl;
                cout << "RTT -> " << RoundTripTime << " ns" << endl;
                break;
        }
        this_thread::sleep_for(1s);
        NumberSequence++;
    }

    close(UDP_FileDescriptor);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        cerr << "Incorrect Arugments: Example - ./client1 127.0.0.1 12000" << endl;
        exit(EXIT_FAILURE);
    }
    Client1(argv[1], atoi(argv[2]));
    return 0;
}