f <- function(x) {
  ifelse(x > 0 & x <= 0.04, 625 * x,
         ifelse(x > 0.04 & x <= 0.08, 50 - 625 * x, 0))
}
dx1 <- 0.02 / 10000
x1 <- seq(0, 0.02, by = dx1)
p1 <- sum(f(x1) * dx1)
dx2 <- 0.08 / 100000
x2 <- seq(0, 0.08, by = dx2)
m <- sum((x2 * f(x2)) * dx2)
v <- sum(((x2^2) * f(x2)) * dx2) - m^2
s <- sqrt(v)
dx3 <- (0.063 - 0.015) / 10000
x3 <- seq(0.015, 0.063, by = dx3)
p2 <- sum(f(x3) * dx3)
cat("Part (a): Clearance Probability is ", formatC(p1, digits = 15, format = "f"), "\n")
cat("Part (b): Mean =", formatC(m, digits = 15, format = "f"), "\n")
cat("Part (c): Standard deviation =", formatC(s, digits = 15, format = "f"), "\n")
cat("Part (d): Probability P(0.015<X<0.063mm) =", formatC(p2, digits = 15, format = "f"), "\n")