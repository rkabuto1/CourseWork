
# Simulation to Estimate the Mean Distance Between Random Points

## Question

In mobile computer networks, the movement of a computer is often modeled as a random path within a square. If the endpoints of a path are denoted \((X_1, Y_1)\) and \((X_2, Y_2)\), then the length of the path is given by:

\[
L_i = \sqrt{(X_2 - X_1)^2 + (Y_2 - Y_1)^2}
\]

The exercise aims to estimate the mean distance between two randomly chosen points in a unit square of side 1 using simulation.

### Tasks:
a. Generate 1000 sets of endpoints \((X_1^i, Y_1^i)\) and \((X_2^i, Y_2^i)\) using the uniform distribution with minimum value 0 and maximum value 1 for each coordinate.  
b. Compute the 1000 path lengths \(L_i\).  
c. Compute the sample mean path length \(\bar{L}\) and compare it to the true mean of \(0.521405\).  
d. Estimate the probability that a path length is more than 1 unit long.

## Solution

The provided R script generates:
1. 1000 random pairs of points within a unit square.
2. Calculates the path lengths between each pair.
3. Computes the mean path length and compares it to the theoretical mean.
4. Visualizes the results with:
   - Histogram of path lengths.
   - Boxplot of path lengths.
   - Scatter plot of the points.
   - Empirical CDF of path lengths.

The probability that a path length exceeds 1 is also estimated.

## Running the Code

1. Download the `mean_distance_simulation.r` file.
2. Run the script in R or RStudio.

The script outputs:
- The sample mean path length.
- The difference between the sample mean and the true mean.
- The probability that a path length exceeds 1.
- Visualizations for further analysis.

## Files

- `mean_distance_simulation.r`: R script for estimating mean distance using simulation.
- `README.md`: Problem statement and instructions.

