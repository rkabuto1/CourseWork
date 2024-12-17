# Main Bearing Clearance Probability Analysis

### Question

The main bearing clearance (in mm) in a certain type of engine is a random variable with the following probability density function:

\[
f(x) =
\begin{cases}
625x & \text{for } 0 < x \leq 0.04 \\
50 - 625x & \text{for } 0.04 < x \leq 0.08 \\
0 & \text{otherwise}
\end{cases}
\]

#### Part (a): What is the probability that the clearance is less than 0.02 mm?
#### Part (b): Find the mean clearance.
#### Part (c): Find the standard deviation of the clearances.
#### Part (d): The specification for the clearance is 0.015 to 0.063 mm. What is the probability that the specification is met?

---

### Instructions

Run the `clearance_analysis.r` script in an R environment to compute the following:

1. The probability that the clearance is less than 0.02 mm.
2. The mean clearance.
3. The standard deviation of the clearances.
4. The probability that the clearance lies between 0.015 and 0.063 mm.

---

### Results

The script calculates the probabilities, mean, and standard deviation based on numerical integration.

