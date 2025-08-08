#include "headerfile.h"
#include <iostream>
#include <chrono>
#include <thread>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <vector>
#include <sstream>
#include <algorithm>
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// 1. Reads the servers IP address and port number from command line arguments
// 2. Create a UDP socket using SOCK_DGRAM
// 3. Sets a 1 second receive timeout using setsockopt
// 4. Configures the server address using sockaddr_in and validates the IP
// 5. Sends 90 pings to the server with a timestamp and sequence number
// 6. For each ping:
//      - Sends a message in the format
//      - Waits up to 1 second for a reply from the server
//      - If reply received, calculates round trip time (RTT)
//      - Records RTT for statistics
//      - If reply not received, counts as timeout
// 7. After all pings:
//      - Prints total, successful, and lost packets
//      - Displays min, max, and average RTT values
// 8. Closes the socket and exits
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
using namespace std;
using namespace std::chrono;

void Client2(const char* ProtocolAddress, int ServerPort) {
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
        cerr << "You put the incorrect format for the IP address" << endl;
        exit(EXIT_FAILURE);
    }

    const int TotalPings = 90;
    char BufferSize[1024];
    vector<long long> RoundTripTimes;
    int ReceivedReplies = 0;

    for (int NumberSequence = 1; NumberSequence <= TotalPings; ++NumberSequence) {
        auto ExactTime = high_resolution_clock::now();
        long long CompleteTimeStamp = duration_cast<nanoseconds>(ExactTime.time_since_epoch()).count();
        string PingMessage = "ping," + to_string(NumberSequence) + "," + to_string(CompleteTimeStamp);
        cout << "Sending: " << PingMessage << endl;
        sendto(UDP_FileDescriptor, PingMessage.c_str(), PingMessage.length(), 0, (sockaddr*)&AddressOfServer, SizeOfAddress);
        memset(BufferSize, 0, sizeof(BufferSize));
        int NumberOfBytes = recvfrom(UDP_FileDescriptor, BufferSize, sizeof(BufferSize), 0, (sockaddr*)&AddressOfServer, &SizeOfAddress);

        switch (static_cast<int>(NumberOfBytes < 0)) {
            case 1:
                cout << "There was a Client UDP Time Out" << endl;
                break;
            case 0:
                auto ResponseTime = high_resolution_clock::now();
                string Received(BufferSize);
                vector<string> Tokens;
                stringstream ss(Received);
                string Token;

                while (getline(ss, Token, ',')) Tokens.push_back(Token);
                switch (static_cast<int>(Tokens.size() == 3 && Tokens[0] == "echo" && stoi(Tokens[1]) == NumberSequence)) {
                    case 0:
                        cout << "Malformed echo or mismatched sequence. Skipping." << endl;
                        break;
                    case 1: {
                        long long RoundTripTime = duration_cast<nanoseconds>(ResponseTime - ExactTime).count();
                        RoundTripTimes.push_back(RoundTripTime);
                        ReceivedReplies++;
                        cout << "Received BufferSize: " << BufferSize << endl;
                        cout << "RTT: " << RoundTripTime << " ns" << endl;
                        break;
                }
            }            
        }
        this_thread::sleep_for(1s);
    }
    if (!RoundTripTimes.empty()) {
        long long MinimumRTT = *min_element(RoundTripTimes.begin(), RoundTripTimes.end());
        long long MaximumRTT = *max_element(RoundTripTimes.begin(), RoundTripTimes.end());
        long long SumAllRTT = 0;

        for (auto rtt : RoundTripTimes) SumAllRTT += rtt;
        double AverageRTT = static_cast<double>(SumAllRTT) / RoundTripTimes.size();
        double TrueLossRate = 100.0 * (TotalPings - ReceivedReplies) / TotalPings;

        cout << "\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-" << endl;
        cout << "The Total Pings -  " << TotalPings << endl;
        cout << "Successful Amount Of Pings -  " << ReceivedReplies << endl;
        cout << "The Packet Loss Rate - " << TrueLossRate << "%" << endl;
        cout << "Minimum RTT - " << MinimumRTT << endl;
        cout << "Maximum RTT - " << MaximumRTT << endl;
        cout << "Average RTT - " << AverageRTT << endl;
    } else {
        cout << "There was a 100% packet loss meaning no responses were obtained" << endl;
    }

    close(UDP_FileDescriptor);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        cerr << "Incorrect Arugments: Example - ./client2 127.0.0.1 12000" << endl;
        exit(EXIT_FAILURE);
    }
    Client2(argv[1], atoi(argv[2]));
    return 0;
}