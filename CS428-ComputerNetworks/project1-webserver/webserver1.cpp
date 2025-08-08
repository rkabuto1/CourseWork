#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cstring>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <mutex>
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// Psuedocode for Project 1 - Part 1 Web Server 
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// Step 1 - Create a simple argument acception for a port number when running the executable
// Step 2 - Construct a socket using IPv4 & TCP and bind the socket to the port and local IP address
// Step 3 - Start listening to the socket for the client connection
// Step 4 - Create a loop to accept one client at a time only
// Step 5 - Read the request into the buffer and parse the HTTP method and requested file path from the request
// Step 6 - If empty, return an Error Or If it is not a GET request, return an Error
// Step 7 - Else(Meaning method is a GET request), then strip the leading slash and get filename
// Step 8 - Open file in binary. If not then return an error
// Step 9 - Once opened, read the contents into a stringstream and find its MIME type
// Step 10 - Create a HTTP/1.1 200 OK repsonse 
//         - Content Length
//         - Content-Type
//         - Actual file data 
// Step 11 - Send a response bak and close the connection
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
const int BUFFER_SIZE = 4096;

std::string MimeType(const std::string& InputPath){
    size_t PositionPath = InputPath.rfind('.');
    if (PositionPath == std::string::npos || PositionPath + 1 >= InputPath.size())
        return "application/octet-stream";
    std::string SubstringExt = InputPath.substr(PositionPath + 1);
    switch(SubstringExt[0]){
        case 'h':
            if(SubstringExt == "html")
                return "text/html";
            break;
        case 'j':
            if(SubstringExt == "jpeg" || SubstringExt == "jpg")
                return "image/jpeg";
            break;
        case 'p':
            if(SubstringExt == "pdf")
                return "application/pdf";
            break;
    }
    return "application/octet-stream";
}
std::string HTTP(const std::string& PathofFile){
    std::ifstream Inputfile(PathofFile, std::ios::binary);
    if(!Inputfile.is_open()){
        return "HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\n\r\n";
    }
    std::ostringstream ss;
    ss << Inputfile.rdbuf();
    std::string Body = ss.str();

    std::string MimeTypeString = MimeType(PathofFile);
    char FirstChar = MimeTypeString.empty() ? 'o' :  MimeTypeString[0];

    std::ostringstream Response;
    switch(FirstChar){
        case 't':
        case 'i':
        case 'a':
            Response << "HTTP/1.1 200 OK\r\n";
            Response << "Content-Length: " << Body.size() << "\r\n";
            Response << "Content-Type:" << MimeTypeString << "\r\n";
            Response << "\r\n";
            Response << Body;
            break;
        default:
            Response << "HTTP/1.1 200 OK\r\n";
            Response << "Content-Length: " << Body.size() << "\r\n";
            Response << "Content-Type: application/octet-stream\r\n";
            Response << "\r\n";
            Response << Body;
            break;
        }
        return Response.str();
}
int main(int argc, char* argv[]) {
    try {
        auto LambdaParser = [&]() -> int {
            if (argc != 2) 
                throw std::invalid_argument("Error: Not Valid Arguments");
            return std::stoi(argv[1]);
        };
        int PortNumber = LambdaParser();
        int SocketFile = [&]() -> int {
            int fd = socket(AF_INET, SOCK_STREAM, 0);
            if (fd == -1) 
                throw std::runtime_error("socket");
            return fd;
        }();
        sockaddr_in AddressServer{};
        memset(&AddressServer, 0, sizeof(AddressServer));
        AddressServer.sin_family = AF_INET;
        AddressServer.sin_addr.s_addr = INADDR_ANY;
        AddressServer.sin_port = htons(PortNumber);

        if (bind(SocketFile, (sockaddr*)&AddressServer, sizeof(AddressServer)) < 0)
            throw std::runtime_error("bind");
        if (listen(SocketFile, 10) < 0)
            throw std::runtime_error("listen");

        std::cout << "Server listening on port " << PortNumber << "...\n";

        while (true) {
            sockaddr_in AddressClient{};
            socklen_t SizeOfClient = sizeof(AddressClient);
            int ClientConnection = accept(SocketFile, (sockaddr*)&AddressClient, &SizeOfClient);
            if (ClientConnection < 0) 
                continue;

            char BufferBytes[BUFFER_SIZE] = {0};
            ssize_t bytesRead = read(ClientConnection, BufferBytes, BUFFER_SIZE);
            if (bytesRead <= 0) {
                close(ClientConnection);
                continue;
            }
            std::istringstream Request(BufferBytes);
            std::string Method, ParsedPath;
            Request >> Method >> ParsedPath;
            if(Method.empty()){
                std::string Response = "HTTP/1.1 400 Bad Request\r\n\r\n";
                send(ClientConnection, Response.c_str(), Response.size(), 0);
                close(ClientConnection);
                continue;
            }
            switch(Method[0]){
                case 'G':
                    if(Method == "GET"){
                        std::string RemovedSlash = ParsedPath.substr(1);
                        std::string Response = HTTP(RemovedSlash);
                        send(ClientConnection, Response.c_str(), Response.size(), 0);
                    }else{
                        std::string Response = "HTTP/1.1 405 Method Not Allowed\r\n\r\n";
                        send(ClientConnection, Response.c_str(), Response.size(), 0);
                    }
                    break;
                default:
                    std::string Response = "HTTP/1.1 405 Method Not Allowed\r\n\r\n";
                    send(ClientConnection, Response.c_str(), Response.size(), 0);
                    break;
            }
            close(ClientConnection);
        }
        close(SocketFile);
    }catch (const std::invalid_argument& e){
        std::cerr << e.what() << "\n";
        return 1;
    }catch (const std::runtime_error& e){
        perror(e.what());
        return 1;
    }
    return 0;
}