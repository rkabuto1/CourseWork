# Program Assignment 1 - Due 2/4 by 11:59 pm

**Description**

- For this programming assignment we will be implementing a class to use:
	- `for`, `while`, and `do-while` loops 
	- a `switch` statement
	- an implementation of **selection sort**.

- You are to construct a class named `your_last_name_in_lower_case_letters_p1` with the appropriate filename. 
	- Mine is `bailey_p1.java`. 
- Below is a sketch of what your class should look like. 

**TODOs**
- The assignment is to fill in the details of the five methods: 
	- `selectionSort`, 
	- `forLoopTest`, 
	- `whileLoopTest`, 
	- `doWhileLoopTest`, and 
	- `switchTest`. 
- You need to get the method names and parameters correct, since I will be wrapping a test program around your program and calling
your methods.

**Skeleton Code**

A skeleton of what you should submit has been provided below:

``` java
class your_last_name_in_lower_case_p1
{
	// constructor for the class
	public your_last_name_in_lower_case_p1()
	{
	}

	// method to sort an array of String values using selection sort.
	// Sort the strings by length and then alphabetically, starting at lowerBound and ending at upperBound
	public String[] selectionSort(String[] values, int lowerBound, int upperBound)
	{
		//TODO: - implement
	}

	// method to return the number of array elements > testValue with indices in [lowerBound, upperBound]
	// using a for loop to examine the array elements
	public int forLoopTest(int[] values, int lowerBound, int upperBound, int testValue)
	{
		//TODO: - implement
	}

	// method to return the number of array elements <= testValue with indices in [lowerBound, upperBound)
	// using a while loop to examine the array elements
	public int whileLoopTest(int[] values, int lowerBound, int upperBound, int testValue)
	{
		//TODO: - implement
	}

	// method to return the number of array elements in (testValue1, testValue2) or (testValue2, testValue1) with
	// indices in [lowerBound, upperBound] using a do-while loop to examine the array elements
	public int doWhileLoopTest(int[] values, int lowerBound, int upperBound, int testValue1, int testValue2)
	{
		//TODO: - implement
	}

	// method to return the number of array elements that match the switch cases [0, 3, 6, 9, 12, 15, 18, 21, 24, 27] and the default case with indices in (lowerBound, upperBound)
	public int[] switchTest(int lowerBound, int upperBound, int[] values)
	{
		//TODO: - implement
	}
}
```

**Hints for each Method Implementation**

- For the `selectionSort` method, you can:
	- simply sort the array in place, for those elements in the range `[lowerBound, upperBound]`
	- `return` it at the end of the function.
- For `forLoopTest`, `whileLoopTest`, and `doWhileLoopTest`, you can: 
	- create a counter to keep track of how many array elements meet the criteria
	- `return` the counter at the end of the method.
- For the `switchTest`, you can:
	- create an `int` array of size 11 
	- (0 – 9 for cases `0, 3, 6, 9, 12, 15, 18, 21, 24, 27` and then index 10 for the `default` `case`)
	- initialize to `0` for all indices, and then 
	- increment the appropriate index for each `case`. 
	- `return` the array at the end of the method.

**Requirements**

For the five methods, your class is to do the following:

- **`selectionSort`** – sort the `String` array in ***ascending*** order by length and then (if the same length) alphabetically for array elements in the range `[lowerBound, upperBound]` and `return` the result. 
	- You can use the `String.length()` method for the length comparison.
	- You can use the `String.compareTo()` method to compare two Strings alphabetically.
		- Note: `x` is in [`a`,`b`] iff (`a` <= `x` <= `b`).
		- You only need to use `String.compareTo()` when the two strings that you are comparing have the same length.
- **`forLoopTest`** – `return` the number of array elements that are ***strictly greater than*** the `testValue` parameter, for those array elements with indices in `[lowerBound, upperBound]`, using a `for` loop to go through the appropriate array indices.
- **`whileLoopTest`** – `return` the number of array elements that are ***less than or equal to*** the `testValue` parameter, for those array elements with indices in `[lowerBound, upperBound)`, using a `while` loop to go through the appropriate array indices.
	- Note: `x` is in [`a`, `b`) iff (`a` <= `x` < `b`).
- **`doWhileLoopTest`** – `return` the number of array elements that are ***in the range*** `(testValue1, testValue2)` **or** `(testValue2, testValue1)`, for those array elements with indices in `[lowerBound, upperBound]`, using a `do-while` loop to go through the appropriate array indices.
	- Note that `testValue1` may be `<= testValue2` or may be `>= testValue2`.
	- Note: `x` is in (`a`,`b`) iff (`a` < `x` < `b`)
