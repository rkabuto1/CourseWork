#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
# Part 3 - Plot the learning curve while your model is being trained (i.e., accuracy 
# on training data vs. number of epochs). Please feel free to use any value of weights 
# and learning rate. Report your model weights upon completion of training.
#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
# Psuedocode:
# Step 1) Read the CSV file and Iris dataset and construct Coloumns
# Step 2) Set Setosa = 0 and Set Virgincia = 1
# Step 3) Extract the petal features and add a bias as the first feature
# Step 4) Split the data into training and test sets which we did from Part2
# Step 5) Construct the functions related to our logistic regression
#       a) Construct our signmoid function
#       b) Using our weight vector, create the probabilites of prediction
#       c) Compute the classification accuracy for our predictions
# Step 6) Train our logistic regression using a gradient decscent
# Step 7) Output the final model weights and Plot our accuracy 
# Step 8) Evaluate the accuracy
#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
df = pd.read_csv('iris.data', header=None)
df.columns = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width', 'class']
df = df[df['class'].isin(['Iris-setosa', 'Iris-virginica'])]
df['target'] = df['class'].map({'Iris-setosa': 0, 'Iris-virginica': 1})

features = df[['petal_length', 'petal_width']].to_numpy()
targets = df['target'].to_numpy()
features = np.insert(features, 0, 1, axis=1)
TrainFeature, TestFeature, TrainLabel, TestLabel = train_test_split(features, targets, test_size=0.2, random_state=42)

def sigmoid(value):
    return 1 / (1 + np.exp(-value))
def predict(data, weight_vec):
    return np.array([sigmoid(np.dot(row, weight_vec)) for row in data])
def calculateAccuracy(data, labels, weight_vec):
    predicted_probs = predict(data, weight_vec)
    predictions = (predicted_probs >= 0.5).astype(int)
    return np.mean(predictions == labels)

LearningRate = 0.1
Iterations = 100
W = np.zeros(features.shape[1])
AccuracyMeasurment = []

for CurrentEpoch in range(Iterations):
    PredictProb = predict(TrainFeature, W)
    TrueLoss = []
    for i, _ in enumerate(TrainFeature[0]):
        partial = np.sum((PredictProb - TrainLabel) * TrainFeature[:, i] / len(TrainLabel))
        TrueLoss.append(partial)
    W -= LearningRate * np.array(TrueLoss)
    ComputedAccuracy = calculateAccuracy(TrainFeature, TrainLabel, W)
    AccuracyMeasurment.append(ComputedAccuracy)

print('Train Complete')
print('Final model Weights:')
for i, weight in enumerate(W):
    print(f"  w{i}: {weight:.4f}")

fig, ax = plt.subplots(figsize=(8, 6))
ax.plot(range(1, Iterations + 1), AccuracyMeasurment, label = 'Training Accuracy')
ax.set_xlabel('Epochs')
ax.set_ylabel('Accuracy')
ax.set_title('Learning Curve: Train Accuracy vs Epochs')
ax.grid(True)
fig.tight_layout()
plt.show()

TrueAccuracy = calculateAccuracy(TestFeature, TestLabel, W)
print(f"\nTest Accuracy: {TrueAccuracy * 100:.2f}%")

