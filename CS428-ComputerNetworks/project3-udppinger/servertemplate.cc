#include <iostream>
#include <cstdlib>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
using namespace std;
// -=-=-=-=-=--=-=-=-=-=--=-=-=-=-=--=-=-=-=-=--=-=-=-=-=--=-=-=-=-=--=-=-=-=-=-
// 1) Get server port number
// 2) Set Server buffer
// 3) Setup Server UDP Socket & Notice the use of SOCK_DGRAM for UDP
// 4) Server Socket Description is int serverSD
// 5) Bind Socket "int bindSock = bind..."
// 6) generate a random number between 0-99
// 7) If random number less than 30, we consider the received message lost and do not respond
// 8) Otherwise, message not lost
//     if(random < 30)
//     {
//      continue;
//     } cout << "Client message: " << msg << endl;
// 9) Send the server response message
// -=-=-=-=-=--=-=-=-=-=--=-=-=-=-=--=-=-=-=-=--=-=-=-=-=--=-=-=-=-=--=-=-=-=-=-=
int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        cerr << "Usage: port" << endl;
        exit(EXIT_FAILURE);
    }
    int port = atoi(argv[1]);

    char msg[1024];
     
    sockaddr_in servAddr, cliAddr;
    bzero((char*)&servAddr, sizeof(servAddr));
    bzero((char*)&cliAddr, sizeof(cliAddr));
    servAddr.sin_family = AF_INET;
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servAddr.sin_port = htons(port);

    int serverSD = socket(AF_INET, SOCK_DGRAM, 0);
    if(serverSD < 0)
    {
        cerr << "Socket error!" << endl;
        exit(EXIT_FAILURE);
    }
    int bindSock = bind(serverSD, (const struct sockaddr *)&servAddr, sizeof(servAddr));
    if(bindSock < 0)
    {
        cerr << "Bind error!" << endl;
        exit(EXIT_FAILURE);
    }
    
    socklen_t len;
    while(1)
    {
        cout << "Wait for client message..." << endl;
        memset(&msg, 0, sizeof(msg));
        int bytes = recvfrom(serverSD, (char *)&msg, sizeof(msg), MSG_WAITALL, (struct sockaddr *)&cliAddr, &len);
        srand((unsigned)time(NULL));
        int random = rand() % 100;
        cout << "Random: " << random << endl;
        if(random < 30)
        {
            continue;
        }
        cout << "Client message: " << msg << endl;
        bytes = sendto(serverSD, (const char *)&msg, strlen(msg), MSG_CONFIRM, (const struct sockaddr *)&cliAddr, sizeof(cliAddr));
        cout << "Response sent." << endl;
    }
    close(serverSD);
    return EXIT_SUCCESS;
}

