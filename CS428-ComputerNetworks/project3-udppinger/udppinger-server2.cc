#include "headerfile.h"
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <ctime>
#include <chrono>
#include <sstream>
#include <algorithm>
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// 1. Accept a port number as a command line argument
// 2. Create a UDP socket using socket(AF_INET, SOCK_DGRAM, 0)
// 3. Set up a sockaddr_in server address bound to INADDR_ANY and the specified port
// 4. Bind the socket to the address
// 5. Configure a 1 second receive timeout with setsockopt
// 6. Enter an infinite loop where
//     a) The server waits for incoming messages using recvfrom()
//     b) If data is received:
//        - Simulate 30% packet loss using rand()
//        - If the message starts with "ping,", replace with "echo," and reply.
//     c) If no message is received for 30 seconds, exit loop and shut down.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
using namespace std;
using namespace std::chrono;

void Server2(int PortNumber) {
    char PingMessage[1024];
    sockaddr_in AddressOfServer, ClientAddress;
    bzero((char*)&AddressOfServer, sizeof(AddressOfServer));
    bzero((char*)&ClientAddress, sizeof(ClientAddress));
    AddressOfServer.sin_family = AF_INET;
    AddressOfServer.sin_addr.s_addr = htonl(INADDR_ANY);
    AddressOfServer.sin_port = htons(PortNumber);

    int UDP_SocketDescriptor = socket(AF_INET, SOCK_DGRAM, 0);
    switch (static_cast<int>(UDP_SocketDescriptor < 0)) {
        case 1:
            cerr << "There was a socket error" << endl;
            exit(EXIT_FAILURE);
    }

    int BindReturnValue = ::bind(UDP_SocketDescriptor, (const struct sockaddr*)&AddressOfServer, sizeof(AddressOfServer));
    switch (static_cast<int>(BindReturnValue < 0)) {
        case 1:
            cerr << "There was a bind Error" << endl;
            exit(EXIT_FAILURE);
    }

    timeval SocketTimeout;
    SocketTimeout.tv_sec = 1;
    SocketTimeout.tv_usec = 0;
    setsockopt(UDP_SocketDescriptor, SOL_SOCKET, SO_RCVTIMEO, &SocketTimeout, sizeof(SocketTimeout));

    srand(time(NULL));
    socklen_t ClientLength = sizeof(ClientAddress);

    auto MostRecentMessage = steady_clock::now();
    bool keepRunning = true;
    bool waitingPrinted = false;

    while (keepRunning) {
        if (!waitingPrinted) {
            cout << "Currently waiting for a message from the client" << endl;
            waitingPrinted = true;
        }

        memset(&PingMessage, 0, sizeof(PingMessage));
        int NumberOfBytes = recvfrom(UDP_SocketDescriptor, (char*)&PingMessage, sizeof(PingMessage), 0, (struct sockaddr*)&ClientAddress, &ClientLength);

        auto CurrentTime = steady_clock::now();

        switch (static_cast<int>(NumberOfBytes > 0)) {
            case 1: {
                MostRecentMessage = CurrentTime;
                waitingPrinted = false;

                int PacketLoss = rand() % 100;
                switch (static_cast<int>(PacketLoss < 30)) {
                    case 1:
                        continue;
                }

                string RecievedMessages(PingMessage);
                switch (static_cast<int>(RecievedMessages.substr(0, 5) == "ping,")) {
                    case 1: {
                        string MessageBody = RecievedMessages.substr(5);
                        string ReplySent = "echo," + MessageBody;
                        sendto(UDP_SocketDescriptor, ReplySent.c_str(), ReplySent.length(), 0, (struct sockaddr*)&ClientAddress, ClientLength);
                        break;
                    }
                }
                break;
            }
            case 0: {
                auto TimeSinceLastMessage = duration_cast<seconds>(CurrentTime - MostRecentMessage).count();
                switch (static_cast<int>(TimeSinceLastMessage >= 30)) {
                    case 1:
                        cout << "Server UDP Pinger Timed Out" << endl;
                        keepRunning = false;
                        break;
                }
                waitingPrinted = false;
            }
        }
    }
    close(UDP_SocketDescriptor);
}

int main(int argc, char *argv[]) {
    switch (static_cast<int>(argc != 2)) {
        case 1:
            cerr << "Incorrect Arugments: Example - ./server2 12000" << endl;
            exit(EXIT_FAILURE);
    }
    int PortNumber = atoi(argv[1]);
    Server2(PortNumber);
    return 0;
}

