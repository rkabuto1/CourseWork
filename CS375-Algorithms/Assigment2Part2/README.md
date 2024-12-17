
# Closest Pair of Points Project

## **Purpose of the Project**
This project implements algorithms to solve the **Closest Pair of Points problem** in 2D and 3D spaces. The problem involves finding the two points in a dataset that are closest to each other based on Euclidean distance. The algorithms implemented are:
1. **Brute Force**: **(O(n²)\)** runtime complexity in **Part 1 Folder**
2. **Divide and Conquer**: **\(O(n log n)\)** runtime complexity along with a comparison with Brute Force in **Part 2 Folder**

The primary goal is to compare these two approaches in terms of efficiency and demonstrate how divide-and-conquer achieves a significant improvement in runtime.

---

## **Runtime Complexity**
1. **Brute Force**:
   - Compares all possible pairs of points, resulting in **O(n²)\)** complexity due to the nested iteration over the dataset.

2. **Divide and Conquer**:
   - Recursively splits the dataset into two halves and processes each half separately.
   - Combines results by handling edge cases where the closest pair might span the dividing line using a "strip" approach.
   - Sorting the points initially by \(x\)-coordinates takes **\(O(n log n)\)**, and processing each level of recursion also contributes \(O(n)\), resulting in a total complexity of \(O(n log n)\).

---

## **Approach**
The divide-and-conquer algorithm achieves its efficiency by reducing the problem size at each recursive step:
1. Sort points by \(x\)-coordinates initially.
2. Recursively find the closest pair of points in the left and right halves.
3. Handle edge cases by processing a vertical strip around the dividing line, checking only nearby points.

The "strip" approach ensures that only relevant points are compared, minimizing unnecessary calculations and maintaining **\(O(n log n)\)** complexity.

---

## **Problem Solved**
The **Closest Pair of Points problem** has broad applications in computational geometry and optimization. It identifies the smallest distance between points in a dataset and the pair of points corresponding to this distance. This is useful for:
- Collision detection.
- Identifying nearest neighbors in large spatial datasets.

### **Real-World Example**
In **air traffic control**, determining the closest pair of aircraft helps predict potential collisions and ensures safe navigation.

