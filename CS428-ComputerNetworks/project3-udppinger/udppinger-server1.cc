#include "headerfile.h"
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <ctime>
#include <sstream>
#include <algorithm>
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// 1) Accept the port number from command line arguments.
// 2) Create a UDP socket using SOCK_DGRAM.
// 3) Configure sockaddr_in server address with AF_INET, INADDR_ANY, and port.
// 4) Bind the socket to the address and port.
// 5) Seed random number generator to simulate packet loss.
// 6) Enter an infinite loop
//    - Wait for incoming message using recvfrom()
//    - If no bytes received, skip
//    - Generate random number. if < 30, simulate packet loss by skipping
//    - If message starts with "ping,", replace with "echo" and send response
// 7) Close socket on termination
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
using namespace std;

void Server1(int PortNumber) {
    int UDP_SocketDescriptor = socket(AF_INET, SOCK_DGRAM, 0);

    switch (static_cast<int>(UDP_SocketDescriptor < 0)) {
        case 1:
            cerr << "There was a Socket Error" << endl;
            exit(EXIT_FAILURE);
    }
    sockaddr_in AddressOfServer = {};
    AddressOfServer.sin_family = AF_INET;
    AddressOfServer.sin_port = htons(PortNumber);
    AddressOfServer.sin_addr.s_addr = htonl(INADDR_ANY);

    int BindReturnValue = ::bind(UDP_SocketDescriptor, (const struct sockaddr*)&AddressOfServer, sizeof(AddressOfServer));
    switch (static_cast<int>(BindReturnValue < 0)) {
        case 1:
            cerr << "There exists a Bind Error" << endl;
            exit(EXIT_FAILURE);
    }

    srand(time(NULL));
    sockaddr_in ClientAddress = {};
    socklen_t ClientLength = sizeof(ClientAddress);
    char PingMessage[1024];

    while (true) {
        cout << "Waiting for a message from the client" << endl;
        memset(PingMessage, 0, sizeof(PingMessage));
        int NumberOfBytes = recvfrom(UDP_SocketDescriptor, PingMessage, sizeof(PingMessage), 0, (struct sockaddr*)&ClientAddress, &ClientLength);

        switch (static_cast<int>(NumberOfBytes <= 0)) {
            case 1:
                continue;
        }

        int PacketLoss = rand() % 100;
        cout << "Peforming a Random Value -> " << PacketLoss << endl;

        switch (static_cast<int>(PacketLoss < 30)) {
            case 1:
                continue;
        }

        cout << "Client message: " << PingMessage << endl;

        switch (static_cast<int>(strncmp(PingMessage, "ping,", 5) == 0)) {
            case 1: {
                const char* MessageBody = PingMessage + 5;
                string ReplySent = "echo," + string(MessageBody);
                sendto(UDP_SocketDescriptor, ReplySent.c_str(), ReplySent.length(), 0, (struct sockaddr*)&ClientAddress, ClientLength);
                cout << "Response was sent: " << ReplySent << endl;
                break;
            }
        }
    }

    close(UDP_SocketDescriptor);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        cerr << "Incorrect Arugments: Example - ./server1 12000" << endl;
        exit(EXIT_FAILURE);
    }

    Server1(atoi(argv[1]));
    return 0;
}
