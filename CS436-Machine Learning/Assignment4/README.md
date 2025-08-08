# Assignment IV

**CS 436/536**
**Due: 07/31 23:59**

## Description

(Please carefully follow the directions.)

---

## Part 1: K-Means Clustering from Scratch

**\[35 Points]**

1. Generate consistent 2D synthetic data using `make_blobs` from `sklearn.datasets`.
   **\[5 Points]**

   * Set a random seed to ensure reproducibility (e.g., `random_state=42`)
   * Generate at least 3 distinct clusters of data points

2. Implement the K-Means clustering algorithm from scratch
   **(do not use `sklearn.cluster.KMeans`)**
   **\[20 Points]**

   * Initialize cluster centroids randomly from the data points
   * Use the Euclidean distance to assign points to the nearest cluster
   * Update centroids until convergence or set a maximum number of iterations

3. Visualize the final clusters using `matplotlib.pyplot.scatter`, using different colors for different clusters
   **\[5 Points]**

   * Display the final centroid positions using a unique marker to ensure they stand out from the data points

4. Report the following
   **\[5 Points]**

   * Number of iterations until convergence
   * Brief summary of how your implementation works

---

## Part 2: K-Nearest Neighbors (KNN) from Scratch

**\[30 Points]**

1. Use the same dataset generated in Part 1
   **\[5 Points]**

   * Assign class labels based on cluster membership
   * Split your dataset into train/test sets (e.g., 80% train, 20% test)

2. Implement the KNN algorithm from scratch
   **(do not use `sklearn.neighbors.KNeighborsClassifier`)**
   **\[15 Points]**

   * Use Euclidean distance to compute the nearest neighbors
   * Implement prediction by majority voting over k nearest neighbors
   * Test your implementation with at least 3 different values of k (e.g., 1, 3, 5)

3. Report the following
   **\[10 Points]**

   * Accuracy for each k
   * Short explanation of which k gave the best result and analysis

---

## Part 3: Principal Component Analysis (PCA) Exercise

**\[35 Points]**

### Preprocessing and Setup

**\[10 Points]**

* Use the original 2D dataset below
* Center the dataset by subtracting the mean of each feature
* Report the centered dataset

### Implement PCA from scratch

**(do not use `sklearn.decomposition.PCA`)**
**Use only NumPy for basic operations** (`np.mean`, `np.cov`, `@`, `np.dot`, `np.linalg.eig`)
**\[20 Points]**

* Compute the 2×2 covariance matrix of the centered dataset
  **\[5 Points]**
* Perform eigen decomposition of the covariance matrix using `numpy.linalg.eig`
  **\[5 Points]**
* Identify the first principal component (eigenvector corresponding to the largest eigenvalue)
  **\[5 Points]**
* Project the centered data onto the first principal component to reduce it to 1D
  **\[5 Points]**

  * Report the resulting 1D values

### Visualize

**\[5 Points]**

* Plot the original 2D data using `matplotlib.pyplot.scatter`
* Highlight the principal component direction using an arrow or line

---

## Submission

* 5% deduction for every late day and maximum of 6 late days are allowed
* Please submit a single PDF file that includes:

  * All your Python code (clearly commented, addressing all the requirements in the Description section)
  * All reports and generated plots/visualizations
* Code should be computer readable. NO SCREENSHOTS
