
# Estimating the Value of π Using Simulation

## Question

Estimating the value of π. The following figure suggests how to estimate the value of π with a simulation.

In the figure, a circle with area equal to π/4 is inscribed in a square whose area is equal to 1. One hundred points have been randomly chosen from within the square. The probability that a point is inside the circle is equal to the fraction of the area of the square that is taken up by the circle, which is π/4. 

We can therefore estimate the value of π/4 by counting the number of points inside the circle, which is 79, and dividing by the total number of points, which is 100, to obtain the estimate π/4 ≈ 0.79. From this, we conclude that π ≈ 4(0.79) = 3.16.

This exercise presents a simulation experiment that is designed to estimate the value of π by generating 1000 points in the unit square.

### Tasks:
a. Generate 1000 x coordinates \(X_1, ..., X_{1000}\) using the uniform distribution with minimum value 0 and maximum value 1.  
b. Generate 1000 y coordinates \(Y_1, ..., Y_{1000}\), again using the uniform distribution with minimum value 0 and maximum value 1.  
c. Each point \((X_i, Y_i)\) is inside the circle if its distance from the center \((0.5, 0.5)\) is less than 0.5. This is determined by computing the squared distance \((X_i - 0.5)^2 + (Y_i - 0.5)^2\) and checking if it is less than 0.25.  
d. Count how many points are inside the circle and estimate π.  

**Note:** With 1000 points, the estimate may be off by as much as 0.05 or more. A simulation with 10,000 or 100,000 points is more likely to provide a closer estimate to the true value.

## Solution

The R script generates:
1. Random points within a unit square.
2. Calculates the number of points inside the inscribed circle.
3. Estimates the value of π based on the simulation.
4. Produces visualizations of the results.

## Running the Code

1. Download the `pi_estimation_simulation.r` file.
2. Open R or RStudio and run the script.

The script outputs:
- The number of points inside the circle.
- The estimated value of π.
- Histograms and scatter plots for analysis.

## Files

- `pi_estimation_simulation.r`: R script for estimating π using simulation.
- `README.md`: Problem statement and instructions.

