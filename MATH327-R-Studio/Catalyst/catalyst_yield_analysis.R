
x <- c(4.4, 3.4, 2.6, 3.8, 4.9, 4.6, 5.2, 4.7, 4.1, 2.6, 6.7, 4.1, 3.6, 2.9, 2.6, 4.0, 4.3, 3.9, 4.8, 4.5, 4.4, 3.1, 5.7, 4.5)
y <- c(3.4, 1.1, 2.9, 5.5, 6.4, 5.0, 5.8, 2.5, 3.7, 3.8, 3.1, 1.6, 3.5, 5.9, 6.7, 5.2, 6.3, 2.6, 4.3, 3.8)

par(mfrow = c(2, 2))
brk <- seq(1, 7, by = 1)
plot_hist <- function(d, brk, title, xlabel, ylabel, fill, xlim, ylim) {
  hist(d, breaks = brk, 
       main = title, 
       xlab = xlabel, 
       ylab = ylabel, 
       col = fill, 
       border = "black", 
       xlim = xlim, 
       ylim = ylim, 
       axes = FALSE)
  axis(1, at = seq(xlim[1], xlim[2], by = 1))
  axis(2, at = seq(ylim[1], ylim[2], by = 2))
  box()
}
plot_hist(x, brk, 
          title = "Catalyst A Histogram", 
          xlabel = "Yield (%)", 
          ylabel = "Frequency", 
          fill = "lightblue", 
          xlim = c(1, 7), 
          ylim = c(0, 12))
plot_hist(y, brk, 
          title = "Catalyst B Histogram", 
          xlabel = "Yield (%)", 
          ylabel = "Frequency", 
          fill = "lightgreen", 
          xlim = c(1, 7), 
          ylim = c(0, 12))
boxplot(list(A = x, B = y), 
        main = "Boxplots of Catalyst A and B", 
        xlab = "Catalyst", 
        ylab = "Yield (%)", 
        col = c("lightblue", "lightgreen"), 
        names = c("A", "B"), 
        ylim = c(0, 7))
par(mfrow = c(1, 1))
stem_plot <- function(d, label) {
  cat(sprintf("\nStem-and-leaf plot for %s:\n\n", label))
  cat("The decimal point is at the |\n\n")
  st <- floor(d)
  lv <- round((d - st) * 10)
  sl <- split(lv, st)
  for (v in 1:6) {
    if (is.null(sl[[as.character(v)]])) {
      cat(sprintf("  %d | \n", v))
    } else {
      cat(sprintf("  %d | %s\n", v, paste(sort(sl[[as.character(v)]]), collapse = "")))
    }
  }
}
stem_plot(x, "Catalyst A")
stem_plot(y, "Catalyst B")
