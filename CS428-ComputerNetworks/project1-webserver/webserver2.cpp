#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cstring>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <mutex>
#include <csignal>
#include <shared_mutex>
#include <memory>
#include <vector>
#include <thread>

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// Psuedocode for Project 1-  Part 2 Web Server 
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// Step 1 - Add a global flag and integer to be able to shutdown and close our Signal
// Step 2 - Store all the worker threads
// Step 3 - Construct a thread that is able to protect the access of what goes in and out
// Step 4 - Create a sigaction handler that is able to define the serverRunning, close and write
// Step 5 - Call our sigaction to install a custom signal handler
// Step 6 - Construct a helper function for our main that is able to recursively:
//        - If false, then we terminate, else call the funciton 
//        - If true, spawna  new thread to handle the client
//        - Store the thread in a pool using a mutex
//        - Recursevly call the function
// Step 7 - Lock the pool and join all active threads after leaving the loop
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
const int BUFFER_SIZE = 4096;

volatile sig_atomic_t serverRunning = 1;
int ListeningSocket;
std::vector<std::unique_ptr<std::thread>> ThreadPool;
std::shared_timed_mutex ThreadPoolLock;

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
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// Start of Part 2 Implementation 
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Connect(int client){
    char buffer[BUFFER_SIZE] = {0};
    ssize_t bytes = read(client, buffer, BUFFER_SIZE);
    if(bytes <= 0){
        close(client);
        return;
    }
    std::istringstream req(buffer);
    std::string method, path;
    req >> method >> path;
    std::string res;
    if(method.empty()){
        res = "HTTP/1.1 400 Bad Request \r\n\r\n";
    }else if (method == "GET"){
        std::string file = path.substr(1);
        res = HTTP(file);
    }else{
        res = "HTTP/1.1 405 Method Not Allowed\r\n\r\n";
    }
    send(client, res.c_str(), res.size(), 0);
    close(client);
}

void Accept(){
    if(!serverRunning)
        return;
    sockaddr_in clientAddr{};
    socklen_t clientLen = sizeof(clientAddr);
    int client = accept(ListeningSocket, (sockaddr*)&clientAddr, &clientLen);
    if(client < 0){
        if(!serverRunning)
            return;
        perror("Accept");
        Accept();
        return;
    }
        {
            std::unique_lock<std::shared_timed_mutex> lock(ThreadPoolLock);
            ThreadPool.emplace_back(std::make_unique<std::thread>(Connect, client));
        }
    Accept();
}
int main(int argc, char* argv[]){
    if(argc != 2){
        std::cerr << "Incorrect Input. Do ./webserver 28000";
        return 1;
    }
    struct sigaction sa;
    sa.sa_handler = [](int){
        ssize_t a = write(STDOUT_FILENO, "\nCtrl + C -> Shutting down server \n", 26);
        (void)a;
        serverRunning = 0;
        close(ListeningSocket);
    };
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;
    sigaction(SIGINT, &sa, nullptr);
    int port = std::stoi(argv[1]);
    ListeningSocket = socket(AF_INET, SOCK_STREAM, 0);
    if(ListeningSocket == -1){
        perror("Socket");
        return 1;
    }
    sockaddr_in serverAddr{};
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_addr.s_addr = INADDR_ANY;
    serverAddr.sin_port = htons(port);
    if (bind(ListeningSocket, (sockaddr*)&serverAddr, sizeof(serverAddr)) < 0){
        perror("bind");
        return 1;
    }
    if (listen(ListeningSocket, 10) < 0){
        perror("listen");
        return 1;
    }
    std::cout << "Listening to server port " << port << "... \n";
    Accept();{
        std::unique_lock<std::shared_timed_mutex> lock(ThreadPoolLock);
        for(auto& t : ThreadPool)
            if(t->joinable()) t->join();
    }
    std::cout << "\nServer Shutdown Complete\n";
    return 0;
}