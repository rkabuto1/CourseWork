# HW05 - X86 from Your Favorite C Code

## Background

We've been learning about X86 assembler, but most of the examples we've been looking at are pretty contrived. For this homework, let's look at some C code of your choice and see how the X86 translation works.

The idea here is to pick some C code you are somewhat familiar with, like maybe your packer.c program from project 1, or some other C code from this semester or other semesters... even very cool C code you found on the internet. The idea is to add this C code to your repository, look at the X86 code generated from the C code, and see if there is anything unusual or different about the way the gcc compiler turned your C code into X86 assembler. You will need to add the C code of your choice to your repository.

This homework demonstrates several different ways to view the X86 code generated from your C code. You may use any or all of these for the homework. The following methods are available

1. The gcc compiler does the work of translating your C code into binary machine code. If you use the right options, you can get the gcc compiler to write out the man-readable version of this X86 code, interspersed with comments to cross reference the C instructions with the X86 instructions produced.

2. There is a web site called "godbolt" which can be used to convert C code into X86 assembler, and show the correlation between the C code and the X86 assembler. You will need to cut and paste the code you are interested in into this site: <https://godbolt.org/>. You will need to select compiler `x86-64 gcc 13.2`, and paste your code into the "Type your code here" screen on the left.

3. Once you have created an executable, it is possible to extract information from this executable, including the X86 code for a specific function, using a tool called `objdump`. If you have the right debug options turned on, you can include extra information that shows the C lines of code used to produce the X86 code.

4. Once you have created an executable, if the right debug information is available in that executable, you can run `gdb` on the executable, and use gdb's disassembler to see the X86 code, and use nexti and stepi to step through that

Once you have looked at your code, edit the file in your repository called **interesting.txt**. You need to add a small write-up in your interesting.txt file that highlights one or two lines from the C code in your file, and shows why the translation of that line or lines to X86 instructions is interesting or mysterious. Maybe the compiler performed an optimization that you hadn't thought of; or used some X86 instructions that were unusual and you had to look up. Maybe you expected some different X86 instructions, but the compiler surprised you. You just need to highlight something that you find interesting or that you couldn't understand.

## Files Provided to You

The hw05 repository comes with several files provided for you, as follows:

- **Makefile** : A file to provide rules for the make command.

  The Makefile contains implicit rules to create the a binary executable file from a C file of the same name.
  
  There is also a generic rule (copied from the xmp_x86 example code) that makes the X86 assembler xyz.s from xyz.c. The generic rule makes any .s file from any .c file with the same file name!

  There is also a generic rule to run `objdump` on an executable file to print out the C code and the X86 assembly for a C function in that file. If you added a file called myPgm.c, you could run `make myPgm` to build the myPgm executable, and then run `make myPGM.obj.txt` to dump the `main` function for that program. If you want to dump a the `subFunc` function instead of `main`, you can run `make clean` followed by `make FUNCTION=subFunc myPgm.obj.txt`. Note that this rule won't work UNLESS you have already built the executable. The generic rules aren't as good about building dependencies automatically.
  
  Finally, there is a generic rule to run gdb on an executable. Again, if you added a file called myPgm.c, you can run `make myPgm` to build the myPgm executable, followed by `make gdb_myPgm` which will start myPgm under gdb, run to the `main` function, disassemble the main function, and sets `disassemble-next-line` on so that a nexti or stepi instruction will show the X86 assembler about to execute. If you want to look at the `subFunc` function instead of `main`, you can run `make FUNCTION=subFunc gdb_myPgm`. Again, this won't work until you build the executable.

- **interesting.txt** - A text file where you can describe something interesting you found in the X86 translation.

## Working the Lab

After you have cloned your repository, copy some C code into your repository. Don't forget to do a `git add` for the C code you copied in.

Then make *yourprogram*.s from *yourprogram*.c and look at the translation of the C instructions into X86 code. Skip over the boring stuff, but look for interesting translations. If you can't figure out how the translation works, don't hesitate to ask the TA's CA's or professor for help.

Once you've found something interesting, document how that translation worked and why it is interesting in **interesting.txt**. Show a line or two of C code, the X86 code generated from that C code, explain how it works, and describe why you think it is interesting. We're not looking for long extended descriptions; As Shakespeare first stated in Hamlet, brevity is the soul of wit; just enough to understand why you thought that translation was interesting.

## Submitting the Lab

Make sure you have added your C code, and committed and pushed your changes into your git repository. Then cut and paste the resulting hash code into Brightspace under HW05. We will try to use some of the more interesting examples in class when discussing the C to X86 translations.

## Grading your Submission

You will get +4 points if your repository has a C program in it, and up to 6 more points if you highlight a line or two from you C code that was translated into X86 in some interesting way. The better the description of what happened and why it was interesting, the more points you will get.

As usual, there will be a -2 point deduction for each 24 hours (or part of 24 hours) the submission is late. After 5 days, there will be a -10 deduction.