- **`switchTest`** – create a `switch` with cases `0, 3, 6, ..., 27`, and `default`. Loop over all of the array elements with indices in `(lowerBound, upperBound)`, and use each array value as the test value for your `switch`. For each switch `case`, increment the appropriate array element each time the `case` executes. 
	- Each ***even*** value case and the `default` `case` should end with a `break` statement. 
	- Each ***odd*** value case statements should NOT include a break statement.
	- You should initialize an array of length 11, with indices 0 – 9 equating to the cases `0, 3, 6, ..., 27`, and the index 10 going with the `default` case. Initialize the array to `0` for all indices, and `return` the array at the end of the method.

**Test Program Description**

- I have provided a small test program, `test_p1.java`, to assist you in testing your program. 
- The test program takes six commandline arguments:
	- `args[0]` – the filename of a text file with values to use as the values array
	- `args[1]` – used as `lowerBound`
	- `args[2]` – used as `upperBound`
	- `args[3]` – used as `testValue`
	- `args[4]` – used as `testValue1`
	- `args[5]` – used as `testValue2`

- Note: The program does not validate the correctness of commandline arguments.
- The test program reads the lines from the text file and populates two arrays. 
	- One array is a `String[]` for use with selection sort
	- And the second array is an `int[]` for use with the 
		- `for` loop, 
		- `while` loop, 
		- `do while` loop, and 
		- `switch` tests. 
- The test program outputs:
	- the commandline arguments
	- the result of the calls to:
		- `selectionSort`,
		- `forLoopTest`, 
		- `whileLoopTest`, 
		- `doWhileLoopTest`, and 
		- `switchTest`. 

**Running the Test Program - with your class**

- To run `test_p1.java` with your program, replace `bailey_p1 testClass = new bailey_p1();` with your program's class name.
- I have also included one sample file, `sample_2.txt`, which consists of 39 lines of values, three copies of each of 0 – 13, in pseudo random order.
Here is what the sample file content is:

```
# empty lines and lines starting with "#" are ignored
# this file has three copies of the values in [0, 12] in pseudo order
10
12
7
4
12
2
0
3
6
5
8
9
9
5
2
12
10
0
11
8
8
4
6
5
11
0
3
3
9
1
7
1
11
10
6
7
2
4
1
```

**Sample 2 Txt - Expected Output**

- Below is the expected output of executing `java test_p1 sample_2.txt 0 38 5 5 7`: 

```
"sample_2.txt" has 39 values to process
lowerBound = 0
upperBound = 38
testValue = 5
testValue1 = 5
testValue2 = 7
sorted values
0
0
0
1
1
1
2
2
2
3
3
3
4
4
4
5
5
5
6

6
6
7
7
7
8
8
8
9
9
9
10
10
10
11
11
11
12
12
12
forLoopTestResult = 21
whileLoopTestResult = 17
doWhileLoopTestResult = 3
doWhileLoopTestResult2 = 3
switchTestResult[0] = 3
switchTestResult[1] = 3
switchTestResult[2] = 6
switchTestResult[3] = 3
switchTestResult[4] = 6
switchTestResult[5] = 0
switchTestResult[6] = 0
switchTestResult[7] = 0
switchTestResult[8] = 0
switchTestResult[9] = 0
switchTestResult[10] = 22
```

# Submission

**Add, Commit, and Push**

- To submit your program, push your completed code up to your github repository by midnight on the due date.
	```
	git add -A
	git commit -m 
	git push
	```
	- Warning: Your grade will not be based on how your code performs with the provided test program.
	- I will have a separate program to test your program. 
	- Do not put you java file in a zip file, tar file, rar file, or any other archive file.
	- Refrain from utilizing java packages.

**NEW REQUIREMENT - Submit the Latest Commit Hash**
- Lastly, you will need to submit your ***last commit hash*** to BrightSpace from now moving forward.
	- Every time we `commit` and `push` to our github repository, a unique commit hash is generated.
	- To get the latest commit hash run the following command, ***after you have pushed your final commit***
	```git rev-parse HEAD```
	- Copy the output to BrightSpace and submit for this program. 
	- If you want to resubmit before the deadline, it is ok to submit more than one time.
	- Your assignment will be checked out to the commit hash submitted on BrightSpace.

**Sanity check - utilize Git Log**

- Afterward, you can do `git log` to see a log of your repository's commit history. 
	- If the command puts you in a separate paging window:
		- hold `ENTER` to scroll downward if you wish
		- hit `q` to quit out of the logs being viewed (an aside: this acts similar to the `man` (manual) command)
- Compare the latest commit hash grabbed with the output of `git log` to confirm you have the right one.

***If you there are any questions or concerns with this commit hash business, reach out to the TA/CA or instructor for guidance.***

**Grading**	

The program will be grades as follows:
- Getting the submission correct will account for 20% of the grade
- Getting the correct results for my tests will account for 80% of the grade.