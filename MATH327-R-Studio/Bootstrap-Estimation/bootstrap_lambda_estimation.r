
data <- c(2.74, 6.41, 4.96, 1.65, 6.38, 0.19, 0.52, 8.38)
n <- length(data)
x_mean <- mean(data)
l <- 1 / x_mean
cat("λ̂ (Lambda Hat):", l, "\n")
set.seed(123)
b <- 1000
bs_means <- numeric(b)
for (i in 1:b) {
  sample <- rexp(n, rate = l)
  bs_means[i] <- mean(sample)
}
l_star <- 1 / bs_means
l_star_mean <- mean(l_star)
l_star_sd <- sd(l_star)
cat("Sample Mean of λ̂*:", l_star_mean, "\n")
cat("Sample Standard Deviation of λ̂* (σλ̂):", l_star_sd, "\n")
bias <- l_star_mean - l
cat("Bias in λ̂:", bias, "\n")
cat("Uncertainty (σλ̂):", l_star_sd, "\n")
par(mfrow = c(1, 2))
hist(l_star, breaks = 30, main = "Histogram of Lambda Hat", 
     xlab = "Estimates of Lambda Hat", col = "lightcoral", border = "darkblue")
abline(v = l, col = "darkgreen", lwd = 2, lty = 2)
abline(v = l_star_mean, col = "orange", lwd = 2, lty = 2)
plot(density(l_star), main = "Density of Lambda Hat", 
     xlab = "Estimates of Lambda Hat", ylab = "Density", col = "purple", lwd = 2)
abline(v = l, col = "darkred", lwd = 2, lty = 2)
abline(v = l_star_mean, col = "blue", lwd = 2, lty = 2)
