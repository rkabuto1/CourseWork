# Lab 03 - Pointers v Arrays

## Lab Goals

This lab is designed to highlight the similarities between arrays and pointers in C.

In order to keep this simple, we will be working on arrays of single characters that have a null terminator, commonly known as a "string". To show that we can do the same things with pointers that we do with arrays, you will implement some very simple string functions using arrays, and then the same functions using pointers.

Note that all of these functions are already available in the C string library defined in string.h, but I'm going to ask you to write your own versions of these functions. They are quite simple.

## Lab Ground Rules

I will ask you to write two version of each function, an array version of the function and a pointer version of the function.

In the array version, you are not allowed to use the C indirection operator `(*a)`. You must use square bracket array notation like `a[i]` for all references to letters in the string.

In the pointer version, you are not allowed to use the square bracket array notation like `a[i]`. You must use the indirection operator, `(*a)` for all references to letters in the string.

Note that I use a type definition of "string x" to indicate either an array of unspecified length, `char x[]`, for the array version of the function, or a pointer to a list of characters, `char *x`, for the pointer version of the function. See stringLib.h for the two versions of the string typedef.

The specifications for the functions I'm asking you to write are as follows.

- **stringLength(string x)** Counts the number of characters in string x before the first null terminator character, '\0', and returns that count.

- **stringCopy(string a,string b)** Copies all characters from string b up to (and including) the first null terminator in b to a. This function assumes that there is enough space in string a to hold string b.

- **stringCat(string a,string b)** Copies all characters from string b up to (and including) the first null terminator in b into a, int a, starting at the first null terminator in string a. This function assumes there is enough space in string a to hold the concatenated result.

## Provided Code

There are several files (other than the README.md) in this repository already, as follows:

### stringLib.h

The stringLib.h file contains the declarations for the three string functions described above, assuming that `string x` typedef has been predefined to produce either `char * x` in the pointer notation style, or `char x[]` in the array style. This enables a single header file to be used for either array or pointer style.

### stringLibA.c

The stringLibA.c file contains the definitions of the three string functions, assuming **array** notation for strings. You will need to write the function bodies for these functions using array notation (square brackets). This should be very simple... you are all familiar with working with arrays of letters, and that's all you need to work with.

### stringLibP.c

The stringLibP.c file contains the definitions of the three string functions,but you will need to write the function bodies using pointer notation `(*x)`. This may be a little confusing at first, but soon you will get the hang of it. See the class lecture notes on [Abstract C](https://www.cs.binghamton.edu/~tbartens/CS220_Spring_2024/Lectures/L04_Abstract_C.pdf) page 72 for an example.

### stringTest.c

The stringTest.c file contains code which invokes the three string functions to make sure you have coded them correctly. You should not change this code.

Notice that the stringTest.c function declares four different local string variables, `str1`,`str2`,`str3,` and `str4`, some using pointer notation, and some using array notation. These will be used as arguments to the string functions.

I can build two different executable files using the exact same stringTest.c code, but one with stringLibP.c, and the other with stringLibA.c. Both executables should do the exact same thing.

However, since I only have one "stringLib.h" for both executables,  I use the existence of a the pre-processor variable `POINTER_NOTATION` to choose how to define the `string` typedef. The `POINTER_NOTATION` pre-processor variable is actually defined by the `-DPOINTER_NOTATION` parameter to the gcc compiler. See the Makefile for an example of how this is used.

### Makefile

I have provided a Makefile that defines Make variables for the C compiler (CC) and C flags (CFLAGS) to be used for this assignment (and this course.) I have several explicit make rules:

- `test` : has a dependency on both the testA and testP, but no recipe. This just runs both tests.
- `testA` : has a dependency on the strTestA executable, and just runs the strTestA executable.
- `testP` : has a dependency on the strTestP executable, and just runs the strTestP executable.
- `strTestA` : builds the strTestA executable using stringTest.c and stringLibA.c as inputs.
- `strTestP` : builds the strTestP executable using stringTest.c and stringLibP.c as inputs.
- `clean` : removes all the extra files created by the Makefile (the strTestA and strTestB executable files)

## Doing the Assignment

1. Clone the repository on a UNIX machine. See [How to Use GitHub](https://www.cs.binghamton.edu/~tbartens/HowTo/Using_GitHub) for details on cloning, etc.
2. Read through the existing code as well as the explanations in this README file to understand the infrastructure. You can try compiling and running the code, but until you code the string functions in stringLibA.c and stringLibP.c, the results will be bogus.
3. Edit the stringLibA.c file to complete the three string library functions. You are not allowed to use the C library functions in string.h, and you must use array notation to perform the required function. Don't forget to add null terminators to the end of strings when required!
4. Build and test the strTestA executable. (You can use the command "make testStrTestA".) If your code is not working correctly, try using gdb to stop your code where it is failing, and step through the code a line at a time to see what is going wrong. See [How to Use GDB](http://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb) for more on debugging with gdb.
5. Edit the stringLibP.c file to complete the three string library functions. You are not allowed to use the C library functions in string.h, and you must use pointer notation to perform the required function. Again, don't forget the null terminators!
6. Build and test the strTestP executable. (You can use the command "make testStrTestP".) If your code is not working correctly, try using gdb to stop your code where it is failing, and step through the code a line at a time to see what is going wrong. See [How to Use GDB](http://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb) for more on debugging with gdb.
7. Run "make test" or just "make" to ensure that both executables produce the same correct result.
8. Once your code is working, commit and push your results into your master git repository, and get the hash code using `git rev-parse HEAD`. Paste that hash code into the submission area for Lab 04 in Brightspace.

## Hints and Suggestions

1. When using pointer notation, you can still use an index into the string. The *i*th letter in the string is `a[i]` using array notation, or `*(a+i)` using pointer notation. Or, another coding style is just to use the pointer passed into you (since that is a copy of the original pointer), and just increment the pointer. So, `(*a)` is the first character in a, but then I can do an `a++`, followed by `(*a)` to get the second character in a, and so on.

2. There are many ways of specifying a literal null termination character in the C language.

   - I think the cleanest and most legible way to write a null terminator is `0x00`. This is a single eight bit character that contains all zero bits.

   - You may also use the expression `'\0'` to represent an 8 bit 0 value.

   - You can use a simple `0` literal, but this 0 literal is really an int, or a 32 bit value of zero. When you assign that to a character, the leftmost 24 bits are truncated, and the results is eight bits of zeroes, so it works, but requires the compiler to make a 32 bit number and then truncate it.

   - Some people use `NULL` as a null terminator. This is even worse. In fact NULL is a pointer with a zero value, and since most machines use 64 bit pointers, that means the compiler needs to make a 64 bit 0 value, and then when you assign that to a character, the compiler needs to throw away the leftmost 56 bits. Besides, you will need an explicit cast to avoid a compiler warning about incorrect types - assigning a pointer value to a character target.

## Lab Grading

This lab is worth 10 points. You will get the full 10 points if the TA's can download your repository using the git hash code from Brightspace onto a computer science machine, and run `make test`, and get the correct results. You will receive the following deductions:

- -5 if there are any compile errors in your code.
- -2 if there are any compiler warnings in your code
- -2 if stringLibA.c uses pointer notation
- -2 if stringLibP.c uses array notation
- -2 if the results do not print correctly for strTestA.
- -2 if the results do not print correctly for strTestP.
- -1 if your repository contains any executable file or files.
- -1 if the Brightspace submission occurs after your lab period (A 5 or 10 minute grace period is allowed.)
- -2 for every 24 hours (or part of 24 hours) after the submission date.
