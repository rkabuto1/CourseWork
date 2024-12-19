# Lab10 - Stack Discovery

## Assignment Goals

Today's lab is designed to get familiar with the X86 ISA, specifically with the use of the stack in the X86 ISA. No coding is required. I have provided you with a correct implementation of the linked list C code we worked on for homework assignment 2, slightly modified to simplify the code. I have also provided the basic gdb commands to run the code under gdb in a Makefile. Today's lab will consist of running the code and looking at how the stack is used by that code.

You will need to answer questions about the stack in Gradescope to complete the lab.

## Basic Concepts : Stack Usage

We have been studying X86 stack usage in the [X86 Stack](https://www.cs.binghamton.edu/~tbartens/CS220_Spring_2024/Lectures/L13_x86_Stack.pdf) lecture. The basic ideas to keep in mind from this lecture are:

1. Every function has "prefix" code which creates an invocation record or stack frame for that function. The stack frame will contain all the local variables, parameter values, and some other information about the function invocation. While that function is executing the %rbp register points to the 8 byte "word" at the top of the stack frame, and the %rsp register points at the bottom of the stack frame. The stack frame is "pushed" onto the stack, below the stack frame of the calling function.

2. When the function returns, is has "suffix" code which "pops" its stack frame from the stack, and restores %rbp and %rsp to point to its caller's stack frame.

## Provided Code

There are several files in this repository already. These are the files used in HW02. See the HW02 readme for more details on linked lists and the code itself. However, for this lab, the details of the C code are not important.

Source code is in `node.h` and `node.c`, `list.h` and `list.c`, and `tryList.c`. I have provided correct implementations of all this code. You will not need to modify any of these files.

I have also provided a slightly modified Makefile that defines targets for:

- `gdb` : Runs gdb using a predefined set of arguments, with some setup commands as defined in `gdb_cmds.txt`
- `tryList` : Defines how to build the tryList executable file.
- `clean` : removes all the extra files created by the Makefile

I have also provided `gdb_cmds.txt` which has some initial gdb commands to run for this lab.

## Doing the Assignment

Clone the assignment on an LDAP machine. (Note that the assignment may run on other machines, but you may get different, incorrect answers to the Gradescope questions.)

Run `make gdb` to get started. This will break before executing the first instruction in the `main` function. Before going farther, open up Gradescope to Lab10, and follow the directions in Gradescope.

You may also want to use my [How To Use GDB](https://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb) web page as a reference.

Once you have finished all the Gradescope questions, submit on Gradescope, and you are finished with the lab. No need to submit anything else on Brightspace.

## Assignment Grading

We will use the Gradescope answers to grade your lab.

- -2 for every 24 hours (or part of 24 hours) after the submission date.
