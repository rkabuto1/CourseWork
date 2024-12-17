# Lab 01 

- EXTENSION: Due to the technical issues first lecture, we are slightly behind. 
	- We have not covered reading text files in lecture, but we will first thing on Wednesday.
	- As a result, to be fair, I am extending lab01's typical due dates by two days to account for this.

- Soft deadline: Due Thursday 01/26, by 11:59 pm
- Hard deadline: Due Saturday 01/28, by 11:59 pm

**Ground Rules and Submission**

- Everyone needs to create their own version of the program
- You can provide as much assistance to other students as you want 
	- this is not considered cheating for this lab
- Once everything is working, demonstrate your program to a TA or CA
	- There are details of what to demonstrate later below.
	- When you are finished, `add`, `commit`, and `push` your code to your github repository.
		- Here is a small reminder of how you can do that.

		```
		git add -A
		git commit -m "finished lab01"
		git push 
		```

**Cloning the start code**
- First open a command prompt
- After accepting the assignment via the `classroom.github.com link` copy the SSH_URL created for your private repository.
- clone the repository to your machine via:
	`git clone [SSH_URL]`

**Setup**
- within your cloned repository, create a new file named `your_last_name_in_lower_case_lab1.java`. 
	- mine has a name of `bailey_lab1.java`.
- As with lab 0, create a class in your file, `your_last_name_in_lower_case_lab1` with a `public static void main(String[] args)` method in it
- Everything that you will be doing today will be included in the `main` method

