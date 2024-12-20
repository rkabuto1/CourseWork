```
Josephs Algorithm
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


