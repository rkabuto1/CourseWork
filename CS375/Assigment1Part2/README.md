# Algorithmic Solutions: B1 and B2

This repository contains two distinct solutions, **B1** and **B2**, each addressing specific computational problems with their respective algorithms. Below is an explanation of each function, its purpose, approach, and practical use case in the real world. 

## B1: Key Difference Finder

### Purpose
The **B1Func** algorithm determines if there exists an element in an array that equals the difference of two other elements. If such keys exist, it prints all valid cases and their respective differences. The runtime complexity is **O(n²)** due to the nested loop approach with constant-time lookups in a hash set.

Through the assignment instructions, we were asked to implement this using the **Brute Force Approach**. However, **if we wanted to optimize this to O(n log n) time**, we would sort the array and then for each key in the sorted array, use a **two-pointer technique** or **binary search** to efficiently check if there exist two other keys whose difference equals the target key. This eliminates redundant comparisons and reduces the overall runtime.


### Approach
1. **Sorting**: The array is sorted in **O(n log n)** to facilitate efficient traversal.
2. **Hash Set**: An unordered set is used for O(1) lookups of potential differences.
3. **Nested Loops**: Every pair of numbers is iterated in **O(n²)** to compute their difference and check its existence in the set.

### Problem Solved
This algorithm finds whether an element in a dataset can be expressed as the difference of two other elements. 

### Real-World Example
In financial data analysis, this could identify if a specific transaction value can be derived from the difference of two other transactions in a dataset, helping to validate data consistency.

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
## B2: Pair Sum Finder

### Purpose
The **B2Func** algorithm identifies all pairs of integers in an array that sum to a specified target value (`S`). It outputs all such pairs or indicates if none exist. The runtime complexity is **O(n log n)**, achieved through sorting and a two-pointer traversal.

### Approach
1. **Sorting**: The array is sorted in **O(n log n)**.
2. **Two-Pointer Technique**: Two indices traverse the array from opposite ends in **O(n)**, adjusting their positions based on the sum of the elements they point to.

### Problem Solved
This algorithm efficiently finds pairs that match a target sum, avoiding redundant comparisons in large datasets.

### Real-World Example
In inventory management, this can identify item pairs whose combined price matches a specified budget, optimizing resource allocation or purchase suggestions.
