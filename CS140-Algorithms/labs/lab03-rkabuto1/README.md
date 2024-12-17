# Lab03

**Description / Requirements**

- For lab 3 we will be reading a ***blank space delimited*** text file and writing a blank space delimited text file. While processing the input file, we will be make the following modification to each line of input. First, for each line the words will be written ***in the reverse order*** that they show up in the current input line. That is, the line “cats dogs frogs” becomes “frogs dogs cats”. And secondly, each word will be ***written backwards***. The two combined takes an input line of “cats dogs frogs” and outputs “sgorf sgod stac”. Additionally we will be keeping a list of the unique words that the input file contains. We will also keep track of the number of lines in the input file, the total number of words in the input file, and the total number of characters contained in the words of the input file.

- Your program should be named `your_last_name_in_lower_case_lab3.java` with a corresponding class name. Your program will take two or three command line arguments. The first is the input filename, the second is the output filename, and the third, which is optional, will be one of {“True”, “true”, “Yes”, “yes”, “T”, “t”, “Y”, “y”} signifying if you should output the sorted list of unique words in the input file.

- To create the unique list of words you are to use a `TreeSet`. The `TreeSet` will create a unique list and will also store them in sorted order. You are to also use an `ArrayDeque` to reverse the order of the words in each input line. This is one of the nice features of a ***stack***. It naturally reverses the order for you. I used a `StringTokenizer` to parse the words from each input line. You are free to use a `StringTokenizer`, a `Scanner`, or any other way you wish to parse the input lines of text.

**Implementation Hints**

We have already used most of the Java language features needed to complete this lab. Below is a summary:

1. To create a `BufferedReader` to read a text file we have previously used
	- `java.io.BufferedReader input = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(inputFilename)));`
2. To create a `PrintWriter` to write to a text file we have previously used
	- `java.io.PrintWriter output = new java.io.PrintWriter(new java.io.BufferedWriter(new java.io.FileWriter(outputFilename)))`;
3. Although we haven't used a stack previously, we will be using an `ArrayDeque` as a stack or queue for programming assignment 3 (or 4), and have already discussed it in class
	- `java.util.ArrayDeque<String> stackOfCurrentStrings = new java.util.ArrayDeque<>();`
	- The `ArrayDeque.addLast()` can be used to add the current word of the input file to the end of the  `ArrayDeque` (the `ArrayDeque.add()` method will also add the new value to the end)
		- I used `ArrayDeque.push()`
	- The `ArrayDeque.removeLast()` can be used to retrieve and remove the last element of the `ArrayDeque` – which can be used to reverse the order of the words for the current line (`ArrayDeque.pollLast()` also retrieves and removes the last element of the `ArrayDeque`)
		- I used `ArrayDeque.pop()`
	- `ArrayDeque.size()` can be used to determine if we have processed all of the words from the current line when writing them out in reverse order
	- Since we are using the `ArrayDeque` as a stack, you can also use the `push()` and `pop()` methods for adding and removing elements from the `ArrayDeque`. These are the traditional functions for adding an element to a stack, and removing an element from a stack.
4. `String.toCharArray()` can be used to get a char array of the characters of a `String`. We can then simply loop over the elements of the char array in reverse order to reverse the current string's symbols
5. To create a StringTokenizer with a blank space delimiter, we have used 
	- `java.util.StringTokenizer st = new java.util.StringTokenizer(inn, " ");`
		- Assuming `inn` is a `String` of the current input line of text
	- And use `StringTokenizer.hasMoreTokens()` and `StringTokenizer.nextToken()` in a while loop to loop over the words of the current input line
6. We can create a new `String` `TreeSet` with
	- java.util.TreeSet<String> uniqueStrings = new java.util.TreeSet<>();
	- `TreeSet.contains()` can be used to determine if an element is contained in the `TreeSet`
	- `TreeSet.size()` can be used to determine how many elements are in a `TreeSet`
	- We can use the enhanced for loop to loop through the elements of a `TreeSet`
```java
for( String word : uniqueStrings )
{
// put code here to process the current word
}
```
7. Your program is to output:
	- The number of lines in the input file
	- The number of words in the input file
	- The number of characters in the words of the input file
	- The number of unique words in the input file
	- If the optional third command line argument starts with {“T”, “t”, “Y”, “y”}, then output the sorted list of unique words in the input file
		- You can use the enhanced for loop to do this, since the `TreeSet` maintains the elements in their natural ordering, which for Strings is alphabetical ordering
```java
for( String word : uniqueStrings )
{
// output the current word
}
```
	- Use the `DecimalFormat` that we used for lab 1 when outputting the numbers above, so that it is easier for the TA/CA to verify the values are correct
8. You are required to use
	- A `TreeSet` to create the list of unique words in the input file
	- An `ArrayDeque` as a stack to reverse the order of the words for the current input line

