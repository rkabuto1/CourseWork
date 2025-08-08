import numpy as np
import matplotlib.pyplot as plt
from sklearn.datasets import make_blobs
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-
# Pseudo Code
# 1. Generate 2D synthetic data with 3 clusters using sklearns makeblobs
# 2. Randomly choose k unique data points from the dataset to initialize centroids
# 3. Assign each point to the closest centroid using explicit nested loops and Euclidean distance
# 4. Recalculate centroids by averaging the coordinates of the points in each cluster
# 5. Check if the centroids have converged
# 6. Repeat steps 3 to 5 until convergence or max iterations reached
# 7. After convergence, visualize the final clusters and centroids using matplotlib
# 8. Output a textual summary
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-
def RandomUniqueDataPoints(x, NumberOfClusters):
    UniqueIndicies = set()
    while len(UniqueIndicies) < NumberOfClusters:
        UniqueIndicies.add(np.random.randint(0, x.shape[0]))
    return np.array([x[i] for i in UniqueIndicies])

def AssignCentroid(x, KConvergence):
    AssignCluster = []
    i = 0
    while i < len(x):
        CurrentData = x[i]
        z = 0
        IndexNearest = -1
        Smallest = float("inf")
        while z < len(KConvergence):
            w = np.sqrt(np.sum((CurrentData - KConvergence[z]) ** 2))
            if w < Smallest:
                Smallest = w
                IndexNearest = z
            z += 1
        AssignCluster.append(IndexNearest)
        i += 1
    return np.array(AssignCluster)

def CalculateCentroids(x, AssignCluster, NumberOfClusters):
    CurrentIteration = []
    for i in range(NumberOfClusters):
        ClusterPoints = [x[j] for j in range(len(x)) if AssignCluster[j] == i]
        if ClusterPoints:
            ArrayClusters = np.array(ClusterPoints)
            MeanOfClusterPoints = np.sum(ArrayClusters, axis=0) / len(ArrayClusters)
        else:
            MeanOfClusterPoints = np.zeros(x.shape[1])
        CurrentIteration.append(MeanOfClusterPoints)
    return np.array(CurrentIteration)

def CentroidsMovement(KConvergence, CurrentIteration, tol=1e-4):
    i = 0
    Ok = True
    while i < len(KConvergence):
        w = np.sqrt(np.sum((KConvergence[i] - CurrentIteration[i]) ** 2))
        if w >= tol:
            Ok = False
            break
        i += 1
    return Ok

def KMeansClustering(x, NumberOfClusters, max_iters=100):
    KConvergence = RandomUniqueDataPoints(x, NumberOfClusters)
    for Iteration in range(max_iters):
        AssignCluster = AssignCentroid(x, KConvergence)
        CurrentIteration = CalculateCentroids(x, AssignCluster, NumberOfClusters)
        if CentroidsMovement(KConvergence, CurrentIteration):
            break
        KConvergence = CurrentIteration
    return KConvergence, AssignCluster, Iteration + 1

def VisualizeCluster(x, NumberOfClusters):
    np.random.seed(42)
    KmeansResult = KMeansClustering(x, NumberOfClusters)
    UnpackedItems = []
    for ElementForResult in KmeansResult:
        UnpackedItems.append(ElementForResult)
    return UnpackedItems[0], UnpackedItems[1], UnpackedItems[2]

def Graph(x, FinalLabels, KConvergence, Title="Clustering For KMeans", TypeOfFile="Part1_Graph.png"):
    Fig, Axis = plt.subplots(figsize=(8, 6))
    NumberOfClusters = len(np.unique(FinalLabels))
    for i in range(NumberOfClusters):
        ClusterPoints = x[FinalLabels == i]
        Axis.scatter(ClusterPoints[:, 0], ClusterPoints[:, 1], label=f'Cluster {i}')
    Axis.scatter(KConvergence[:, 0], KConvergence[:, 1],
                 marker='X', s=200, c='magenta', edgecolor='white', label='Centroids')
    Axis.set_title(Title)
    Axis.set_xlabel("Feature 1")
    Axis.set_ylabel("Feature 2")
    Axis.legend()
    Axis.grid(True)
    Fig.tight_layout()
    Fig.savefig(TypeOfFile)
    plt.show()

def PrintIterations(TotalIterations):
    print(f"These are the Number Of Iterations it took until convergence: {TotalIterations}\n")
    print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
    print("I Initialized k to 3 & set the centroids using random integer indexing.")
    print("Next, I assigned each point to nearest centroid")
    print("Next, I recalculated the centroids using explicit list filtering and summing.")
    print("Finally, I Checked for convergence by manually computing centroid distance changes.")

if __name__ == "__main__":
    x, TrueClusters = make_blobs(n_samples=300, centers=3, n_features=2, random_state=42)
    NumberOfClusters = 3
    KConvergence, FinalLabels, TotalIterations = VisualizeCluster(x, NumberOfClusters)
    Graph(x, FinalLabels, KConvergence)
    PrintIterations(TotalIterations)
