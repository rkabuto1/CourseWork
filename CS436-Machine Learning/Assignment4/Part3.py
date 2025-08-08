import numpy as np
import matplotlib.pyplot as plt
from sklearn.datasets import make_blobs
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-
# Pseudo Code
# 1. Generate 2D synthetic data with 3 clusters using sklearns makeblobs
# 2. Compute the mean of each feature to center the data
# 3. Subtract the mean from every data point to get a zero mean dataset
# 4. Manually compute the covariance matrix using nested loops
# 5. Extract eigenvalues and eigenvectors from the covariance matrix
# 6. Find the eigenvector associated with the largest eigenvalue 
# 7. Flip the principal component vector to match visual orientation
# 8. Project all centered points onto the first principal component to reduce to 1D
# 9. Plot
#     - Scatter of the centered dataset
#     - Red vector showing the first principal component
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-
GeneratedDataSet, ClusterLabels = make_blobs(n_samples=300, centers=3, n_features=2, random_state=42)
LengthOfX = len(GeneratedDataSet)
LengthOfFeatures = len(GeneratedDataSet[0])
ComputeMean = np.zeros(LengthOfFeatures)

for IterateFeatures in range(LengthOfFeatures):
    ComputeSums = 0
    i = 0
    while i < LengthOfX:
        ComputeSums += GeneratedDataSet[i][IterateFeatures]
        i += 1
    ComputeMean[IterateFeatures] = ComputeSums / LengthOfX

CenterDataset = []
for SingleSample in GeneratedDataSet:
    CenterRow = []
    for j in range(LengthOfFeatures):
        CenterRow.append(SingleSample[j] - ComputeMean[j])
    CenterDataset.append(CenterRow)
CenterDataset = np.array(CenterDataset)

print("First Five Rows For Centered Dataset")
print(CenterDataset[:5])

CoVarianceMatrix = np.zeros((LengthOfFeatures, LengthOfFeatures))
for i in range(LengthOfFeatures):
    j = 0
    while j < LengthOfFeatures:
        ComputeSums = 0
        for k in range(LengthOfX):
            ComputeSums += CenterDataset[k][i] * CenterDataset[k][j]
        CoVarianceMatrix[i][j] = ComputeSums / (LengthOfX - 1)
        j += 1

print("\nCovariance Matrix:")
print(CoVarianceMatrix)

EigenVal, EigenVect = np.linalg.eigh(CoVarianceMatrix)

print("\nEigenvalues:")
print(EigenVal)

print("\nEigenvectors:")
print(EigenVect)

IndexLargestEigenValue = -1
CurrentLargestEigenValue = float("-inf")
for i in range(len(EigenVal)):
    if EigenVal[i] > CurrentLargestEigenValue:
        CurrentLargestEigenValue = EigenVal[i]
        IndexLargestEigenValue = i

FirstPC = -EigenVect[:, IndexLargestEigenValue] 

OneDProjection = []
for i in range(LengthOfX):
    HoldDotResult = 0
    j = 0
    while j < LengthOfFeatures:
        HoldDotResult += CenterDataset[i][j] * FirstPC[j]
        j += 1
    OneDProjection.append(HoldDotResult)
OneDProjection = np.array(OneDProjection)

print("\nFirst Five Values of Projected Data")
print(OneDProjection[:5])

plt.figure(figsize=(8, 6))
plt.scatter(CenterDataset[:, 0], CenterDataset[:, 1], alpha=0.6, label="Centered Data")

OriginalPoint = np.array([[0, 0]])
ScaledVector = FirstPC * 10
plt.quiver(*OriginalPoint.T, *ScaledVector, color='orange', scale=1, scale_units='xy', angles='xy', width=0.01, label="First Principal Component")

plt.title("First PCA with Centered Data")
plt.xlabel("Centered Feature 1")
plt.ylabel("Centered Feature 2")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig("Part3_Graph.png")
plt.show()
