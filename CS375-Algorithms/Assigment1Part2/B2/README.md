
# B2 Overview

This project is designed to read an array of distinct integers from an input file and an integer `S`. It then finds all pairs of integers whose sum is equal to the given `S`. The program is split into multiple files:

1. **`MainB2.cpp`**: Contains the main function to read input and handle file output.
2. **`B2.cpp`**: Contains the logic to find pairs whose sum is equal to `S`.
3. **`B2.h`**: Header file that declares the function implemented in `B2.cpp`.
4. **`Makefile`**: Used to compile and run the program, as well as clean up after execution.

---

## How to Run the Program

To compile and run the program, follow these steps:

1. **Compile the program**:
   ```bash
   make
   ```
   This will compile the code into an executable named `submission`.

2. **Run the program**:
   ```bash
   make run
   ```

3. **View the output**:
   ```bash
   gedit outputFile.txt
   ```
   This will open the results from the input file.

4. **Clean up**:
   ```bash
   make clean
   ```
   This deletes `outputFile.txt` and all executable files.

---

## Algorithm Explanation

The algorithm implemented in `B2.cpp` is based on a **two-pointer technique**. 

1. First, the array is sorted in increasing order, which takes **O(n log n)**.
2. Then, two pointers are used:
   - One pointer starts from the beginning (`left`), and the other starts from the end (`right`) of the array.
   - The algorithm checks the sum of the elements at the `left` and `right` pointers:
     - **If the sum equals the given value `S`**, the pair is added to the result.
     - **If the sum is less than `S`**, move the `left` pointer to the right to increase the sum.
     - **If the sum is greater than `S`**, move the `right` pointer to the left to decrease the sum.

### Time Complexity:
- Sorting the array: **O(n log n)**
- Two-pointer traversal: **O(n)**  
Thus, the overall time complexity is:
**O(n log n) + O(n) = O(n log n)**

---

## Example

### Input:
```
1
2
3
7
8
15
22

S=10
```

### Output:
```
2 + 8 = 10
3 + 7 = 10
Running Time in Seconds: 1.3793e-05
```
