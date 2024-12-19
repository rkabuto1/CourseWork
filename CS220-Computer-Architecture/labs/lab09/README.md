# Lab09 Reading Arithmetic X86

## Background

We are learning about the X86 assembly language, especially the X86 assembly language produced by the gcc compiler from C code. In this lab, we will look at some X86 assembly language code that was generated from a simple C program, and try to figure out what the C code looks like from the X86 code.

That means that this repository does **not** contain the original C code, but you do have access to the binary executable file and the X86 assembly code derived from the original C code.

The code consists of a `main` function, and four sub-functions: `funcA`, `funcB`, `funcC`, and `funcD`. Your job is to figure out what these functions are doing.

## Files Provided For You

The repository contains several files, as follows:

- `intMath` - A binary executable file that contains the binary X86 instructions derived from `intMath.c`, compiled to run on the LDAP machines.

- `intMath.s` - The X86 assembler code produced by gcc when given `intMath.c` as input. Note that the flag, `fverbose-asm`, was **not** used, so this does not contain the original C code as comments.

- `Makefile` - a file for the `make` command that supports the following targets:
  - `test` - run the `intMath` command.
  - `intMath.obj.txt` - run `objdump` to extract the X86 assembler from the `intMath` executable file.
  - `gdb_intMath` - runs gdb on the `intMath` command.  

## Doing the Lab

The ultimate goal of this lab is to answer the questions in Gradescope. To see those questions, open a browser, and go to Brightspace/CS-220/Course Tools/Gradescope and open the Lab09 assignment. There are a series of questions in this assignment that require you to understand the X86 instructions, and figure out what C code was used to create those instructions.

There are several tools available to help you answer the questions. First, you can look at the X86 assembler itself in either the Gradescope question, or the `intMath.s` file, or you can create an intMath.obj.txt file to extract the X86 assembly from the binary instructions, or you can run under gdb and step through the X86 assembly, looking at register and memory values along the way.

Once you have answered the Gradescope questions, submit on Gradescope and you are done.

## Hints and Suggestions

1. C is a high level language. The C code to produce these functions is really very simple.

2. If you get confused reading the X86 assembly, try running under gdb. My reference page for gdb is [here](https://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb).

   The `Makefile` has a `gdb_intMath` target that runs until you get to `funcA` the first time. You can run commands such as `disassemble`,  and then use `nexti` to step through the code.  As you step through the code, print register values using commands such as `print $edi`, and print memory values using, for example `x /d $rbp-12` to show the integer at `-12(%rbp)`.

   The `gdb_intMath` is defined in the Makefile to stop at funcA. To work on a different function, you might want to edit the Makefile and stop at a different function.

3. This lab provides many ways to read the X86 assembler code in `intMath`. You don't need to use all of the ways... use whichever you find most useful.

## Submitting the Lab

For this lab, you do not need to submit the repository. All that is required is to submit the answers in Gradescope.

Unfortunately, Brightspace doesn't know when you have submitted in Gradescope, so you can manually mark the assignment as complete in Brightspace when you have submitted in Gradescope.

## Grading the Lab

The Gradescope questions are worth 10 points. Your grade for this lab will be the Gradescope grade. After the grading is complete, you will be able to see the rubrics used to grade the results, and the correct answers to the questions.

There will be the usual deduction of 2 points per day for late submissions.
