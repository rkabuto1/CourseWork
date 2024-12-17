n <- 100000
r1 <- matrix(sample(1:6, 4 * n, replace = TRUE), nrow = n)
p1 <- mean(rowSums(r1 == 6) > 0)
p_no6 <- (5/6)^4
t1 <- 1 - p_no6
r2 <- matrix(sample(1:36, 24 * n, replace = TRUE), nrow = n)
p2 <- mean(rowSums(r2 == 36) > 0)
p_no36 <- (35/36)^24
t2 <- 1 - p_no36
cat("Single die: Simulated =", p1, ", Theoretical =", t1, "\n")
cat("Pair of dice: Simulated =", p2, ", Theoretical =", t2, "\n")
if (t1 > t2) {
  cat("\nAt least one six in 4 throws of a single die has a higher probability.\n")
} else {
  cat("\nAt least one double six in 24 throws of a pair of dice has a higher probability.\n")
}