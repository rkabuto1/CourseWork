# MATH327-R-Studio

R Studio Probability with Statistical Methods 

# Semester Long Assignment in R 

For all 10 questions, all codes, plots, results, and a summary statement must be included. Your codes must be properly documented (in R using `#` for comments). Points will be deducted from unnecessary print out of simulated values, such as printing out all simulated values. Make sure you collate all your codes, plots, and results.

## Questions

### 1. Yield of an Undesirable Side Product
Exercise from Section 1.3: Redo the yield of an undesirable side product with two different catalysts question in R (P39, Q5). In addition, construct stem-and-leaf plots for both catalysts. Is there any difference between the R-generated plots and your hand-drawn plots? Some commands you will be using are `boxplot`, `hist`, and `stem`. Type `?boxplot`, `?hist` or `?stem` in R console for details.

---

### 2. Mathematical Puzzle: Chevalier De Mere
Using simulations to solve a mathematical puzzler from *The Cartoon Guide to Statistics* (Gonick and Smith): Which one has a higher probability? Rolling at least one six in four throws of a single fair die, or rolling at least one double six in 24 throws of a pair of fair dice?  
- Use simulations and calculate the long-term proportions of the desired outcomes.
- Compare the simulated results to the theoretical results and comment.

(Use `sample` in R for random selections. Type `?sample` in R console for details).

---

### 3. The Monty Hall Problem
If you are on a game show, and you are given a chance to pick one of three doors:  
- A car is behind one of the doors, and the others are empty.  
- The host opens an empty door out of the two not picked.  

**Tasks**:  
1. What is the probability that the door you pick will be a winning door before the host reveals a door?  
2. What is the probability after the host reveals a door?  
3. Should you switch doors after the reveal? What is the probability of winning after switching?

(Use `sample` in R for simulations. Type `?sample` for details).  
Compare the simulated results to the theoretical results and comment.

---

### 4. Main Bearing Clearance
Exercise from Section 2.4: The main bearing clearance (in mm) in a certain type of engine (Page 115, Q20: a, b, c, and f only).  
- Use simulations (or Riemann sums for integration) to calculate results.  
- Compare simulated results to integration and comment.

---

### 5. Anti-Fungal Gel Measurements
Exercise from Section 4.10 (P. 290, Q8): Produce the necessary plots and provide a summary conclusion.  
(Use `qqnorm` in R for probability plot. Type `?qqnorm` for details).

---

### 6. Measurement Data Set Analysis
Exercise from Section 4.10 (P. 290, Q10): Produce the necessary plots and provide a summary conclusion.  
(Use `qqnorm` function in R for plotting).

---

### 7. Estimation of π
Exercise from Section 4.12 (P. 316, Q6): Estimate the value of π.  
- Use necessary plots (histograms, scatterplots) to verify the simulations.  
- Summarize the results.  
(Use `runif` in R for generating random numbers from standard uniform distribution. Type `?runif` for details).

---

### 8. Application to Mobile Computer Networks
Exercise from Section 4.12 (P. 317, Q7): Estimate the mean path distance in a unit square.  
- Produce necessary plots and summarize conclusions.  
(Use `runif` in R for generating random numbers from uniform distribution).

---

### 9. Estimation of λ
Exercise from Section 4.12 (P. 318, Q13: b, c, d, e):  
- Use simulations to estimate λ.  
- Visualize results with plots.  
- Compare results to bias and uncertainty derived.  
(Use `rexp` in R for generating numbers from exponential distribution. Type `?rexp` for details).

---

### 10. Pressure of Air in a Compressor
Exercise from Section 5.9 (P. 397, Q1): Simulate and analyze the pressure of air (MPa) entering and leaving a compressor.  
- Produce necessary plots to verify the simulation and support results.  
(Use `rnorm` in R to generate random numbers from Normal distribution. Type `?rnorm` for details).

---

