# Binghamton University, Summer 2025

## CS428/528 Project-1: Web Server

[This file uses Markdown, so please use correct Markdown syntax when editing the file]: #

### SUMMARY

[Provide a short description of your program's functionality, no more than a couple sentences]: #

This project implements a basic web server in C++ that handles HTTP GET requests. This project incorporates two parts
    - Part 1 supports one request at a time using a single thread, 
    - Part 2 introduces multithreading to serve multiple client connections concurrently with graceful shutdown via Ctrl+C.


### NOTES, KNOWN BUGS, AND/OR INCOMPLETE PARTS

[Add any notes you have here and/or any parts of the project you were not able to complete]: #

- All core functionality for both Part 1 and Part 2 is complete and working.
- No known bugs as of the final build. 
- Tested the code using docker to ensure that my code that was ran in macOS works in the grading Enviorment
- Tested with multiple browsers and `curl` for both single threaded and multi threaded cases.
- Signal handling in Part 2 gracefully closes the listening socket and joins all worker threads before shutdown.

### REFERENCES

[List any outside resources used]: #
- C++ reference for `std::thread`, `std::vector`, and `std::mutex`
- POSIX man pages for `socket()`, `bind()`, `listen()`, `accept()`, `read()`, `write()`, and `sigaction()`
- Official documentation for `sig_atomic_t` and `std::shared_timed_mutex`

[Provide clear and complete step-by-step instructions on how to run and test your project]: #
    1. Run the command "Make"
    2. Run the exuctable ./webserver1 28000 or <port you desire>
        2a. Test the browsers to ensure that the webserver is running
        2b. http://127.0.0.1:28000/home.html - Should show a picture with a link to a PDF
        2c. http://127.0.0.1:28000/bu.jpg - Should show a picture
        2d. http://127.0.0.1:28000/progit.pdf - Should Show a Textbook pdf
        2e. http://127.0.0.1:28000/thisisafakehtml.html - Should Throw an Error404
        2f. To ensure/sanity check the validation, use the curl command to test additional GET requests
    3. Run the executable ./webserver2 28000 or <port you desire>
        2a. Test the browsers to ensure that the webserver is running
        2b. http://127.0.0.1:28000/home.html - Should show a picture with a link to a PDF
        2c. http://127.0.0.1:28000/bu.jpg - Should show a picture
        2d. http://127.0.0.1:28000/progit.pdf - Should Show a Textbook pdf
        2e. http://127.0.0.1:28000/thisisafakehtml.html - Should Throw an Error404
        2f. To ensure/sanity check the validation, use the curl command to test additional GET requests
        2g. Part2 ensures multithreading 
    4. To stop the server -> Press Ctrl + C for Part 1 to competely kil the executable
    5. To stop the server -> Press Ctrl + C For part 2 and the server will announce a shutdown 
    and refresh the pages of the desired links from part 3 and the server will announce its shutdown.
    The links should NOT show anything and have error messages
    6. Finally, make sure you ensure the pictures/pdfs documents are inside the directory or this will NOT
    work

### SUBMISSION

I have done this assignment completely on my own. I have not copied it, nor have I given my solution to anyone else. I understand that if I am involved in plagiarism or cheating I will have to sign an official form that I have cheated and that this form will be stored in my official university record. I also understand that I will receive a grade of "0" for the involved assignment and my grade will be reduced by one level (e.g., from "A" to "A-" or from "B+" to "B") for my first offense, and that I will receive a grade of "F" for the course for any additional offense of any kind.

By signing my name below and submitting the project, I confirm the above statement is true and that I have followed the course guidelines and policies.

* **Submission date:**
06/30/25
* **Team member 1 name:**
Rick Kabuto
* **Team member 1 tasks:**
Part1 & Part2 & Makefile
* **Team member 2 name (N/A, if not applicable):**
N/A
* **Team member 2 tasks (N/A, if not applicable):**
N/A