**Skeleton Code provided**

Skeleton code has been provided to (hopefully) make your life easier.

```java
class skeleton_lab3
{
	public static void main(String[] args)
	{
		// check the number of commandline arguments
		if( args.length < 2 )
		{
			System.out.println("format: lab3 \"input filename\" \"output filename\" \"<output unique sorted words>\"");
			System.exit(0);
		}
		
		// allocate the DecimalFormat 
		
		// define a boolean variable that specifies if the list of unique words needs to be printed to the screen
		boolean outputWords = false;
		if( args.length > 2 )
		{
			if( args[2].toLowerCase().startsWith("y") || args[2].toLowerCase().startsWith("t") )
			{
				outputWords = true;
			}
		}
		
		// declare and initialize int to keep track of the number of lines
		
		// declare and initialize int to keep track of the number of words
		
		// declare and initialize int to keep track of the number of characters
		
		// try block for all of the work
		try
		{
			// instantiate the BufferedReader for the input file (args[0] is the input filename)
			
			// instantiate the PrintWriter for the output file (args[1] is the output filename)
			
			// instantiate the TreeSet of type String for the list of unique words
			
			// instantiate the ArrayDeque of type String to use to reverse the words of a line of input
			
			// declare a String for the current line from the input file
			
			// while loop to read the input file a line at a time using BufferedReader.readLine()
			while(  )
			{
				// increment the line count
				
				// create a StringTokenizer for the current line using a blank space delimitter
				
				// while loop over the tokens of the StringTokenizer
				while(  )
				{
					// get the current token (or word)
					
					// increment the word count
					
					// increment the character count based on the length of the current token (String.length())
					
					// add the current token to the ArrayDeque using ArrayDeque.addLast() (adds to top of stack)
					
					// add the current token to the TreeSet
				}
				
				// while loop over the elements of the ArrayDeque, containing the words of the current line of input
				while(  )
				{
					// use ArrayDeque.removeLast() to get the element from the top of the stack
					
					// get a char[] of the characters of the current word using String.toCharArray()
					
					// use a for loop, to output the elements of the char[] in reverse order
					for(  )
					{
						// output the current symbol using PrintWriter.print(char)
					}
					
					// if the ArrayDeque is not empty, print a blank space after the current word to the output file
					if(  )
					{
					}
				}
				// output an end of line character to the end of the current line of output to the output file
			}
			
			// close the BufferedReader and PrintWriter
			
			// output the number of lines using the DecimalFormat
			
			// output the number of words using the DecimalFormat
			
			// output the number of characters using the DecimalFormat
			
			// output the number of unique words, size of the TreeSet, using the DecimalFormat
			
			// output the unique list of words to the screen, if requested, using an 
			// enhanced for loop over the elements of the TreeSet
			if( outputWords )
			{
			}
		}
		// catch any exceptions
		catch(Exception e)
		{
			System.out.println(e.toString());
			System.exit(0);
		}
	}
}
```

**Sample Input**
Here is a sample input file:

```
the small dogs sat in the grass
the grasshopper ate some grass
the praying mantis was just sitting there looking at the frog
the toad made a bad mistake trusting the alligator
cats dogs frogs
d2g 5k2 9op 2us n!s
```

**Sample Output**

Here is the corresponding output file:

```
ssarg eht ni tas sgod llams eht
ssarg emos eta reppohssarg eht
gorf eht ta gnikool ereht gnittis tsuj saw sitnam gniyarp eht
rotagilla eht gnitsurt ekatsim dab a edam daot eht
sgorf sgod stac
s!n su2 po9 2k5 g2d
```

Below is a sample run of my version, without outputting the sorted unique words:

```
java bailey_lab3 sample_input_1.txt sample_output_1.txt n
lines = 6
words = 40
character in words = 172
unique words = 32
```

Below is a sample run of my version outputting the sorted unique words:

```
java bailey_lab3 sample_input_1.txt sample_output_1.txt y
lines = 6
words = 40
character in words = 172
unique words = 32
ordered unique words
2us
5k2
9op
a
alligator
at
ate
bad
cats
d2g
dogs
frog
frogs
grass
grasshopper
in
just
looking
made
mantis
mistake
n!s
praying
sat
sitting
small
some
the
there
toad
trusting
was
```

**Demonstration**

To get credit, demonstrate your implementation to a TA. 
To demostrate: 
1. Execute your program with inputs `test_input_1.txt test_output_1.txt y`
2. Execute `java checklab3files test_input_1.txt test_output_1.txt` to verify that your output file is correct 
	- `checklab3files.java` will compare the two input file, reversing the symbols in the second file prior to comparing them

**Submission**

Push your code to github, then submit the commit hash on Brightspace:

```
git add -A
git commit -m "finished lab03"
git push
git rev-parse HEAD
```

