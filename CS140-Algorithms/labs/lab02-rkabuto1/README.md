# Lab02 - Due 1/31 at 11:59 pm

**Description**

- For lab 2 we will be getting started on programming assignment 2
- Create a class and file
	- `your_last_name_in_lower_case_lab2`
	
- You need three methods in the class
	- `public static void main(String[] args)`
	- `public static void convertTextToBinary(String inputFilename, String outputFilename)`
	- `public static void convertBinaryToText(String inputFilename, String outputFilename)`

- The program will take three commandline arguments, the first should either start with a “b” or a “t” (“b2t” and “t2b”)
	- If the first argument starts with “b”, then your program will call `convertBinaryToText(args[1], args[2])`	
	- If the first argument starts with “t”, then your program will call `convertTextToBinary(args[1], args[2])`
	- The second and third commandline argument should be the input filename and the output filename respectively.
	
**Skeleton Code**

- Skeleton code has been provided for you in the repository. It is also shown here for the sake of clarity.

```java
class skeleton_lab2
{
	public static void main(String[] args)
	{
		// put some code here to check for three commandline arguments
		
		// puts some code here to check that the first commandline argument starts with "b" or "t"
		
		if( args[0].startsWith("b") )
		{
			convertBinaryToText(args[1], args[2]);
		}
		else
		{
			convertTextToBinary(args[1], args[2]);
		}
	}
	
	private static void convertBinaryToText(String inputFilename, String outputFilename)
	{
		System.out.println("convertBinaryToText");
		try
		{
			// put your code to read a binary file and output it as a text file
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			System.exit(0);
		}
	}
	
	private static void convertTextToBinary(String inputFilename, String outputFilename)
	{
		System.out.println("convertTextToBinary");
		try
		{
			// put your code to read a text file and output it as a binary file
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			System.exit(0);
		}
	}
}

```

- You may use it as your own. Feel free to change the name of the file to match `your_last_name_in_lower_case_lab2`.

**Goal for the lab**

- For the lab we will be putting together the infrastructure to:
	- read a text file and convert it to a binary file and
	- read a binary file and convert it to a text file
	
- For this lab, you need to:
	- Create the three methods
	- Add statements in the `main()` to `exit()` if three commandline arguments are not provided
	- Add statements to verify that the first command line argument starts with a “b” or a “t” and `exit()` if it doesn't, outputting some error message indicating that the argument was incorrect
	- Add statements to determine if the first command line argument starts with a “b” or a “t” and call the appropriate method
		- The `String` class has a method, `startsWith()`, that can be used to determine if `args[0]` starts with a “b” or a “t”
	- Begin partially implementing the two non-main methods (which will be finished off in programming assignment 2)

**Utilize the PrintWriter class**

- We have discussed instantiating a `PrintWriter` object and using the `PrintWriter.print()` and `PrintWriter.println()` methods for writing text to a file
	- Same as using `System.out.print()` and `System.out.println()` to print to the screen
	- Since Windows and Unix operating systems have different end of line characters for text files, you should use the `println()` method to terminate lines of text, since it will put the correct end of line character(s) in the output for the operating system that you are using

- When you are done writing to the `PrintWriter`, make sure to close it (`PrintWriter.close()`), which will ensure that the buffer is flushed and all the output is physically written to
the file
	- The same is true if you are writing to a buffered binary file
- You will need to enclose all of the statements of the two non-main methods in a `try/catch` block

**convertTextToBinary() method**

- For `convertTextToBinary()` you want to open the input file as a text file, and open the output file as a `DataOutputStream`
- then read all of the lines from the input file and write them to the binary file

- Note when you read the lines from the input file, you want to also store them in an `ArrayList` for use in programming assignment 2

- ```java.util.ArrayList<String> inputLines = new java.util.ArrayList<>(0);```
	- We discussed `ArrayLists` last week
	- The test code provided for program 1 has an example of using an `ArrayList`

	```java
	while( (inn = input.readLine()) != null )
	{
	inputLines.add(inn);
	}
	```

- You can convert the current input line of text to an array of `bytes` using the `String.getBytes()` method
- And then write the array of `bytes` to the output file, followed by writing the line seperator character using write(`System.lineSeperator().getBytes()`), since reading lines from the input file strips off the line seperator character

**convertBinaryToText() method**

- For `convertBinaryToText()` you want to open the input file as a binary file, and open the output file as a text file, and then read all of the bytes from the input file and write them to the output file

- You can create a `byte` array of dimension 1, and then read from the binary file into the `byte` array
	- For each `byte` read from the input file, create a string using the `String` constructor `String(byte[] bytes)` to convert the `byte` into a string and then write the string to the output file using `print()`
	- This is very inefficient, but don't worry about it. This code will be updated in your final programming assignment 2 code.
	
	
**Requirements**

- For this lab, you need to:
	- Open a text file for reading, then read from the text file
	- Open a text file for writing, then write to the text file
		- Same a writing to screen, use `print(String s)` or `println(String s)` 
	- Open a binary file for reading, then read from the binary file.
	- Open a `DataOutputStream` for writing binary, then write to the `DataOutputStream`
		- The `DataOutputStream.write(byte[] b)` works for this
		- An aside: Technically it is `FilterOutputStream.write(byte[] b)` whic `DataOutputStream` inherits from `FilterOutputStream`
		
**Useful Lecture Notes**

- [05 reading files](https://github.com/Binghamton-University-CS140-Spring-2023/lecture_notes/blob/main/05_reading_files.md)
- [06 reading / writing binary files](https://github.com/Binghamton-University-CS140-Spring-2023/lecture_notes/blob/main/06_reading_and_writing_binary_files.md)
- [07 more on reading / writing files](https://github.com/Binghamton-University-CS140-Spring-2023/lecture_notes/blob/main/07_more_on_reading_and_writing_files.md)

**Try-with-resources block**

- Recall that if you use the `try-with-resources` that you will not need to close the input and output files
- Recall for this, a semi colon delimitted list of resources is included within the `try` statement

```java
try( list of resources delimitted with semi colons )
{
// code goes here
}
```

**Getting credit**

1. Demonstrate your program to a TA/CA without commandline arguments to show it tells what arguments to provide and does not crash
2. Demonstrate your program to a TA/CA with three commandline arguments, with the first not starting with “b” or “t” and see that the program does not crash and outputs a message that the first parameter was incorrect
3. Demonstrate your program to a TA/CA with commandline arguments “t2b text_input_1.txt binary_output_1.txt”
	- Show the content of both files should be the same and have the same size
4. Demonstrate your program to a TA/CA with commandline arguments “b2t binary_input_1.txt text_output_1.txt”
	- Show the content of both files should be the same and have the same size
	
**Input files**

- The input file `text_input_1.txt` is shown below:

```
string dog aces diesel frogs fish horses pigs cows
double 23.1192012201
int 29833492
float 77.91532
long 3000458922
short 32000
int array
22,50,900000,87321,225968,2021140,992146,-75,-13683
string Gets a double from the second ByteBuffer at offset 0
double -74.3000213399999
int -94784
float -0.0010991
long -93256458922
short -21
int array
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
```

# Submission

- Submit to github via a add, commit, push:
```
git add -A
git commit -m "completed lab02"
git push
```
- Submit the latest commit hash to Brightspace:
```
git rev-parse HEAD
```


