------------------------------
Lab 13 - Due 4/25, at 11:59 pm
------------------------------

## Description

- This lab will dealing mainly with `Streams`, which we discussed last class.
- We are also going to create a ***JUnit test case*** for a small program that does some `Stream` stuff

### Lab13 Class

Create a new class in the `src` directory, called `lab13.java`

The class `lab13` needs the following methods

1. `public void readData(String filename)`
- This method reads the input `filename` and stores the values in an `ArrayList<Integer>`
- We're going to use the `ArrayList`'s `stream()` method to create a `Stream` that we can then do stuff with.
- **Note:** You'll need an `ArrayList<Integer>` field that is accessible to your class methods.

2. `public long getTotalCount()`
- Create and use a `Stream` to return the ***number of values*** in the `ArrayList<Integer>` you are storing as a field.

3. `public long getEvenCount()`
- Create and use a `Stream` to return the ***number of odd values*** in the `ArrayList<Integer>` you are storing as a field.


4. `public long getOddCount()`
- Create and use a `Stream` to return the ***number of odd values*** in the `ArrayList<Integer>` you are storing as a field.

5. `public long getDistinctGreaterThanFiveCount()`
- Create and use a `Stream` to return the ***number of distinct values greater than 5*** in the `ArrayListList<Integer>` you are storing as a field.

6. `public Integer[] getResult1()`
- Create and use a `Stream` to return the ***even values, greater than 5 and less than 50, in sorted order*** in the `ArrayList<Integer>` you are storing as a field, ***as an `Integer[]`***.

7. `public Integer[] getResult2()`
- Create and use a `Stream` to return the ***first 50 of the values in the `ArrayList<Integer>`, after squaring each of the values, and multiplying by 3***, returned ***as an `Integer[]`***.

8. `public Integer[] getResult3()`
- Create and use a `Stream` to:
	- ***filter*** out the even values (ie keep the odd values),
	- multiply the remaining values by `2`
	- ***sort*** the values
	- ***skip*** over the first `20` elements, 
	- ***remove duplicate values*** from the ArrayList, 
	- and return the values as an ***`Integer[]`***

## Expected Code Length

- Other than the `readData()` method, each of my methods has just one line of code
	- **Note:** You could also separate each `Stream` method being called on a new line, as we show cased in the lecture notes.
- My entire `lab13` class has `60 lines`, which includes blanks lines and curly braces on separate lines as well.
- The class itself for `lab13` should not be very large.

## A Few Notes

- For `getResult1()` and `getResult2()`, the order of the operations should not matter
	- Even and greater than 5 and less than 50 and sorted should be the same returned array of values, without regard to the order (of the operations)
	- The first 50 squared and multiplied by 3 should be the same, whether we do the multiplication before or after getting the first 50

- For `getResult3()`, the order will matter
	- Get rid of even values
	- Multiply by 2
	- Sort
	- Get rid of the first 20 elements
	- Get rid of duplicates
		- If we swap the first two, then the returned array will be empty
		- If we sort after getting rid of the first 20 elements, the returned array could be different
		- If we get rid of the duplicates prior to getting rid of the first first 20 elements, that can result in a different returned array

## Test Code

- Add a JUnit test for your `lab13` class, called `lab13Test.java`, in the `test` directory
- **Note:** Below, the filenames are assumed to be in the `data` directory, which resides at the same directory level as the `src` and `test` directories in this repository.

### Initial Test Setup

- Have eclipse create a `setUp()` method and a test method for each of your methods, except for the `readData()` method (***total of seven tests***)
- Each of my test methods in the JUnit test class has one line
- For the JUnit test class we need the following six fields:

``` java
lab13 	  lab;              //The lab13 class we are testing.
Integer[] expectedResult1;  //Expected results that we will read from a text file
Integer[] expectedResult2;  //Exepcted results that we will read from a text file
Integer[] expectedResult3;  //Expected results that we will read from a text file

String inputFilename = "../data/lab_input_data.txt"; //Input filename for the raw data
String expectedResultsFilename = "../data/lab_13_expected_results.txt"; //Filename which holds expected results.

```

### Expected Testing results

The expected results for
- `getTotalCount()` is `1000`
- `getOddCount()` is `507`
- `getEvenCount()` is `493`
- `getDistinctGreaterThanFiveCount()` is `94`
- **Note:** For the other three tests, you will need to:
	- Take the `Integer[]` that you populated at the end of the `setUp()` method 
	- Compare it to the results of the corresponding `getResultX()` method
	- Use the `assertArrayEquals()` method to compare the expected and actual `Integer[]`


