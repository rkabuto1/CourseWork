-----------------------------------------
Programming Assignment 2 - Due 2/18
-----------------------------------------

# Description

- For this programming assignment we will be implementing a class with two methods to:

	- read a text file 
	- ***encode*** the text file as binary 
	- output the data to a binary file	

*AND:*	

- read a binary file 
- ***decode*** the binary data
- output the content as a text file 

**Inverse Functionality** 
	
- The two functions should be inverses of each other. That is: 

- ***TEXT -> BINARY -> TEXT:*** 
	- If we take the text file (assuming it has no empty lines or lines starting with “#”), ***encode*** it as binary, and then take the resulting binary file and ***decode*** it back to a text file, we should end up with our original text file. 

- ***BINARY -> TEXT -> BINARY:*** 
	- The same is true in reverse.
	- If we take a binary file, ***decode*** it to a text file, and then take the resulting text file and ***encode*** it again as a binary file, we should end up with our original binary file.

# Windows / Unix OS caveats

- Since Windows and Unix operating systems end text lines with different characters, when you
write the text file, you should use the `println()` method, which will output the correct
symbol(s) for the operating system that you are using.

|Operating System | End of Line Terminator(s) |
| --------------- | ------------------------- |
| Unix | '\n' (new line symbol) |
| Windows | '\r\n' (carriage return and new line symbols) | 

# Starting Point

- You are to construct a class named `your_last_name_in_lower_case_letters_p2` with the appropriate filename. 
- You will need to use lab 2 as a starting point for this program. 
- You should already have the methods that read and write to the text and binary files.

**Reading the binary file**

- When reading the binary file, you are to:
	- use a `DataInputStream` to read primitive types directly from the file
	- Don't utilize a `byte` array, nor a `ByteBuffer` while reading (you can while writing)

**Writing the binary file**	

- When ***writing*** the binary file, you are to:
	- use a `ByteBuffer` to write primitive types to a `byte` array
	- then use a `BufferredOutputStream` or `FileOutputStream` to write the `byte` array to the binary file.

**Text file format**	

- The text file consists of lines broken into two parts, delimitted by a tab character. 
- The first part:
	- appears to the ***left*** of the tab delimiter 
	- specifies what ***type of data*** is on the line. 
- The second part:
	- appears to the ***right*** of the tab delimiter
	- is the ***data value***

**Supported data types**	
- The valid types of data are: 
	- `string`, `double`, `float`, `int`, `long`, `short`, 
	- `long array`, and `float array`
	- **NOTE:** These will appear to the left of the tab delimiter on each line
	- **NOTE:** Some of the types specified above are slightly different from how we would declare these types as a variable in java.

**Data formatting**
	
- After the tab, the appropriate value follows.

| Data type (left of tab) | Data Formatting (right of tab) |
| --------- | --------------- |
| `string` | A string literal. Should be treated as a ***sequence of `char`*** when converting it to binary |
| `double` | A double. |
| `int` | An integer. |
| `float` | A float. |
| `long` | A long. |
| `short` | A short. |
| `long array` | A ***comma delimitted list*** of longs. |
| `float array` | A ***comma delimitted list*** of floats. |

**Lines to be ignored - Blank lines and comments**

- Lines of length 0 and lines starting with a “#” symbol are to be ignored.
- Think of lines starting with `#` as being commented lines..

**Example Text File**

- Below is an example of a ***text file*** (`test_file_1.txt`):

```
string dog aces diesel frogs fish horses pigs cows
double 23.1192012201
int 29833492
float 77.91532
long 3000458922
short 32000
long array 22,50,900000,87321,225968,2021140,992146,-75,-13683
string Gets a double from the second ByteBuffer at offset 0
double -74.3000213399999
int -94784
float -0.0010991
long -93256458922
short -21
long array 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
float array -12.9931,31.01102,9223433.23
```

It is included in this repository, in the `test_files` directory.

**Format for Writing Binary Files**

- The binary file has the following format.

- 4 `bytes` of an `int` defining how many blocks of data are to follow
- For each block (a block equates to a line of the text file):
	- 2 `bytes` of a `char` specifying the type of data
		- 'i' – `int`
		- 'l' – `long`
		- 'h' – `short`
		- 'f' – `float`
		- 'd' – `double`
		- 'b' – `long array`
			- There is an int value immediately after the 'b' specifying how many values are in the array
		- 's' – `string`
			- There is an int value immediately after the 's' specifying how many characters are in the array
		- 'g' – `float array`
			- There is an int value immediately after the 'g' specifying how many values are in the array
	- The value(s)
		- For `int` there are 4 `bytes`
		- For `long` there are 8 `bytes`
		- For `short` there are 2 `bytes`
		- For `float` there are 4 `bytes`
		- For `double` there are 8 `bytes`
		- For `string` there are 2 `bytes` x string length
		- For `long array` there are 8 `bytes` x number of values
		- For `float array` there are 4 `bytes` x number of values

**Some example binary representations**

- Since the binary file is not readable for non-string values, I will describe a couple of examples of blocks.

- 4 bytes of int containing the number of blocks of data
- `int` example
	- 2 `bytes` of `char` consisting of 'i'
	- 4 `bytes` of `int`
- `double` example
	- 2 `bytes` of `char` consisting of 'd'
	- 8 `bytes` of `double`
- `long array` example
	- 2 `bytes` of `char` consisting of 'b'
	- 4 `bytes` of `int` specifying the number of array elements
	- 8 `bytes` of `long` x number of array elements
- `float array` example
	- 2 `bytes` of `char` consisting of 'g'
	- 4 `bytes` of `int` specifying the number of array elements
	- 4 `bytes` of `float` x number of array elements
- `string` example (sequence of char)
	- 2 `bytes` of `char` consisting of 's'
	- 4 `bytes` of `int` specifying the string length
	- 2 `bytes` of `char` x length of string
	
**Requirements while Reading / Writing the binary files described above**	

- For reading the binary file, you are to:
	- use a `DataInputStream` to directly read primitive types from the file
	
- For writing the binary file, you are to:
	- use a `BufferredOutputStream` or `FileOutputStream` to write bytes from a `byte` array to the output file.
	- **Note:** You must use a `ByteBuffer` wrapped around the `byte` array to write primitive types to the `byte` array, which will then be written to the output file.

## Text to Binary Conversion	

For the text to binary conversion portion, you want to:

- process one line at a time
- Each line equates to a block in the binary file
- For lab 2 we stored all of the lines of the text file in an `ArrayList`
	- this was so that we could determine the number of blocks that the binary file will consist of, so that it can be written at the beginning of the binary file.
	
**Tips for Parsing a line**
	
- You can use a `StringTokenizer` or `Scanner` or `String.split()` to parse the text file lines into:
	- the ***type of data*** prior to **(left of)** the tab and 
	- the ***data value*** after **(right of)** the tab. 

**converting to bytes**

- For converting primitive types to bytes, I used:
	- A single `byte` array of size 8 for all conversions, since that would fit a single primitive type for all types.
	- Each time I needed to output a value to the binary file, I would: 	
		- put the primitive type into the `byte` array at index 0
		- then write the corresponding number of bytes to the binary file from the `byte` array starting at index 0. 

**put methods**
	
- For the primitive lines, I used:
	- `putChar()` to specify for the ***block data type*** 
	- `putInt()`, `putShort()`, `putLong()`, `putFloat()`, or `putDouble()` to specify the ***data value***

- For the string and array lines, I:
	- used `putChar()` for the ***block data type***
	- used `putInt()` for the ***string length*** or ***number of array elements***
	- looped over the array elements (I converted the String to an array of char)
		- used `putChar()`, `putLong()`, or `putFloat()` for each array element.

**writing the byte array**

Each time I put a value into the `byte` array, I wrote out the corresponding number of bytes from the `byte` array to the output file.

## Binary to Text Conversion

This is probably where things get tricky for most students. 
For the binary to text conversion:

- the number of blocks (found at the beginning) can be used in a looping fashion 
	- each iteration through the loop:
		- you can process the current block of data 
		- which will result in a line being written to the text file. 
	
- To process the current block, you want to:
	- read 2 `bytes` of `char` to figure out what ***type of data*** is contained in the block
	- then read the appropriate primitive type. 
	- for the string and arrays, you will additionally need to:
		- read 4 `bytes` of `int` to determine the length of the data
		- and then read the data
		
- I read the data (string/array) in a loop, one `readChar()`, `readLong()`, or `readFloat()` at a time. 

**Implementation Details**

- Here's some information about my implementation, which I believe I have finished. 

- My class has 251 lines in it, with 10 lines that output diagnostic info to the terminal, approximately 26 blank lines, and around 78 lines with just a “{“ or a “}” on them. 

- Although this program seems to really want to use a switch, I ended up using an if-then statement for each of the eight line/block types. 

- I didn't use if-then-else statements, but just eight mutually exclusive if-then statements. 

- For the ***binary to text*** method, I have a loop over the number of blocks, and within the loop I decode each block and output a line to the text file after decoding each block. 
	- Each of the if-then statements completely handles the current block. 
	- That is, it reads the data and writes the text output. 
	
- For the ***text to binary*** method, I loop over the input lines.
	- Once again, I have eight if-then statements, each of which results in writing the binary data block that goes with the current input line.

# Debugging tips

- Once you start implementing your code, I would suggest:
	- you create a test file for the current line/block type that you are implementing
	- and test that line/block type until you get good results

**Sample files for different cases you need to handle**	

- I have provided a sample file for each block type:
	- `sample_file_n.txt` (the text file) 
	- and `sample_file_n_bin.txt` (the binary file)
	- for n in {1, 2, 3, 4, 5, 6, 7, 8}. 

**Files that are OS dependent**
	
- The files starting with "windows" have the normal Windows end of line symbols.
	- They reside in the directory `sample_files/windows_txt` 
- The files that do not start with “windows” have the normal Unix end of line symbol. 
	- They reside in the directory `sample_files/unix_txt`
- The binary files do not use end of line symbols.
	- They reside in the directory `sample_files/binary`

**ReadAndOutputBinaryFile.java - peek at contents of Binary Files**

I have also provide a program, `ReadAndOutputBinaryFile.java`, which will:
- read a file (`filename` is the first commandline argument), and 
- output each character read in binary and ascii. 
- Note that some ascii symbols may cause “odd” effects to the command prompt or terminal.


Below is a text file for an `int` block with the `int` having a value of `3`:
```
int 3
```

Below is the output from `ReadAndOutputBinaryFile` of the text version of the file:

```
01101001 i
01101110 n
01110100 t
00001001
00110011 3
00001010
byteCount = 6
```

Below is the output `ReadAndOutputBinaryFile` of the binary version of the file:

```
00000000
00000000
00000000
00000001
00000000
01101001 i
00000000
00000000
00000000
00000011
byteCount = 10
```

**Note:** Although the binary file here looks larger than the text file, keep in mind that generally speaking, binary files can store data more efficiently than text files can.

**Submission Details**

- Submit by midnight on the due date to github.
- Remember, we add, commit, and push:
```
git add -A
git commit -m "completed program assignment 2"
git push 
```
- Finally, submit the latest commit hash on Brightspace
- Remember, we can get the latest commit hash printed by running:
```
git rev-parse HEAD
```
