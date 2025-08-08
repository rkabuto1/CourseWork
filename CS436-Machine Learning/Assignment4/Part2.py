import numpy as np
import random
from sklearn.datasets import make_blobs
from collections import defaultdict
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-
# Pseudo Code
# 1. Generate 2D synthetic data with 3 clusters using sklearns makeblobs
# 2. Convert feature and label arrays into a zipped list of tuples
# 3. Shuffle the zipped data using a seeded random number generator for reproducibility
# 4. Split the data into 80% training and 20% testing manually by slicing the shuffled list
# 5. Separate the training and testing sets into individual feature and label lists
# 6. Define a custom Euclidean distance function using a while loop and manual sum
# 7. Implement a manual KNN predictor
#     - Calculate distance between test point and each training point
#     - Pair each distance with its label
#     - Sort the list of pairs
#     - Tally the top k labels using a defaultdict
#     - Return the label with the highest count
# 8. Create a function to evaluate prediction accuracy
#     - Iterate through each test point using a while loop
#     - Predict label using the KNN function
#     - Compare it to the true label and update counters
#     - Return the final accuracy as correct / total
# 9. Loop over multiple values of k & store and print the results
# 10. Find the best performing k value based on highest accuracy and print a brief analysis
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-
RandomNumber = np.random.default_rng(42)
FeatureVectorsX, LabelsY = make_blobs(n_samples=300, centers=3, n_features=2, random_state=42)
ZippedList = list(zip(FeatureVectorsX.tolist(), LabelsY.tolist()))
RandomNumber.shuffle(ZippedList)
EightyTwentySplit = int(len(ZippedList) * 0.8)
TrainData = ZippedList[:EightyTwentySplit]
TestData = ZippedList[EightyTwentySplit:]
XFeatureVectorsList = [x for x, _ in TrainData]
YLabelList = [y for _, y in TrainData]
XTestedData = [x for x, _ in TestData]
YTestedData = [y for _, y in TestData]

def EucDistance(p1, p2):
    TotalTestSamples = 0
    x = 0
    while True:
        if x >= len(p1):
            break
        DimensionalDifference = p1[x] - p2[x]
        TotalTestSamples += DimensionalDifference * DimensionalDifference
        x += 1
    return TotalTestSamples ** 0.5

def Predictor(XFeatureVectorsList, YLabelList, x_test, k):
    ListTrainingPoints = []
    for x in range(len(XFeatureVectorsList)):
        y = EucDistance(x_test, XFeatureVectorsList[x])
        ListTrainingPoints.append((y, YLabelList[x]))
    
    PairsSorted = sorted(ListTrainingPoints, key=lambda x: x[0])
    
    CountLabelOccurences = defaultdict(int)
    for x in range(k):
        CountLabelOccurences[PairsSorted[x][1]] += 1

    MaximumSeen = -1
    TrueLabel = None
    for label, count in CountLabelOccurences.items():
        if count > MaximumSeen:
            MaximumSeen = count
            TrueLabel = label
    return TrueLabel

def ComputeAccuracy(XFeatureVectorsList, YLabelList, XTestedData, YTestedData, k):
    TotalTestSamples = 0
    Correct = 0
    x = 0
    while x < len(XTestedData):
        pred = Predictor(XFeatureVectorsList, YLabelList, XTestedData[x], k)
        match = pred == YTestedData[x]
        Correct += int(match)
        TotalTestSamples += 1
        x += 1
    return Correct / TotalTestSamples

ListOfKValues = [1, 3, 5]
AccuracyReults = {}

print("-=-=-Accuracy Outputs For KNN Part2-=-=- \n")
for k in ListOfKValues:
    Accuracy = ComputeAccuracy(XFeatureVectorsList, YLabelList, XTestedData, YTestedData, k)
    AccuracyReults[k] = Accuracy
    print(f"K was set to {k}: Accuracy came out to be = {Accuracy:.4f}")

BestPeformingK = None
HighestAccuracyValue = -1
for k, Accuracy in AccuracyReults.items():
    if Accuracy > HighestAccuracyValue:
        HighestAccuracyValue = Accuracy
        BestPeformingK = k
        
print(f"\nThe best peforming K was ->  {BestPeformingK}")
print("-=-=-=-=--=-=-==-=-=-=-=-=-=-==-=-=-")
print(f"-The best accuracy was k={BestPeformingK} ({AccuracyReults[BestPeformingK]:.4f}).")