**Program Description**
- Your program will be given one or more commandline arguments
- The first commandline argument is the input filename that your program is to read from
- [We will discuss reading from a text file in Wednesday's lecture.](https://github.com/Binghamton-University-CS140-Spring-2023/lecture_notes/blob/main/05_reading_files.md)

- Any additional commandline arguments will be tested against each of the tokens in the input file.
	- We want to count how many matches there are for each of them
- If there are no commandline arguments, then your program should output a message and exit (versus crashing)
	- Note that calling `System.exit(0);` will cause your program to exit

**Information to Track while parsing**
- Your program should keep track of the following information about the input file
	- The total number of lines in the file
	- The total number of tokens in the file
	- The total number of tokens that are integers
	- The sum of all of the integer tokens

- You can use a `StringTokenizer` to split the input lines into individual tokens (or a `Scanner` or `String.split()`)
	- Being we covered the `StringTokenizer` class and `String.split()` in lecture, those will probably be the easiest.
	- If you are feeling ambitious, [you are free to try to utilize the `Scanner` class instead.](https://docs.oracle.com/javase/7/docs/api/java/util/Scanner.html?is-external=true)
		-This is by no means a requirement, use whichever is more comfortable for you.

- Additionally, for each of the commandline arguments after the first one, we need to track:
	- The number of tokens that match that string without taking into account the case 
		- (that is, if the second commandline argument is “ab”, then any token that is “ab”, “Ab”, “aB”, or “AB” shall be considered matches)
		- The `String` class has a method `equalsIgnoreCase()` that should make this easy

**Expected Output**
- Your program should output the following information after reading the input file:
	- The total number of lines in the file
	- The total number of tokens in the file
	- The total number of tokens that are integers
	- The sum of all of the integer tokens
	- For each of the commandline arguments after the first one, in the same order that they were entered:
		- The argument followed by the number of matches in the file

- IMPORTANT: Use a `long` for the sum of all of the integer tokens

**Formating**

- To make it easier for the TA/CA to evaluate your demo, use the following `DecimalFormat` object to format your int and long output values:
	- `java.text.DecimalFormat df = new java.text.DecimalFormat("###,###,###,###,###")`;

- Example
	- Assuming `intSum` contains the sum of the integers we can format it with the `DecimaFormal` object `df` via:
	- `System.out.println(“intSum = “ + df.format(intSum));`


**Simple Example**
- An input filename "sample_file_1.txt" has been provided for you.
- the content is one just line: “a b c d e f g 1 1 1 2 3 0”

- I get the following output for the following command “java bailey_lab1 sample_file_1.txt”:

```
lineCount = 1
tokenCount = 13
intCount = 6
intSum = 8
```

- And I get the following output for the following command “java bailey_lab1 sample_file_1.txt a b c x”:

```
lineCount = 1
tokenCount = 13
intCount = 6
intSum = 8
a count = 1
b count = 1
c count = 1
x count = 0
```


**Second example**
- A second file, “sample_file_2.txt” has been provided for you.
- the content is the following 7 lines (Note the fifth line is empty):

```
a b c d e f g 1 1 1 2 3 0
joe fred bob bill andy
mary margaret ann mary kathie
the class may put some of us to sleep

10 20 50000 100000 1 1 1
10 10x 20 0 0 h i j k l m n o p
```

- I get the following output for the following command “java bailey_lab1 sample_file_2.txt”

```
lineCount = 7
tokenCount = 53
intCount = 17
IntSum = 150,071
```

- I get the following output for the following command “java bailey_lab1 sample_file_2.txt a b mary joe x 0”

```
lineCount = 7
tokenCount = 53
intCount = 17
IntSum = 150,071
a count = 1
b count = 1
mary count = 2
joe count = 1
x count = 0
0 count = 3
```

**Additional files provided**
- You will see there are two more files provided:
	- `sample_file_3.txt`
	- `test_file_1.txt` 
- The test file will be used when demoing your code to the TA for your grade.
- The other sample file is more complex example you can experiment reading / parsing via your program.

**Hint for differentiating tokens which are integers**
- In my program I used two `try/catch` blocks.
- Below is the second one which I use to convert the current token into an int:

``` java
try
{
	int v = Integer.parseInt(token); // token is the current token
	// statements to increment the number of ints found and
	// keep track of the sum of the ints found
}
catch(Exception e)
{
	// since this block is empty, exceptions related to converting
	// tokens into an int are simply skipped
}
```

- The first `try-catch` block contained almost all of the main method, except for the check if
there were any commandline arguments.
	- This first `try-catch` block is utilized to catch any exceptions related to reading the input file.
		- Alternatively, if you wish, you could also utlize a try-with-resources block, as discussed in lecture. 
		- Either is acceptable here.

- The second `try-catch` block, which was inside the first one, contained the code that converted the current token into an `int` via:
	- ```int v = Integer.parseInt(token);``` as shown above.

**Notes on the equalsIgnoreCase() String method**
- Suppose `s1` and `s2` are strings.
- `s1.equalsIgnoreCase(s2)`  returns true if `s1` and `s2` are equal strings, ignoring the case of `s1` and `s2`

**StringTokenizer review**

- Recall from lecture: You can use the following to create a `StringTokenizer` named `st` for the `String` with name `inn`:
	- `java.util.StringTokenizer st = new java.util.StringTokenizer(inn);`

- The lecture notes discuss some of the methods related to `StringTokenizer`
- The lecture notes also show how to create a `BufferedReader`
	- `java.io.BufferedReader input = ... `

- Once you are done reading from the `BufferedReader` `input`, you can close it with `input.close();`
	- Recall you need to close the `BufferedReader` at the end of the `try` block if you are using a `try/catch` block.
	- If you utilize a try-with-resource block, the call to the `close()` method is not necessary.

**Reading the text file line by line**

- Assuming you have constructed a `BufferedReader` named `input` and a declared `String` named `inn`, the following `while` loop can be used to read all of the lines of the `input` file:

``` java
while( (inn = input.readLine()) != null )
{
	// put your statements here to process the current the line of input
}
```

**Skeleton Code Provided**
- In the repository is a skeleton of my program. You can use it as a starting point if it helps.

**Hint on program sizing**
- My implementation has a total of 71 lines, of which three are blank lines and I put my `{` and `}` on
separate lines
- this should give you an idea of the approximate size of my program

**Lab Credit**

- To get credit for the lab, do the following:

- Demonstrate your program to a TA or CA
	- Run your program without any commandline parameters to demonstrate that it does not crash
	- Run your program with the following commandline parameters
		- `test_file_1.txt`
	- Run your program with the following commandline parameters
		- `test_file_1.txt ab ba dog cat`
	- Submit your completed code to github. Remember we add, commit, and push:
		```
		git add -A
		git commit -m "finished lab01"
		git push 
		```
