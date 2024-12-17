
# CS320 Fall 2024: Project 2

The goal of this project is to measure the effectiveness of cache subsystem organizations using traces of memory instructions obtained from realistic programs. Each trace contains memory instructions with two values provided for each instruction: a flag indicating whether this is a load or a store (L stands for a load, S stands for a store), and the byte memory address targeted by this instruction. Three traces are provided.

## Overview
Your goal is to write a program in C or C++ that would use these traces to measure the cache hit rate of various data cache organizations and prefetching techniques (note: we are not estimating the instruction cache performance in this project, only the data cache). Specifically, the following cache designs have to be implemented.

## Cache Designs to Implement

- **Direct-Mapped Cache** [10%]  
  Assume that each cache line has a size of 32 bytes and model the caches sized at 1KB, 4KB, 16KB, and 32KB.

- **Set-Associative Cache** [20%]  
  Assume that the cache line size is 32 bytes and model a 16KB cache with associativity of 2, 4, 8, and 16. Assume that the least recently used (LRU) replacement policy is implemented.

- **Fully-Associative Cache** [20%]  
  Assume that each cache line is 32 bytes and the total cache size is 16KB. Implement Least Recently Used (LRU) and hot-cold LRU approximation policies. For the hot-cold LRU approximation policy, the initial state of all hot-cold bits should be 0 corresponding to the case where the left child is “hot” and the right child is “cold”. Furthermore, the policy should be utilized (and updated) for all accesses, including placing the initial blocks into the cache as well as replacements once the cache is full.

- **2-Level Cache System with Write-Through L1 Cache** [20%]  
  The L1 cache is configured as follows: 4-way, block size of 32 bytes, total size is 4KB. The L2 cache is configured as follows: 8-way, block size of 64 bytes, total size is 64KB. Assume that the least recently used (LRU) replacement policy is implemented. Hit rate for L1 and L2 should be counted separately.

- **2-Level Cache System with Write-Back Policy** [10%]  
  Use the same cache sizes as above.

- **Cache Utilization** [20%]  
  Compute the utilization of the L2 cache from question 5 (write-back policy in L1) for the following cases: fully-associative cache, direct-mapped cache, 8-way set-associative cache (default q5). In each case, maintain the total L2 cache size as 64KB and the line size as 64 bytes.

## Output Format

The output should have the following format:

```
x,y; x,y; x,y; x,y; #for q1
x,y; x,y; x,y; x,y; #for q2
x,y;x,y; # for q3
x,y;x,y; #for q4 first x is first level, second x is for the second level
x,y; x,y;z # x,y for q5 and z for q6 utilization 8-way set-associative L2
x,y; x,y;z # z for q6 utilization first x is first level, second x is for the second level fully associative L2
x,y; x,y;z # z for q6 utilization first x is first level, second x is for the second level direct-mapped L2
```

Where each `x,y;` pair corresponds to the number of cache hits (`x`) and the total number of accesses (`y`) of one of the cache configurations. The first line provides the results for the direct-mapped caches, second line for set-associative, the third line for the fully-associative cache with LRU replacement, the fourth line for the 2-level cache system with write-through L1 cache, the fifth for the 2-level cache system with write-back policy and `z` for the Utilization of the second level, the sixth line for fully-associative caches from question 5, and the seventh line for direct-mapped cache from question 5. The numbers within each line should be separated by a single space.

`Z` is the utilization rate of the cache (0-1, save 5 digits, like `0.88888`).

## Example: Correct Output For Running Through `extra-trace.txt`

```
508699,1000002; 698608,1000002; 804127,1000002; 831169,1000002;
825553,1000002; 831495,1000002; 833981,1000002; 835233,1000002;
835907,1000002; 831363,1000002;
749668,1000002; 305222,428280;
749668,1000002; 202004,325170; 1
749668,1000002; 202913,325170; 1
749668,1000002; 175437,325170; 1
```

## Submission Requirements
- Submit your source code so that it can be compiled and tested for correctness.
- The code should compile into a single executable called `cache_simulator` with a simple `make` command.  
  Projects that fail to compile will result in a zero grade.
  
- The executable should run all of the cache configurations on the given trace, specified via command line options:
  ```bash
  ./cache_simulator 
  ```

