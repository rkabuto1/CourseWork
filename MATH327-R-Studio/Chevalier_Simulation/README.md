# Chevalier De Mere Mathematical Puzzler Simulation

### Question

Using simulations to solve a mathematical puzzler from Chevalier De Mere (taken from *The Cartoon Guide to Statistics*, by Gonick and Smith): 

Which one has a higher probability? 

- Rolling at least one six in four throws of a single fair die, 
- or rolling at least one double six in 24 throws of a pair of fair dice?

### Problem Explanation

To calculate the probabilities, you need to perform a lot of experiments (or simulations) and calculate the long-term proportions of the desired outcomes. 

For example, for the first part, an experiment is to throw a single fair die 4 times. If 6 appears at least once, then the outcome of that experiment is a success. Otherwise, it is a failure. You repeat the same experiment many times, then the probability of rolling at least one six in four throws of a single fair die can be calculated as the proportion of "success experiment" from all your experiments.

For the second part, you roll a pair of fair dice 24 times. A success is achieved if you roll at least one double six.

The simulations will be compared to the theoretical probabilities.

---

### Running the Code

To simulate the outcomes and compare theoretical results, run the `chevalier_simulation.r` script in an R environment.

```
Output From My Program
```

<img width="479" alt="Screenshot 2024-12-17 at 6 36 02 PM" src="https://github.com/user-attachments/assets/cc0bc95d-5efa-4257-afb8-9ed42bc82f5f" />

