
# Normality Analysis with Reciprocal Transformation

## Problem Statement

### Part (a)
Construct a normal probability plot for the following data:

```
0.64, 0.29, -0.38, 0.49, 0.81, -0.83, 10.04, 0.79,
0.16, 0.20, -0.78, 0.19, 0.54, 1.53, 0.55, 2.26,
1.77, 0.34, 0.35, 0.35, 0.57, -0.94, 0.55, 0.31,
0.67, 0.43, 0.54, 3.39, 0.84, -2.32, 0.48, -1.03,
-1.17, -2.15, -0.27, 0.34, 0.81, -2.62, 0.36, -0.55
```

Determine whether the data appear to come from an approximately normal distribution.

### Part (b)
Transform the data by taking the reciprocal of each value and demonstrate that the reciprocals appear to come from an approximately normal distribution.

## Solution

The provided R script performs the following:
1. Creates a normal probability plot (QQ plot) for the original data.
2. Filters out zero values to ensure the reciprocal transformation is valid.
3. Creates a normal probability plot for the reciprocal-transformed data.

## Running the Code

1. Download the `normality_analysis.r` file.
2. Run the file in R or RStudio.

The script generates:
- A QQ plot for the original data.
- A QQ plot for the reciprocal-transformed data.

## Files

- `normality_analysis.r`: R script for analysis.
- `README.md`: Problem statement and instructions.

