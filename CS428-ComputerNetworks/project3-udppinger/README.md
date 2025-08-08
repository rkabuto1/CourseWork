# Binghamton University, Summer 2025

## CS428/528 Project-3: UDP Pinger
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[This file uses Markdown, so please use correct Markdown syntax when editing the file]: #
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

### SUMMARY
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[Provide a short description of your program's functionality, no more than a couple sentences]: #

This project implements a UDP based ping application using C++. Part 1 includes a basic client that sends 90 pings over 3 minutes and calculates RTTs with simulated packet loss. Part 2 extends the functionality by computing full ping statistics and modifies the server to automatically shut down after 30 seconds of no response.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

### NOTES, KNOWN BUGS, AND/OR INCOMPLETE PARTS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[Add any notes you have here and/or any parts of the project you were not able to complete]: #

None. All features for both Part 1 and Part 2 are fully implemented and tested.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

### REFERENCES
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[List any outside resources used]: #

1) C++ man pages: `socket`, `bind`, `recvfrom`, `sendto`, `setsockopt`  
2) https://en.cppreference.com  
3) https://man7.org/linux/man-pages/  
4) Project description PDF from Brightspace
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

### INSTRUCTIONS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[Provide clear and complete step-by-step instructions on how to run and test your project]: #

Step 1) Compile all the programs using - "Make"  
Step 2) Start Server1 For udppinger-server1.cc - "./server1 12000"  
Step 3) In a separate terminal run the client message - "./client1 127.0.0.1 12000"  
  - Step 3a) Client sends a ping every 2 seconds and should send a total of 90 pings  
  - Step 3b) After 3 minutes, the client prints a summary of the ping stats  

Step 4) Start Server2 for udppinger-server2.cc - "./server2 12000"  
Step 5) In a separate terminal, run the client message - "./client2 127.0.0.1 12000"  
  - Step 5a) Client sends a ping every 2 seconds and should send a total of 90 pings  
  - Step 5b) After 3 minutes, the client prints a summary of the ping stats  
  - Step 5c) After 30 seconds, the server will automatically shut down after 30 seconds of inactivity  
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

### SUBMISSION
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
I have done this assignment completely on my own. I have not copied it, nor have I given my solution to anyone else. I understand that if I am involved in plagiarism or cheating I will have to sign an official form that I have cheated and that this form will be stored in my official university record. I also understand that I will receive a grade of "0" for the involved assignment and my grade will be reduced by one level (e.g., from "A" to "A-" or from "B+" to "B") for my first offense, and that I will receive a grade of "F" for the course for any additional offense of any kind.

By signing my name below and submitting the project, I confirm the above statement is true and that I have followed the course guidelines and policies.

* **Submission date:** [Insert the Submission Date When Truly Done]  
* **Team member 1 name:** Rick Kabuto  
* **Team member 1 tasks:**  
  1) udppinger-server1.cc, udppinger-client1.cc  
  2) udppinger-server2.cc, udppinger-client2.cc  
  3) Makefile & README.md  
  4) headerfile.h  
* **Team member 2 name (N/A, if not applicable):** N/A  
* **Team member 2 tasks (N/A, if not applicable):** N/A  
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
