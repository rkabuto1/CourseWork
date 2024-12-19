# Lab 7 Making Makefiles

## Introduction

It has come to my attention that students have been ignoring the Makefile's that I have provided for labs, homework and projects. Most students have been running the make command, but few have taken the trouble to look at the Makefile itself and understand what it is doing for you.

This lab is designed to make sure you understand how to create your own Makefile, and code the Makefile to perform some fairly sophisticated testing automatically.

## Background

Think of a spy embedded in a foreign country who would like to communicate with his home country, but has to assume that the communication lines are tapped. To prevent a secret messages from being read, the spy should encode the messages, using a secret key that only the spy and the home team know. The encoded messages should be unreadable by the foreign country. But the home team has a decode program, and as long as the message is decoded with the same key as it was encoded, the home team should be able to read the original message.

In both the practice test 1 and the real test 1, I showed examples of UNIX filters which encode and decode text using a key. If you remember from the test, there were two programs, `encode` and `decode`. Both programs take a single run-time argument, a key, and read from standard input and write to standard output.

The `encode` program reads the raw text, and produces an encoded (non-readable) version of that text. The encode program must output valid ASCII text.

The `decode` program reads the encoded text, and if the key for decode matches the key for encode, the original raw text should be printed out. If the key is different, the decode program should **not** print out the original raw text.

For this lab, I will provide you with an encode program in `encode.c`, and a decode program in `decode.c`, and a program to check that its input is valid ASCII called `checkASCII.c`, along with three example messages. Your job is to create a Makefile that builds the encode and decode programs, the ASCII checking program, and runs tests on these programs using the example messages to make sure that the programs are running correctly.

## Provided to you

The lab07 repository already contains everything you need to test my encode/decode solution **except** for the Makefile. This includes:
  
- **encode.c** and **decode.c** - The programs to encode raw text into ciphered text and decode the encoded text and recover the raw text.

- **checkASCII.c** - A C program that reads from standard input, and checks that data to make sure it is ASCII printable data. If not, prints the position of non-ASCII characters. If so, prints a message saying so.

- **test1.txt**, **test2.txt**, and **test3.txt** - Three files that contain text that should be used to test encode/decode.

## Makefile Specifications

Your job is to create a Makefile to test encode/decode. The Makefile must meet the following specifications:

1. It must have variables to get make to use the gcc compiler, and to use C compile options `-Wall -std=c18 -ggdb`.

2. It must define a make variable for the key of each test (and there will be three tests, so there should be three key variables.) The first key should be "testKey". The second key should be "AAAA". The third key should be "whatsup".

3. The first rule in the Makefile (the one executed by default) should be a `test` rule that has dependencies on test1, test2, and test3 targets. (No recipe is required. Making the dependencies is all you need.)

4. The individual test target, `test1`, should have a dependency on **test1_decode.txt** and **test1_decode_bad.txt**. The recipe for the test1 rule should perform the following actions:

   A. The command `@echo "Comparing test1_decode.txt to original"` This command helps to understand the Makefile output. The "@" in front of echo prevents the make command from printing out the command itself before running echo (which would be redundant in this case.)

   B. The command `diff -i test1_decode.txt test1.txt`. This compares the test1_decode.txt file to the test1.txt file. The -i flag tells diff to ignore differences in case.

   C. The command `@echo "Comparing test1_decode_bad.txt to original (expect miscompares)"`.

   D. The command `diff -i test1_decode_bad.txt test1.txt` to compare the text decoded with a bad key against the original. Warning. You will need to edit this line because `diff` returns a non-zero (bad) return code if the files are different, and that will cause the `make` command to halt. In this case, we expect a non-zero return code, and we want make to keep going.

   E. A command to remove all the test1 specific temporary files we created to perform the test.

5. A `test1_decode.txt` target that depends on the decode executable, the checkASCII executable, and the file `test1_encode.txt`. The recipe for this target should contain the following:

   A. The command `@echo "Creating test1_decode.txt"`

   B. An invocation of the `decode` program that specifies the first key as the command line argument, and redirects file **test1_encode.txt** to standard input, and **test1_decode.txt** to standard output.

   C. An invocation of the `checkASCII` executable that redirects file **test1_decode.txt** to standard input.

