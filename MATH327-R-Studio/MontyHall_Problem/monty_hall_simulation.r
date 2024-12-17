n <- 10000
sim <- function(s = FALSE) {
  c <- sample(1:3, 1)
  p <- sample(1:3, 1)
  if (s) {
    p != c
  } else {
    p == c
  }
}
i <- replicate(n, {
  c <- sample(1:3, 1)
  p <- sample(1:3, 1)
  p == c
})
pi <- mean(i)
ns <- replicate(n, sim(s = FALSE))
ys <- replicate(n, sim(s = TRUE))
pns <- mean(ns)
pys <- mean(ys)
ti <- 1/3
tns <- 1/3
tys <- 2/3
cat("A) Probability of the door you initially pick being correct:\n")
cat("Simulated =", pi, ", Theoretical =", ti, "\n\n")
cat("B) Should you switch? Yes, because the probability of winning increases if you switch.\n\n")
cat("C) Probability of winning if you switch:\n")
cat("Simulated =", pys, ", Theoretical =", tys, "\n")
cat("Probability of winning if you don't switch:\n")
cat("Simulated =", pns, ", Theoretical =", tns, "\n")