---------------
Grading PA6
---------------

Program 6 grades are now on Brightspace. 

## Resubmission

If you did not get a 100 on the program, you can submit an updated version by:
- 11:59 pm, 5/8/2023

Your final grade being the largest of:
1. the initial grade
2. the average of both grades
3. 80% of the second.

## Grading script files

The following files reside in the `grading` directory:

| File Name | Description |
| -- | -- |
| [YOUR_LAST_NAME]_checkWeightedGraph.java | The test program that grades your work |
| expected_output.txt | what should be output to standard output |
| makeAndRun.sh | bash script that was ran to kick off your grading |

## Graph test Files

Additionally, there are multiple weighted graph files provided for testing.
In total, there are 42 tests, each worth 100 / 42 pts. 

The output to standard error will be a vector of 42 values in [0.0,1.0]. A value of 0.0 means the corresponding test is 100% correct, and a value of 1.0 means the corresponding test is 100% incorrect.

There are **three tests** for each of the 14 test files (actually there are 8 test files, some are tested multiple times with different from/to vertices). The three tests are:
1. does a path exist
2. what is the cost of the path
3. and what is the path.

Here is some more info about which test graphs are used for each test

| Test Cases | Graph File Used | From Vertex -> To Vertex |
| -- | -- | -- |
| Test 1 - Test 3   | sample_weighted_graph_1a.txt | 1 -> 13 |
| Test 4 - Test 6   | sample_weighted_graph_1a.txt | 13 -> 0 |
| Test 7 - Test 9   | sample_weighted_graph_2a.txt | 0 -> 20 |
| Test 10 - Test 12 | sample_weighted_graph_2a.txt | 1 -> 20 |
| Test 13 - Test 15 | sample_weighted_graph_2a.txt | 10 -> 0 |
| Test 16 - Test 18 | sample_weighted_graph_4a.txt | 0 -> 1 |
| Test 19 - Test 21 | sample_weighted_graph_5a.txt | 0 -> 2 |
| Test 22 - Test 24 | sample_weighted_graph_7.txt | 1 -> 15 |
| Test 25 - Test 27 | sample_weighted_graph_7.txt | 1 -> 2 |
| Test 28 - Test 30 | sample_weighted_graph_7.txt | 2 -> 8 |
| Test 31 - Test 33 | sample_weighted_graph_8.txt | 1 -> 2 |
| Test 34 - Test 36 | sample_weighted_graph_8.txt | 2 -> 8 |
| Test 37 - Test 39 | sample_weighted_graph_4.txt | 0 -> 1 |
| Test 40 - Test 42 | sample_weighted_graph_5.txt | 0 -> 2 |

## Running the Grader

Within the `grading` directory, to run the test program simply run:

```
./makeAndRun.sh [YOUR_LAST_NAME]
``` 

Alternately, you can compile and run:

```
java [YOUR_LAST_NAME]_checkWeightedGraph
```

## Explanation of Testing output

For each test file, the test program will output the following (below is the output for "sample_weighted_graph_5.txt"):

1) "processing sample_weighted_graph_5.txt" - the file being tested
2) "    checking 0 -> 2" - checking for a path from 0 to 2 
3) "        hasPath = true" - if there is a path
4) "        cost = 3.0" - the weight or cost of the path
5) "        path = (0,2,3.0)" - a least cost path if one exists
6) "currentTestResults =     0    0    0" - the three results for the current test