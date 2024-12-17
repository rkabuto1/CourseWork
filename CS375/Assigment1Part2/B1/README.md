# B1 Algorithm Overview

## Task Description
The goal of this task was to design an efficient algorithm that, given an array of `n` keys, determines whether there is a key in the array that is equal to the difference between two other keys. 

### Requirements:
1. **Primary Requirement**: The solution must have a time complexity no worse than O(n log n).
2. **Optional Requirement**: The algorithm should print out all such cases, with the condition that this version must also run no worse than O(n log n).


## File Structure

The repository consists of the following files:

1. **`MainB1.cpp`**: Contains the main function to read input and handle file output.
2. **`B1.cpp`**: Contains the logic to find distinct pairs.
3. **`B1.h`**: Header file that declares the function implemented in `B1.cpp`.
4. **`Makefile`**: Used to compile and run the program, as well as clean up after execution.

# How to Run the Program

To compile and run the program, follow these steps:

## 1. `make`  
This will compile the code into an executable named `submission`.

## 2. `make run`  
Run the Program.

## 3. `gedit outputFile.txt`  
This will open the results from the input file.

## 4. `make clean`  
Deletes `outputFile.txt` and all the executable files.

## Algorithm Explanation

### Current Implementation  
My current solution, due to time constraints, runs in **O(n²)**. The algorithm uses two nested loops to compare every pair of keys in the array, calculating their difference and checking whether that difference exists as another key in the array.

### How to Solve in O(n log n)  
The optimal solution for this problem should involve using a more efficient approach, such as **sorting the array** and utilizing a **double-pointer**. This would allow the algorithm to reduce the number of comparisons by taking advantage of the sorted order to find pairs that satisfy the condition in linear time after sorting.

## Example Input)  
1<br>
2<br>
3<br>
7<br>
8<br>
15<br>
<br>
22<br>

## Example Output)  
<br>
3 - 1 = 2<br>
3 - 2 = 1<br>
8 - 1 = 7<br>
8 - 7 = 1<br>
15 - 7 = 8<br>
15 - 8 = 7<br>
22 - 7 = 15<br>
22 - 15 = 7<br>
Running time: 0.000190946 seconds

