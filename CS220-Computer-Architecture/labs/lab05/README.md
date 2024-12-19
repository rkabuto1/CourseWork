# Lab05 Understanding Floating Point

## Introduction

The goal of this assignment is to:

- Learn about manipulating bits ("bit twiddling") in C
- Learning about the implementation of floating point numbers.

We learned in [Lecture 7 Data in C: Floating Point](https://www.cs.binghamton.edu/~tbartens/CS220_Spring_2024/Lectures/L07_C_Float.pdf), that the `float` data type in C consists of three bit fields within a 32 bit space, a sign bit, an 8 bit biased exponent field, and a 23 bit fraction field.

The C `double` type follows the same IEEE 754 floating point conventions as `float`, but doubles use a 64 bit space divided into a single sign bit, an 11 bit biased exponent field, and a 52 bit fraction field.

For this lab, we will create a C program that reads double precision floating point numbers from the command line, and extracts the three fields from the 64 bit area in memory that holds the concrete bits for the `double` floating point number.

## Background - Reading Floating Point Bits

The actual bits used for floating point numbers in C are devilishly difficult to extract. Suppose you have a value in variable `doubleVar`, which is declared as a `double`, and you want to determine the concrete bits used to make that value.

If you try to get at the bits by doing an assignment statement such as `unsigned long lng=doubleVar;` then C will perform data conversion on the value in doubleVar extracting the integer part and expressing that in binary before assigning it to the lng variable.

Even if you explicitly cast using `unsigned long lng = (long)doubleVar;`, C will still perform the conversion. The result is that the lng variable does not have the concrete bits used to make up the floating point variable in doubleVar.

Another option is to use the C library `memcpy` function, as in `memcpy(lng,doubleVar,sizeof(double));`. This option works, but needs some fairly complex casting to avoid compiler warnings, and it's not the most efficient way of handling things.

There is also a C library function called `frexp` which extracts the exponent and fractional values from a double, but this is also complicated, and doesn't return the concrete bits, but rather an abstract interpretation of those bits.

The easiest way to handle this problem is to make a C union, e.g.

```C
union floatlong {
   double fl;
   unsigned long lng;
} uf;
```

This statement says to reserve 8 bytes for `uf` (the size of both a `double` and of an `unsigned long`). That 8 byte memory can be referred to either using `uf.fl` in which case, the compiler will interpret the bits a a floating point double value, or using `uf.lng`, in which case the compiler will interpret the bits as a 64 bit unsigned long integer.

With this union, we can now assign `uf.fl=doubleValue;`, but then get at the concrete bits by examining `uf.lng`. This union and the example code that uses it are provided for you already.

## Provided to you

This homework repository already contains some infrastructure to get you started, as follows:

### bitFields.h and bitFields.c

These files make up the bit-twiddling library we worked on in HW03. I have provided you with my correct implementation of these libraries.

Here is the documentation for the 5 functions in this library (from HW03):

- `int getBit(int bn,unsigned long val)` : extracts a single bit value at position bn from the target variable `val`, and returns an integer 0 or 1 depending on the value of the bn'th bit in val.

- `void setBit(int bn,int new,unsigned long *val)` : Sets the value of the `bn` bit in the target variable `val` to the value in `new`. The bn'th bit in val is set to 1 if new is non-zero, or 0 if new is zero.

- `long getBitFld(int bs,int len,unsigned long val)` : extracts a subfield starting at position `bs` for a length of `len` from the target variable `val` and returns a signed long integer that represents the result treated as a signed two's complement value.

- `unsigned long getBitFldU(int bs,int len,unsigned long val)` : extracts a subfield starting at position `bs` for a length of `len` from the target variable `val` and returns an unsigned long integer that represents the result treated as an unsigned binary number.

- `void setBitFld(int bs,int len,unsigned long new,unsigned long *val)` : inserts the value represented by the rightmost `len` bits of `new` (which may be signed or unsigned) into the unsigned long target pointed to by `val` starting at position `bs` for length `len`.

### showFloat.c

I have provided the basic infrastructure for a C program that reads floating point command line arguments, and prints information about each argument. That information includes:

- The value of the sign bit (1 or 0), extracted using the `getSign` function.
- The raw value of the unbiased  exponent, extracted using the `getUnbiasedExp` function.
- The biased value of the exponent, extracted using the `getBiasedExp` function.
- The value of the fraction bits, extracted using the `getFracBits` function.

The showFloat.c file already contains a `main` function which has been coded for you, and a `getConcreteBits` function which has been coded for you. The `getConcreteBits` function takes a double precision floating point value as input, and returns the concrete bits from that input value as a 64 bit unsigned long value.

In fact, all of the code you need for the showFloat program has been provided for you *except* for the function definitions for the four extraction functions: `getSign`, `getUnbiasedExp`, `getBiasedExp`, and `getFracBits`.

Note that showFloat.c also defines several pre-processor macros to make life easier; namely:

```C
#define SIGNBIT 63
#define EXPSTART 62
#define EXPBITS 11
#define FRACSTART 51
#define FRACBITS 52
#define DOUBLEBIAS 1023
```

These macros defined all the constants required to deal with double precision floating point numbers.

### Makefile

I have provided a Makefile with several targets:

- `test` - run the showFloat executable
- `gdb` - run gdb on the showFloat executable.
- `showFloat` - builds the showFloat executable
- `clean` removes all the files Makefile can create

## Coding the project

After reading through this readme, complete the function definitions for the four undefined showFloat functions in showFloat.c, and then `make` to see if you have everything correct.

The specifications for the four undefined functions are as follows:

- `int getSign(double floatIn)` : extract and return the sign bit from the 64 concrete double precision floating point bits represented by `lng`.
- `int getUnbiasedExp(double floatIn)` : extract and return the value of the unbiased exponent from the 64 concrete double precision floating point bits represented by `lng`.
- `int getBiasedExp(double floatIn)` : extract and return the value of the biased exponent from the 64 concrete double precision floating point bits represented by `lng`.
- `char * getFrac(double floatIn,char *buf)` : extract and return the 52 fraction bits (without the implicit "1.") from the 64 concrete double precision floating point bits represented by `lng`. Write an ASCII '0' or '1' for each bit into the space provided by the `buf` argument, followed by a null string terminator. You may assume that the `buf` argument points to enough valid space to hold 52 characters plus a null terminator. Return a pointer to the beginning of `buf`.

You can check your results with the [IEEE-754 Analysis CUNY calculator](https://babbage.cs.qc.cuny.edu/IEEE-754/) using the "Binary 64" results. (If you can't read the detailed results because your browswer is showing white characters on a yellow background, select the detail text to highlight it, and you will be able to read it easier.)

## Hints and Suggestions

1. Use the bitField library functions to make you life easier.

2. You don't have write code to extract the exponent twice. The `getBiasedExp` function can invoke `getUnbiasedExp`, and then just return the biased result.

3. In `getFrac`, I found it easier to loop through each fraction bit one at a time, and use the `getBit` function to extract that fraction bit and determine whether to write a '1' or '0' into buf. The alternative is to get all the bits using `getBitFld` or `getBitFldU`, and then figure out how to print the binary result.
   
4. In this assignment, you don't need to do anything special about "special cases" such as infinity, Not-a-Number, or sub-normal numbers. Treat all these cases as if they were just normal floating point numbers and you will get full credit.

## Submitting the Homework

When you have finished coding and testing your showFloat.c functions, make sure you do a final git commit and push to update your main git repository. Then, retrieve the 16 digit git hash code either from browsing your updated repository on the web, or using the command `git rev-parse HEAD` on the command line. Paste the git hash code in the Brightspace Lab05 assignment. You may resubmit as many times as you would like to. Only the last submission will be graded.

## Grading Criteria

Your repository will be downloaded onto an LDAP machine at the level corresponding to the hash code retrieved from Brightspace, and compiled and run using the Makefile. Your code will be tested with the Makefile provided to you, and with an unpublished test input that performs similar tests. The results will be compared to correct results. The assignment is worth 10 points, and the following deductions will occur:

- -10 if your code matches or is significantly similar to any other student's code.
- -8 If your code does not attempt to address the problem.
- -8 if showFloat does not compile
- Up to -4 if there are mismatches on the published test case
- Up to -4 points per test if there are incorrect results on the unpublished test case
- -1 if showFloat produces warning  messages when compiled
- -1 if your repository contains any executable files
- -1 if the Brightspace submission occurs after your lab period (A 5 or 10 minute grace period is allowed.)
- -2 for every 24 hours (or part of 24 hours) after the submission date.