### Skeleton code for setUp() method

Here I provide the majority of the `setUp()` method for the Junit Test

``` java
@BeforeEach
public void setUp() throws Exception 
{
	// instantiate an instance of lab13
	lab = new lab13();
	
	// read the input value and populate the ArrayList<Integer> in the lab13 class
	lab.readData(inputFilename);
	
	// testData.get(0) should have the expected results for getResult1()
	// testData.get(1) should have the expected results for getResult2()
	// testData.get(2) should have the expected results for getResult3()
	ArrayList<ArrayList<Integer>> testData = new ArrayList<>();
	for( int i = 0; i < 3; i++ )
	{
		testData.add(new ArrayList<Integer>());
	}
	
	try
	{
		System.out.println("reading " + expectedResultsFilename);
		java.io.BufferedReader input = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(expectedResultsFilename)));
		for( int i = 0; i < testData.size(); i++ )
		{
			ArrayList<Integer> currentTestData = testData.get(i); 
			String inn;
			input.readLine();
			while( (inn = input.readLine()) != null )
			{
				if( inn.length() > 0 )
				{
					currentTestData.add(Integer.valueOf(inn));
				}
				else
				{
					break;
				}
			}
			testData.set(i, currentTestData);
			System.out.println("testData.get(" + i + ").size() = " + testData.get(i).size());
		}
		input.close();
		
		// TODO - put code here to populate expectedResult1 with the values in testData.get(0)
		// so that you can use "assertArrayEquals" to verify expectedResult1 and lab.getResult1() are the same
		expectedResult1 = new Integer[testData.get(0).size()];
		
		
		// TODO - put code here to populate expectedResult2 with the values in testData.get(1)
		// so that you can use "assertArrayEquals" to verify expectedResult2 and lab.getResult2() are the same
		expectedResult2 = new Integer[testData.get(1).size()];
		
		
		// TODO - put code here to populate expectedResult3 with the values in testData.get(2)
		// so that you can use "assertArrayEquals" to verify expectedResult3 and lab.getResult3() are the same
		expectedResult3 = new Integer[testData.get(2).size()];
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		System.exit(0);
	}		
}
```

In `setUp()` we do the following:
1. Instantiate the `lab13` class
2. Call the `readData()` method
3. Read the expected results file, and put the three test result values into the `ArrayList<Integer>`
4. **TODO:** At the bottom of `setUp()` add code to populate the `Integer[]s` to
compare with return values from `getResult1()`, `getResult2()`, and `getResult3()`.

## Summary

What you need to do:
1. Clone the Git repository
2. Create the `lab13` class in the `src` directory
3. Implement the `lab13` methods
4. My `readData()` method
	- Opens the input file
	- Reads each line and adds the `string.trim()` value to the `ArrayList<Integer>`
	- **Note:** You should have existing code that do most of this, feel free to copy it from a prior program or lab.
5. Implement the get methods
	- If you are doing it all on one line, that is fine
	- You must use `Streams` to do this, otherwise you are doing it wrong and will not get credit.
6. Create the JUnit test, `lab13Test.java`
	- Finish the `setUp` method
	- Implement the seven tests
		- Make sure all seven JUnit tests are successful
7. Upload your code to github and submit the latest commit hash via BrightSpace


## Input Files

These reside in the `data` directory.

- `lab13_input_data.txt`
	- A list of 1000 pseudo random integers.
- `lab13_expected_results.txt`
	- The expected result for `getResult1()`, `getResult2()`, and `getResult3()`.
	- In the `setUp()` method, I provided code to get the three sets of values and store them in an `ArrayList<ArrayList<Integer>>` called `testData`.
	- **Note:** You need to copy the values into the three `Integer[]` fields in the test file, so you can use the `assertArrayEquals()` to verify what your `getResultX()` returns is correct.	

## Getting Credit

- Make sure your src code compiles
- Make sure your properly parsing the input file to populate the ArrayList that is being used in your methods involving `Streams`.
- Make sure your test code compiles
- Make sure all your tests pass, and you properly are parsing the text files for the expected results.
- Submit your code to github and submit the latest commit hash on Brightspace

```
git add -A
git commit -m "finished lab13"
git push 
git rev-parse HEAD
```
