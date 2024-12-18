
set.seed(123)
a <- runif(1000, 0, 1)
b <- runif(1000, 0, 1)
d <- sqrt((a - 0.5)^2 + (b - 0.5)^2)
e <- d < 0.5
f <- sum(e)
g <- f / 1000
h <- 4 * g
cat("Points in circle:", f, "\n")
cat("Fraction in circle:", g, "\n")
cat("Estimated π:", h, "\n\n")
cat("Mean distance:", mean(d), "\n")
cat("Max distance:", max(d), "\n")
cat("Min distance:", min(d), "\n")
plot(a, b, col = ifelse(e, "orange", "darkgreen"), main = "Points (Circle in Orange)", xlab = "X", ylab = "Y", pch = 16, cex = 0.6)
symbols(0.5, 0.5, circles = 0.5, inches = FALSE, add = TRUE, lwd = 2)
hist(a, breaks = 20, main = "X Histogram", xlab = "X", col = "gold", border = "darkblue")
hist(b, breaks = 20, main = "Y Histogram", xlab = "Y", col = "pink", border = "brown")
plot(seq_along(a), a, pch = 16, cex = 0.6, main = "X Scatterplot", xlab = "Index", ylab = "X", col = "cyan")
plot(seq_along(b), b, pch = 16, cex = 0.6, main = "Y Scatterplot", xlab = "Index", ylab = "Y", col = "magenta")
hist(d, breaks = 20, main = "Radius Histogram", xlab = "Radius", col = "lightyellow", border = "darkred")
abline(v = 0.5, col = "darkorange", lwd = 2, lty = 2)
