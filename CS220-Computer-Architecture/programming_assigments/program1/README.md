# HW01 - Object Oriented C

## Assignment Goals

This assignment gives some practice using some of the more advanced capabilities of the abstract C language, including:

- Structures
- Use of pointers, especially pointers to structures
- Typedefs to define new data types
- Use of malloc and free to manage an unknown number of objects
- Object oriented C programming (even though C is not an object oriented language)
- Makefile with implicit rules
- Mutli-file C program

These concepts are used in an implementation of some basic geometry, specifically (x,y) coordinates and a line. I have provided you with most of the code you will need, including all the functions required to manipulate an (x,y) coordinate in a cartesian plane, the infrastructure to manipulate a line object, and a main function to try out your code..

This assignment is very typical of an assignment in the industry because most of the infrastructure will be provided to you. You will need to read the existing C code to determine how best to add new function that takes advantage of the infrastructure.

## BackGround

### High School Geometry

This assignment will deal with (x,y) coordinates in a two-dimensional cartesian plane, and infinite lines also in the cartesian plane. For this assignment, we will use the basic formula for a line: `y = mx + b`, where `(x,y)` represents a point on the line, `m` is the *slope* of the line, and `b` represents the *y-intercept*, the `y` coordinate of the line when `x=0`.

If we are given two points, (x<sub>1</sub>,y<sub>1</sub>) and (x<sub>2</sub>,y<sub>2</sub>), we can find the slope of the line using the formula:

m = (y<sub>1</sub> - y<sub>2</sub>) / (x<sub>1</sub> - x<sub>2</sub>)

and the y intercept can be calculated with:

b = y<sub>1</sub> - x<sub>1</sub> * m

Finally, if we are given two lines:

y = m<sub>1</sub> x + b<sub>1</sub>

y = m<sub>2</sub> x + b<sub>2</sub>

... Then if m<sub>1</sub> == m<sub>2</sub> then the lines are parallel, and we can assume there is no intersection. Otherwise, the intersection point (x<sub>i</sub>,y<sub>i</sub>) can be determined by the formula:

x<sub>i</sub> = (b<sub>2</sub> - b<sub>1</sub>) / (m<sub>1</sub> - m<sub>2</sub>)

y<sub>i</sub> = x<sub>i</sub> * m<sub>1</sub> + b<sub>1</sub>

### C Coding Style

This assignment introduces a C coding style that makes the C language slightly more object oriented. This style is describe in more detail in my [How To Use Object Oriented Coding Techniques in C](https://www.cs.binghamton.edu/~tbartens/HowTo/OOC.html) web page. The coord.h and coord.c files in this repository is an example of a `coord` class, used to manage (x,y) coordinate objects.

## Provided Code

There are several files in this repository already, as follows:

### coord.h and coord.c

The coord.h and coord.h files define the `coord` object - an object with x and y fields to define a single point on a cartesian coordinate. I have provided everything you will need for this assignment. You should not have to modify coord.h or coord.c.

### line.h and line.c

I have also provided a line.h header file that contains a typedef for a `line` "class", and declarations for functions that act as methods in that class. You should not need to modify the line.h file.

I have **not** provided the code in line.c. You will need to write the required code to complete this assignment.

### tryGeom.c

The tryGeom.c file includes a main function which uses both coord and line objects and classes, and reports on the results. You should not need to modify tryGeom.c, but can use it to test your functions in line.c.

### Makefile

I have provided a Makefile that defines Make variables for the C compiler (CC) and C flags (CLAGS) to be used for this assignment (and this course.) I have included three explicit make rules:

- `test` : has a dependency on the tryGeom executable file, and runs tryGeom.
- `tryGeom` : Defines how to build the tryGeom executable file from multiple C source files. Since tryGeom requires multiple .c files, an implicit rule will not work.
- `checkMem` : has a dependency on the tryGeom executable file, and will run the tryGeom executable under valgrind to check for memory problems.
- `clean` : removes all the extra files created by the Makefile. In this case, only the tryGeom executable.

If you run `make` with no arguments or `make test`, it will choose the first target of "test". That will cause the make command to check tryGeom. But the tryGeom target has dependencies on tryGeom.c, coord.h coord.c, line.h and line.c, so make will check to see if these dependencies are newer than tryGeom. If so, tryGeom will be rebuilt. If any of the compiles or the link edit fails, make will halt before running tryGeom at that step.

Bottom line, just run "make". That will run compiles for any changed .c files and create the tryGeom executable, and run the test on that executable.

## Doing the Assignment

1. Clone the repository on a UNIX machine. See [How to Use GitHub](https://www.cs.binghamton.edu/~tbartens/HowTo/Using_GitHub) for details on cloning, etc.
2. Read through the existing code as well as the explanations in this README file to understand the infrastructure. You can try compiling and running the code, but until you code the lien methods, the results will be incorrect.
3. Edit the line.c file to specify the "fields" for a line object, and to complete the "methods" for lines. See coord.c for examples to copy.
4. Build and test the result using the make command. The printed output from testGeom should make sense and be correct.  If your code is not working correctly, try using gdb to stop your code where it is failing, and step through the code a line at a time to see what is going wrong. See [How to Use GDB](http://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb) for more on debugging with gdb.
5. Once your code is working, commit and push your results into your master git repository, and get the hash code using `git rev-parse HEAD`. Paste that hash code into the submission area for hw01 in Brightspace.

If you get stuck, and can't figure out how to make progress on this assignment, please contact either the professor or one of the TA's during office hours, or via e-mail. The main purpose of this assignment is to see where there are problems or areas that need more attention... not to make you frustrated, so please let us know if you are confused or can't get something to work.

## Assignment Grading

This homework assignment is worth 10 points. You will get the full 10 points if the TA's can download your repository using the git hash code from Brightspace onto a computer science machine, build tryGeom with the original versions of coord.h, coord.c line.h, tryGeom.c, and the Makefile itself with no errors, and run `make test`, and get the correct results. You may receive the following deductions:

- -7 if there are compile errors building tryGeom
- -2 if there are compiler warnings building tryGeom
- -5 if line.c has not been modified.
- up to -5 if results are not correct. Note that this will include deductions for extra debug output as well as incorrect values.
- -2 if there are any memory errors running valgrind
- -2 for every 24 hours (or part of 24 hours) after the submission date.
