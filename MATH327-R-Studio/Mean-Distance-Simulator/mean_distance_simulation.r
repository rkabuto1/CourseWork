
n <- 1000
set.seed(123)
points <- matrix(runif(n * 4, 0, 1), ncol = 4)
d <- sqrt((points[, 3] - points[, 1])^2 + (points[, 4] - points[, 2])^2)
m <- sum(d) / n
t <- 0.521405
diff <- ifelse(m > t, m - t, t - m)
p <- sum(sapply(d, function(x) x > 1)) / n
par(mfrow = c(2, 2))
hist(d, breaks = 30, main = "Histogram of Path Lengths", xlab = "Path Length", col = "pink", border = "purple")
abline(v = t, col = "orange", lwd = 2, lty = 2)
boxplot(d, main = "Boxplot of Path Lengths", ylab = "Path Length", col = "yellow")
plot(points[, 1], points[, 2], main = "Scatter Plot of Points", xlab = "X1", ylab = "Y1", pch = 16, col = "red")
plot(ecdf(d), main = "Empirical CDF of Path Lengths", xlab = "Path Length", ylab = "ECDF", col = "cyan")
par(mfrow = c(1, 1))
cat("-------------------\n")
cat("Sample mean path length:", m, "\n")
cat("True mean path length:", t, "\n")
cat("Difference:", diff, "\n")
cat("Probability of path > 1:", p, "\n")
