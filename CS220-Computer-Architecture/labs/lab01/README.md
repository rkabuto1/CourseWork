# Lab 01 - Summing Command Line Arguments

## Lab Goals

The goal of this lab is to get used to the lab development environment, including using git, GitHub, and GitHub classroom in the lab environment, as well as doing some very simple and basic C programming. If you get stuck, check with the TA or CA or with students around you... just don't copy your neighbors code.

## Provided Code

I have provided two files in this repository:

### addArgs.c

This file is the start of a C program; it contains the basic lines of code to define a "main" function, but the main function itself is empty. Instead there is a comment that defines what I would like your program to do. Your job is to write the main function code.

### Makefile

I have also provided a Makefile. If you clone the repository, you will have a file in the resulting clone called "Makefile" with no suffix. This is correct because the `make` command expects a file called "Makefile" with no suffix.

Warning - if you download the Makefile instead of cloning it through "git", the web browser may add a ".txt" suffix to this file. The .txt suffix will break the make command. If you have a .txt suffix, use the UNIX rename command, `mv Makefile.txt Makefile` to remove the suffix.

For more details on the make command and Makefiles see [How to Use the Make Commmand](https://www.cs.binghamton.edu/~tbartens/HowTo/Makefile.html).

This Makefile has three explicit targets, "test", "gdb", and "clean". There is also an implicit target of "addArgs", which runs the C compiler (gcc) to create the addArgs executable file from addArgs.c.

- The "test" target builds the executable if required, and runs the result with some command line arguments. 
- The "gdb" target builds addArgs if it is out of date, and runs gdb for addArgs with run-time parameters. 
- The "clean" command removed the executable file created by make.

## Doing the Lab

1. Clone the repository on a UNIX machine. See [How to Use GitHub](https://www.cs.binghamton.edu/~tbartens/HowTo/Using_GitHub) for details on cloning, etc.
2. Read through the existing code as well as the explanations in this README file to understand the infrastructure. You can try compiling and running the code, but until you code the addArgs main function, the executable won't do anything.
3. Edit the addArgs.c file to complete the main function. The TODO comment in the addArgs.c file explains more about exactly what to do.

   Note that in C, the two parameters passed in to the main function can be used to access the command line parameters, the tokens contained on the command line when the executable for the C program is invoked.

   - The first parameter, traditionally named `argc`, is an integer count of the number of blank delimited "words" from the command line, including the name of the command itself.

   - The second parameter, traditionally `argv`, is an array of C "strings", where a string is a list of characters. In C notation, "strings" are described as character pointers, represented by `char *`. The specification of the second parameter in addArgs.c is `char *argv[]`. This specification states that `argv` is an array of unspecified length (that's the `[]`), where each element of the array is a `char *` or pointer to a list of characters. The number of elements in this array comes from `argc`.

   Thus, if the program is invoked using the command:

   ```bash
   ./addArgs 3 12 abc 4
   ```

   Then, argc would be set to 5 because there are five words on the command line, and the argv vector would look like:

   ```c
   argv[0] : "./addArgs"
   argv[1] : "3"
   argv[2] : "12"
   argv[3] : "abc"
   argv[4] : "4"
   ```

   Note that, for example, argv[1] consists of a string that contains the ASCII *character* '3', *not* the number 3. A better example is that argv[2] contains an ASCII character '1' followed by an ASCII character '2'; not the number 12.

   Use C standard library functions to convert ASCII character strings to integers called `atoi`, and print print output to the terminal using the `printf` library function. Documentation for the C standard library functions can be found in the [Linux Manual Pages](https://man7.org/linux/man-pages/dir_all_alphabetic.html). For more information on how to code a format string for printf, see [HowTo Use Format Strings in C](https://www.cs.binghamton.edu/~tbartens/HowTo/C_printf.html).

4. Build and test the result using the `make test` command. If you code the main function in addArgs.c correctly, the sum of the command line arguments should get printed as described in the TODO comment. If your code is not working correctly, try using gdb to stop your code where it is failing, and step through the code a line at a time to see what is going wrong. See [How to Use GDB](http://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb) for more on debugging with gdb.

5. Once your code is working, commit and push your results into your master git repository, and get the hash code using `git rev-parse HEAD`. Paste that hash code into the submission area for lab01 in Brightspace.

## Lab Grading

This lab is worth 10 points. You will get the full 10 points if the TA's can download your repository using the git hash code from Brightspace onto a computer science machine, and run `make test`, and get the correct results. Your code will also be tested with a different set of arguments to make sure it works with any arguments. You will receive the following deductions:

- -10 if the code in your repository does not attempt to address the problem.
- -5 if compiling addArgs.c causes a compile error.
- -2 if compiling addArgs.c causes a compiler warning
- -4 if the results do not print correctly.
- -1 if the Brightspace submission occurs after your lab period (A 5 or 10 minute grace period is allowed.)
- -2 for every 24 hours (or part of 24 hours) after the submission date.
