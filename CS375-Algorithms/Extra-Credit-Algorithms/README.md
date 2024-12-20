```
Josephus Algorithm
```
Design an algorithm to solve a “ball-picking” problem. 

Problem statement: there are a number of balls (n) placing in a circle, with all white except one red. Starting from any one of the balls, a robot travels along the circle in a clockwise direction, and pick a ball in every three balls (k=3 which means for every three balls, skip the first two balls, and picks the third one). The procedure is repeated with the remaining balls, starting with the next ball, the robot travels on the circle repeatedly, and pick balls in the same way until only one ball remains. In order to keep the red-ball remained at final, which ball has to be the first ball for robot to start with?  

Example:<br>

<img width="535" alt="Screenshot 2024-12-19 at 10 13 18 PM" src="https://github.com/user-attachments/assets/395e13aa-34a2-4893-b698-1737ed2603d8" />


Design your algorithm by giving an iteration/recurrence relation for the solution. Explain the time complexity and space complexity. Note that both time complexity and space complexity of your algorithm should not be more than O(n). 

Show the starting ball of the right figure (n=11, k=3) using your dynamic programming algorithm in order to have the red-ball #4 as the last ball to be remained. 

**Task) Given N balls, starting ball (P), traveling along the circle in the clockwise direction, (K-1) balls to be skipped, pick one ball for every K balls, repeat until only one ball remained.  Write a program to implement your dynamic programming algorithm, and print out which ball is remained in the case of N=100 (balls) and K=7. (Print out your running time with starting ball P=0)**

---
```
BipartiteGraphChecker
```
A bipartite graph G(V, E) is an undirected graph whose vertices can be partitioned into two disjoint sets V1 and V2 = V-V1 with the properties that no two vertices inV1 are adjacent in G and no two vertices in V2 are adjacent in G. All edges go between the two sets V1 and V2.  Is the following graph G a bipartite graph? Write your algorithm to determine whether the graph G is bipartite and the two disjoint sets V1 and V2 if it is a bipartite.  What’s the time complexity of your algorithm.
**Task - Implement your algorithm, print out set V1 and set V2, and print out the running time).**<br>

<img width="535" alt="Screenshot 2024-12-19 at 10 18 32 PM" src="https://github.com/user-attachments/assets/5c37454f-097f-4824-a33d-c4b19de84819" />

---
```
Simplex Algorithm
```

Using the Simplex Algorithm to solve the three variables linear programming problem<br>

<img width="535" alt="Screenshot 2024-12-19 at 10 20 22 PM" src="https://github.com/user-attachments/assets/3757f983-97d9-465b-862b-f2818f9357d8" /><br>

**Show the results through the pivot operations and linear program (show the table step by step). Implement the Simplex Algorithm and display the results by your program, and print out the running time.**

---
```
GraphLoopDetection
```

Design an algorithm which can automatically indicate whether or not a graph G contain a cycle.  Using the following two graphs as two examples to indicate what data structure to represent (i) and (ii), respectively.  

<img width="535" alt="Screenshot 2024-12-19 at 10 23 14 PM" src="https://github.com/user-attachments/assets/12b7543b-f5eb-4d8a-b962-1e020da524b8" />


**Task - Implement your algorithm by using an appropriate data structure, and print out a cycle if the graph a cyclic. Print out the running time.**

---

```
TopologicalSortWithEdgeClassification
```

Apply topological sort to the graph below. Show the sequence of the nodes found by your application. Include also the discovery and finishing time of each node.  (Assume the starting node is 1, the second node to go is 7.  Also node 2 will be selected before node 4.)  

<img width="535" alt="Screenshot 2024-12-19 at 10 24 38 PM" src="https://github.com/user-attachments/assets/9bc07796-2ea3-4e95-9ac1-ac592bf043f8" />

**Task - Implement the algorithm and print out the topological sorted nodes, and print out the edge type for each edge (e.g., T – tree edge; F – forward edge; B – backward edge; C – cross edge).  What’s the time complexity. Print out the running time.**

---
```
TravelingSalesman
```

**Task - Using the Best-First Search Algorithm to give a solution of the following Traveling Salesman Problem. Show the state space tree and the optimal tour and write a program to implement it.**

<img width="535" alt="Screenshot 2024-12-19 at 10 26 35 PM" src="https://github.com/user-attachments/assets/1d635083-bec6-4ffe-9bbf-3c8c510cd93c" />





