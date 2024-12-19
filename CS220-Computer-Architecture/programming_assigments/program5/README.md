# HW06 - X86 Control Flow

## Background

We've been learning about X86 assembler. In order to master X86 assembler, we need to become familiar with the ways in which we can alter the sequential control flow of the X86 code.

We discussed X86 control flow in class in lecture [L10 X86 Instructions](https://www.cs.binghamton.edu/~tbartens/CS220_Spring_2024/Lectures/L11_x86_flow_control.pdf).

I've given you a simple C program. There are Gradescope questions about the X86 assembler generated from that program. Your job for this assignment is to answer those questions. You may be able to do so just by looking at the generated X86 assembler (the Makefile provided has a target to create the X86 assembler with interspersed C code), or you may wish to walk through the instructions using gdb debugging, where you have an opportunity to look at the values in registers and memory as well as single step through the X86 assembler instructions.

## Files Provided to You

The lab11 repository comes with several files provided for you, as follows:

- **x86cf.c** : This file contains a single `main` function with some very simple C code. Please do not modify this file. The questions you need to answer for this lab assume you have compiled unmodified code in x86cf.c. Feel free to look at the code and get an idea of what is going on. (Note that the code in x86cf.c does not do anything useful... it is provided only to demonstrate some of the ways the C compiler uses X86 control flow instructions.)

- **Makefile** : A file to provide rules for the make command.

  The Makefile contains implicit rules to create the x86cf binary executable file.
  
  There is also a generic rule (copied from the xmp_x86 example code) that makes the X86 assembler x86cf.s from x86cf.c. (The generic rule makes any .s file from any .c file.)

  There is also a rule to run objdump on the executable to disassemble the x86cf code.

  The Makefile also contains a `gdb` target, which runs the commands in gdb_cmds.txt, and runs on the x86cf executable file.

- **gdb_cmds.txt** : A file which contains gdb commands to be run after loading the x86cf executable file under gdb, used in the Makefile for the `gdb` target.

## Working the Lab

After you have cloned your repository, run `make x86cf.s`. The open the Gradescope lab11 assignment and start answering the questions. If you get stuck, try running `make gdb` and running under gdb to see what is going on. (You may want to modify the commands in gdb_cmds.txt to work on a specific problem.)

## Submitting the Lab

Once you have submitted your Gradescope answers, no other submission is required. Note that the assignment will not be marked complete when you submit your Gradescope answers. You can manually mark the assignment complete when you are done.

## Grading your Submission

The Gradescope answers will be graded. Once they are, you will be able to see the results in Gradescope, along with rubrics and explanations of the correct answers. Question 5 is a bonus question. You can get 0.25 points for each correct answer up to a maximum of 10 for the lab.
