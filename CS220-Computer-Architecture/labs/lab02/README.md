# Lab 02 - UNIX Filters

## Lab Goals

The goal of this lab is to get used to the lab development environment, including using git, GitHub, and GitHub classroom in the lab environment, doing some very simple and basic C programming, and learning about UNIX standard input, standard output, redirection, and pipelining. If you get stuck, check with the TA or CA or with students around you... just don't copy your neighbors code.

## Background : Filter Programs

One of the very nice things about UNIX is that it introduced the concept of a *filter* program. A filter program is a program that reads input data, processes it, and writes output data. UNIX adds the concepts of standardized Input/Output (I/O) by formalizing the concept of a standard input data stream called *stdin*, and a standard output data stream called *stdout*. Many of the C library functions automatically read from stdin (like `getchar` or `scanf`), or write to stdout (line `putchar` or `printf`).

Normally, when you run a program in a UNIX terminal, stdin is connected to the keyboard and standard output is connected to the terminal display. UNIX redirection is a way to change normal processing. You can *redirect* standard input or standard output so that stdin or stdout is connected to a file instead of the keyboard or terminal. You can even use pipelining to connect stdout of one program to stdin of another program. See [How To Use UNIX I/O Redirection](https://www.cs.binghamton.edu/~tbartens/HowTo/UNIX_Redirection) for more details on redirection.

A filter program in UNIX is just a program that reads input from stdin, potentially modifies the data, and writes the results to stdout.

## Provided Code

I have provided five files in this repository:

### countSpace.c

This file is a C filter program that has been provided for you as an example. This program reads from standard input, and counts the number of white space characters (blanks, tabs, newlines, etc.) found in the file, as well as writing the text, unchanged, to standard output. It then prints a message to standard error that tells the user how many white space characters were in the file.

### expandTabs.c

This file contains the start of a C filter program that you will need to finish. It contains the basic lines of code to define a "main" function which reads from standard input and writes to standard output. However, the code, as delivered does not change the file.

This program needs to replace each tab read from standard input with blanks, where the number of blanks is specified by the command line argument. There is a comment that defines the specific changes required to perform this function. (It's pretty simple... early days yet.)

### collapseSpaces.c

This file contains the start of a C filter program that you will also need to edit to finish the lab. It contains the basic lines of code to define a "main" function which reads from standard input and writes to standard output. Again, as delivered, the code does not change the file.

This program also reads a number, "n" from the command line.

You need to modify the code so that every time you see a string of `n` consecutive space characters in the input, you replace that string with a single tab character, `\t`. For example, if `n=4`, and there are two spaces in a row, then you should write out two spaces. But if there are ten spaces in a row in the input file, you should write out two tab characters and two spaces because there are two groups of 4 space characters, followed by two more space characters.

### example.txt

This file contains some example text that can be used as input to the countSpace, expandTabs, and collapseSpaces programs.

### Makefile

I have also provided a Makefile. See [How to Use the Make Command](https://www.cs.binghamton.edu/~tbartens/HowTo/Makefile) for make details. This Makefile has two explicit targets, "test" and "clean". There are also implicit targets for "countSpace", which creates the countSpace executable file from countSpace.c, "expandTabs" to build the "expandTabs" executable from expandTabs.c; and "collapseSpaces" which builds the "collapseSpaces executable from collapseSpaces.c.

The "test" target builds the executables if required, and runs the result with some command line arguments.

The "clean" command removed the executable file created by make.

## Doing the Lab

1. Clone the repository on a UNIX machine. See [How to Use GitHub](https://www.cs.binghamton.edu/~tbartens/HowTo/Using_GitHub) for details on cloning, etc.
2. Read through `example.txt`, which has the basic concepts for command line arguments, and redirection.
3. Read through the existing code as well as the explanations in this README file to understand the infrastructure. You can try compiling and running the code, but until you code the expandTabs main function, you won't get the correct results.
4. Edit the expandTabs.c file to complete the main function. The TODO comment in the expandTabs.c file explains more about exactly what to do.
5. Build and test the result using the `make test_expandTabs` command. If you code the main function in expandTabs.c correctly, you should see how the expandTabs filter modifies the amount of whitespace in the example.txt file.

   If your code is not working correctly, try using gdb to stop your code where it is failing, and step through the code a line at a time to see what is going wrong. See [How to Use GDB](http://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb) for more on debugging with gdb.

6. Edit the collapseSpaces.c file to complete the main function. The TODO comment in the collapseSpaces.c file explains more about exactly what to do.

7. Build and test the result using the `make test_collapseTabs` command. If you code the main function in collapseTabs.c correctly, you should see how the collapseTabs filter modifies the amount of whitespace in the example.txt after tabs have been expanded using exapandTabs.

   If your code is not working correctly, try using gdb to stop your code where it is failing, and step through the code a line at a time to see what is going wrong. See [How to Use GDB](http://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb) for more on debugging with gdb.

8. Do one file test using `make test` or just `make` (since `test` is the first taget in the Makefile.)

9. Once your code is working, commit and push your results into your master git repository, and get the hash code See [How to Use GitHub](https://www.cs.binghamton.edu/~tbartens/HowTo/Using_GitHub) for details on committing, pushing, and getting the hash code. Paste that hash code into the submission area for lab02 in Brightspace.

## Lab Grading

This lab is worth 10 points. You will get the full 10 points if the TA's can download your repository using the git hash code from Brightspace onto a computer science machine, and run `make test`, and get the correct results. Your code will also be tested with a different set of arguments to make sure it works with any arguments. You will receive the following deductions:

- -5 if compiling expandTabs.c or collapseSpaces.c causes a compile error.
- -2 if compiling expandTabs.c or collapseSpaces.c causes a compiler warning
- -4 if the results do not print correctly.
- -1 if the Brightspace submission occurs after your lab period (A 5 or 10 minute grace period is allowed.)
- -2 for every 24 hours (or part of 24 hours) after the submission date.
