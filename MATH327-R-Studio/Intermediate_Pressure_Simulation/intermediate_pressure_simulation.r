
n <- 1000
params <- matrix(c(8.5, 0.2, 21.2, 0.3), ncol = 2, byrow = TRUE)
sim_data <- apply(params, 1, function(row) rnorm(n, mean = row[1], sd = row[2]))
p <- sqrt(sim_data[, 1] * sim_data[, 2])
pm <- mean(p)
psd <- sd(p)
a <- 0.05
z <- qnorm(1 - a / 2)
ci <- c(pm - z * psd, pm + z * psd)
cat("\n95% Confidence Interval for Intermediate Pressure (P):\n")
cat("[", round(ci[1], 4), ",", round(ci[2], 4), "]\n")
cat("\nEstimated standard deviation of P:", round(psd, 4), "\n")
par(mfrow = c(2, 2))
hist(sim_data[, 1], breaks = 30, main = "Histogram of X", 
     xlab = "X", col = "skyblue", border = "black")
hist(sim_data[, 2], breaks = 30, main = "Histogram of Y", 
     xlab = "Y", col = "lightcoral", border = "black")
hist(p, breaks = 30, main = "Histogram of P", 
     xlab = "P", col = "lightgoldenrod", border = "black")
abline(v = ci, col = "darkgreen", lwd = 2, lty = 2)
text(mean(ci), max(table(cut(p, 30))) * 0.9, 
     labels = "95% CI", col = "darkgreen", cex = 0.8)

qqnorm(p, main = "Normal Probability Plot of P")
qqline(p, col = "darkblue", lwd = 2)
par(mfrow = c(1, 1))
plot(density(p), main = "Density Plot of P", 
     xlab = "P", ylab = "Density", col = "purple", lwd = 2)
curve(dnorm(x, mean = pm, sd = psd), 
      add = TRUE, col = "darkorange", lwd = 2, lty = 2)
legend("topright", legend = c("Simulated P", "Normal Curve"),
       col = c("purple", "darkorange"), lty = c(1, 2), lwd = 2)