6. A `test1_decode_bad.txt` target that depends on the `decode` executable and the `test1_encode.txt` file. The recipe for this target should contain the following:

   A. The command `@echo "Creating test1_decode_bad.txt"`

   B. An invocation of the `decode` program that specifies the **second** key as the command line argument, and redirects file **test1_encode.txt** to standard input, and **test1_decode_bad.txt** to standard output.

7. A `test1_encode.txt` target that depends on the encode executable, the checkASCII executable, and the file `test1.txt`. The recipe for this target should contain the following:

   A. The command `@echo "Creating test1_encode.txt"`

   B. An invocation of the `encode` program that specifies the first key as the command line argument, and redirects file **test1.txt** to standard input, and **test1_encode.txt** to standard output.

   C. An invocation of the `checkASCII` executable that redirects file **test1_encode.txt** to standard input.

8. A set of `test2`, `test2_decode.txt`, `test2_decode_bad.txt` and `test2_encode.txt` targets using the same structure as test1, but with test1 changed to test2. The test2_decode_bad.txt rule should use the test3 key.

9. A set of `test3`, `test3_decode.txt`, `test3_decode_bad.txt` and `test3_encode.txt` targets using the same structure as test1, but with test1 changed to test3. The test3_decode_bad.txt rule should use the test1 key.

10. A `clean` target which removes all of any temporary test files which might be left in the current directory, as well as all executable files created by the Makefile. This should be coded so that the make command does not fail if any of the files are not present.

Note that you may rely on implicit rules to build the `encode`, `decode`, and `checkASCII` executables since they are all built from a single C file of the same name.

## Doing the Lab: Hints and Suggestions

1. Here's a link to my [How to Use the Make Command](https://www.cs.binghamton.edu/~tbartens/HowTo/Makefile) notes.

2. When creating a Makefile, start off with the UNIX command `touch Makefile` to create your Makefile with no file extension. Then you can edit it with no problems. (Many editors get confused about how to "Save As" a file with no extension, so creating a correctly named empty file first solves this problem.)

3. Work on the test1 rules first. When you get them working, it's easy to just copy the test1 rules and change the 1's to 2's. Then, when test2 is working do the same thing for test3.

4. Work "bottom up", not "top down". In other words, code the `test1_encode.txt` rule first, then the `test1_decode.txt` and `test1_decode_bad.txt` rules, and finally the `test1`. rule. Try your Makefile at each step of the way to make sure it's working correctly.

5. As far as I know, the encode and decode C code I am providing passes all three tests.

6. Make sure all your dependencies are correct. For example, if you "modify" encode.c, and then run make, do all expected steps get run? (You can update the time/date stamp of a file without actually changing the contents of that file by running the UNIX command "touch". For example, `touch encode.c` makes it look like encode.c has been modified.)

7. When you are done making and building the Makefile, don't forget to run `git add Makefile` before running git commit and push.

## Submitting the Project

When you have finished coding and testing your encode and decode programs, make sure you do a final git commit and push to update your main git repository. Then, retrieve the 16 digit git hash code either from browsing your updated repository on the web, or using the command `git rev-parse HEAD` on the command line. Paste the git hash code in the Brightspace lab07 assignment. You may resubmit as many times as you would like to. Only the last submission will be graded.

## Grading Criteria

Your repository will be downloaded onto an LDAP machine at the level corresponding to the hash code retrieved from Brightspace, and compiled and run using your Makefile. The output from `make` (with no arguments) will be compared to the expected output. The lab is worth 10 points, and the following deductions will occur:

- -2 If your "echo" commands don't match what is expected (which makes grading harder.)
- -2 For each of test1, test2, and test3 which do not work correctly for anything other than the echo commands.
- -2 If `make clean` does not work correctly.
- -2 for every 24 hours your are late.
