
# Assessment of Lognormal Distribution in Topical Tretinoin Gel Data

## Question

In the article *"Assessment of Dermatopharmacokinetic Approach in the Bioequivalence Determination of Topical Tretinoin Gel Products"* (L. Pershing, J. Nelson, et al., Journal of the American Academy of Dermatology, 2003:740-751), measurements of the concentration of an anti-fungal gel, in ng per square centimeter of skin, were made one hour after application for 49 individuals. Following are the results:

```
132.44 76.73 258.46 177.46 73.01 130.62 235.63
107.54 75.95 70.37 88.76 104.00
19.07 174.30
82.87 68.73 41.47 120.44 136.52 82.46
67.04
96.92 93.26
72.92 138.15 82.43 245.41 104.68
82.53 122.59 147.12 129.82 54.83
65.82
75.24
135.52 132.21 85.63 135.79 65.98 349.71
77.84
89.19 102.94 166.11 168.76 155.20 44.35 202.51
```

The authors claim that these data are well modeled by a lognormal distribution. Construct an appropriate probability plot, and use it to determine whether the data support this claim.

## Solution

This repository contains an R script that:
1. Generates a QQ plot for the original data.
2. Applies a log transformation to the data and generates a QQ plot for the transformed data.

The purpose of the transformation is to determine whether the data can be approximated as normally distributed after taking the natural logarithm.

## Running the Code

1. Download the `lognormal_assessment.r` file.
2. Open R or RStudio and run the script.

The script will produce two QQ plots:
- A plot for the original data.
- A plot for the log-transformed data.

## Files

- `lognormal_assessment.r`: Contains the R code to generate the QQ plots.
- `README.md`: This file describing the question and solution.

