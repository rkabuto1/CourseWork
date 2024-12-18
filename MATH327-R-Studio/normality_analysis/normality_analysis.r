
d <- c(0.64, 0.29, -0.38, 0.49, 0.81, -0.83, 10.04, 0.79,
       0.16, 0.20, -0.78, 0.19, 0.54, 1.53, 0.55, 2.26,
       1.77, 0.34, 0.35, 0.35, 0.57, -0.94, 0.55, 0.31,
       0.67, 0.43, 0.54, 3.39, 0.84, -2.32, 0.48, -1.03,
       -1.17, -2.15, -0.27, 0.34, 0.81, -2.62, 0.36, -0.55)
d <- d[d != 0]
qqnorm(d, main = "QQ Plot for Original Data")
qqline(d, col = "red")
r <- 1 / d
qqnorm(r, main = "QQ Plot for Reciprocal Transformed Data")
qqline(r, col = "blue")
