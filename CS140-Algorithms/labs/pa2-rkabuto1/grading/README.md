------------------------
PA 2 - Grading
------------------------

## Motivation

This assignment is notoriously difficult to grade, and equally difficult for students to debug issues.
I am adding this README here to try to explain exactly how this grading script works, to make your life (hopefully) easier.

## Grading Directory Hierachy

The `grading` directory contains the following structure:

| Component | Description |
| --------- | ----------- |
| test_input_files | Contains input files the testing script utilizes |
| student_output_files | Contains output files your program produces while doing the conversion between text and binary |
| checkresults.java | Specifies the java code that was used to grade your work. |
| makeAndRun.sh | The bash script that can be run to perform the grading. |

## Running the bash script

To automate running the grader, do the following command:

```
	./makeAndRun.sh [YOUR_LAST_NAME]
```

- High level, the script will try to use your last name in certain lines of the test code, to account
for every student having a slightly altered class name. (This was by design throughout the course.)

- Once that replacement is done, the script simply compiles:
	- Your code
	- My test code `checkresults.java`
	- Does 18 conversions, first nine test cases involving t2b, the last nine test cases involving b2t
	- Runs the test code to check the results of the conversions.


## `test_input_files` and `program_output_files`

### Testing subdirectories

Within `test_input_files`, you will see there are two subdirectories, to separate the binary and text files.

- `bin` contains **binary files**
	- these will be given to your program to be converted to corresponding **text files**.
	- the resulting text files will be placed in `student_output_files/b2t` (The **binary to text** subdirectory).

- `txt` contains **text files**
	- these will be given to your program to be converted to corresponding **binary files**.
	- the resulting binary files will be placed in `student_output_files/t2b` (The **text to binary** subdirectory).

### Explanation on Test Processing

- The `test_input_files` directory contains a `bin` and `txt` directories.
- These input files will be fed to your code, to produce converted files.
- Your grade is based upon how accurately your converted files compare to the requirements laid out within the assignment.

### Concrete Example 

- To do the bulk of the comparison for each test case, I will compare:
	- your converted file
	- the opposite test input file
	- For example, if I ran your code to convert `test_input_files/bin/01.bin`
		- Your code would be run to do `b2t`, producing `student_output_files/b2t/[YOUR_NAME]_01.txt` file
		- I would compare the produced `[YOUR_NAME]_01.txt` file to `test_input_files/txt/01.txt`


## checkresults.java

- This script simply checks your converted files produced by your pa2 executable
- Attempts to see how closely the converted files represent the expected test files provided.
- There are 18 test cases, laid out below in a bit more detail:

| Test Case | Description | Input Test File | Program Output File      |
| --------- | ----------- | --------------- | ------------------------ |
| 01        | Everything  | bin/01.bin      | b2t/[YOUR_NAME]_01.txt   |
| 02        | string      | bin/02.bin      | b2t/[YOUR_NAME]_01.txt   |
| 03        | double      | bin/03.bin      | b2t/[YOUR_NAME]_02.txt   |
| 04        | int         | bin/04.bin      | b2t/[YOUR_NAME]_03.txt   |
| 05        | float       | bin/05.bin      | b2t/[YOUR_NAME]_04.txt   |
| 06        | long        | bin/06.bin      | b2t/[YOUR_NAME]_05.txt   |
| 07        | short       | bin/07.bin      | b2t/[YOUR_NAME]_06.txt   |
| 08        | long array  | bin/08.bin      | b2t/[YOUR_NAME]_07.txt   |
| 09        | float array | bin/09.bin      | b2t/[YOUR_NAME]_08.txt   |
| --------- | ----------- | --------------- | ------------------------ | 
| 10        | Everything  | txt/01.txt      | t2b/[YOUR_NAME]_01.bin   |
| 11        | string      | txt/02.txt      | t2b/[YOUR_NAME]_01.bin   |
| 12        | double      | txt/03.txt      | t2b/[YOUR_NAME]_02.bin   |
| 13        | int         | txt/04.txt      | t2b/[YOUR_NAME]_03.bin   |
| 14        | float       | txt/05.txt      | t2b/[YOUR_NAME]_04.bin   |
| 15        | long        | txt/06.txt      | t2b/[YOUR_NAME]_05.bin   |
| 16        | short       | txt/07.txt      | t2b/[YOUR_NAME]_06.bin   |
| 17        | long array  | txt/08.txt      | t2b/[YOUR_NAME]_07.bin   |
| 18        | float array | txt/09.txt      | t2b/[YOUR_NAME]_08.bin   |