
# Simulation to Estimate the Intermediate Pressure and Its Confidence Interval

## Question

1. The pressure of air (in MPa) entering a compressor is measured to be \( X = 8.5 \pm 0.2 \),  
   and the pressure of the air leaving the compressor is measured to be \( Y = 21.2 \pm 0.3 \).  
   The intermediate pressure is therefore measured to be \( P = \sqrt{XY} = 13.42 \).  

Assume that \( X \) and \( Y \) come from normal populations and are unbiased.

### Tasks:
a. From what distributions is it appropriate to simulate values \( X^* \) and \( Y^* \)?  
b. Generate simulated samples of values \( X^* \), \( Y^* \), and \( P^* \).  
c. Use the simulated sample to estimate the standard deviation of \( P \).  
d. Construct a normal probability plot for the values \( P^* \).  
   Is it reasonable to assume that \( P \) is approximately normally distributed?  
e. If appropriate, use the normal curve to find a 95% confidence interval for the intermediate pressure.

## Solution

The R script performs the following:
1. Simulates values \( X^* \) and \( Y^* \) from their respective normal distributions.
2. Calculates \( P^* \) as \( \sqrt{X^* Y^*} \) for each simulation.
3. Estimates the mean, standard deviation, and constructs a 95% confidence interval for \( P \).
4. Produces visualizations:
   - Histograms of \( X^* \), \( Y^* \), and \( P^* \).
   - A normal probability plot for \( P^* \).
   - A density plot comparing the simulated data to a normal curve.

## Running the Code

1. Download the `intermediate_pressure_simulation.r` file.
2. Run the script in R or RStudio.

The script outputs:
- The 95% confidence interval for \( P \).
- The estimated standard deviation of \( P \).
- Visualizations for further analysis.

## Files

- `intermediate_pressure_simulation.r`: R script for simulating \( P \) and calculating results.
- `README.md`: Problem statement and instructions.
