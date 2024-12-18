
# Estimating the Value of π Using Simulation

Estimating the value of π. The following figure suggests how to estimate the value of π with a simulation.

In the figure, a circle with area equal to π/4 is inscribed in a square whose area is equal to 1. One hundred points have been randomly chosen from within the square. The probability that a point is inside the circle is equal to the fraction of the area of the square that is taken up by the circle, which is π/4. <br>


<img width="206" alt="Screenshot 2024-12-17 at 7 32 24 PM" src="https://github.com/user-attachments/assets/35c702a0-0dd3-47f4-aa1b-40c95f744fad" />


We can therefore estimate the value of π/4 by counting the number of points inside the circle, which is 79, and dividing by the total number of points, which is 100, to obtain the estimate π/4 ≈ 0.79. From this, we conclude that π ≈ 4(0.79) = 3.16.

This exercise presents a simulation experiment that is designed to estimate the value of π by generating 1000 points in the unit square.

### Tasks:
a. Generate 1000 x coordinates \(X_1, ..., X_{1000}\) using the uniform distribution with minimum value 0 and maximum value 1.

b. Generate 1000 y coordinates \(Y_1, ..., Y_{1000}\), again using the uniform distribution with minimum value 0 and maximum value 1.  

c. Each point \((X_i, Y_i)\) is inside the circle if its distance from the center \((0.5, 0.5)\) is less than 0.5. This is determined by computing the squared distance \((X_i - 0.5)^2 + (Y_i - 0.5)^2\) and checking if it is less than 0.25.  

d. Count how many points are inside the circle and estimate π.  

**Note:** With 1000 points, the estimate may be off by as much as 0.05 or more. A simulation with 10,000 or 100,000 points is more likely to provide a closer estimate to the true value.

```
Output From My Code
```

<img width="650" alt="Screenshot 2024-12-17 at 7 28 22 PM" src="https://github.com/user-attachments/assets/61fdbbce-e59f-4862-8094-ce1e03b92fc7" />

<img width="650" alt="Screenshot 2024-12-17 at 7 28 28 PM" src="https://github.com/user-attachments/assets/7b94d778-8ef8-4ae2-a7af-d0715960b07c" />


<img width="650" alt="Screenshot 2024-12-17 at 7 28 32 PM" src="https://github.com/user-attachments/assets/81b20fd9-5596-4273-8501-13ca83da9b48" />

