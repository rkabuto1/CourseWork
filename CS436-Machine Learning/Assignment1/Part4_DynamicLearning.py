#Feature Scaling + Dynamic Learning Rate (20 points: 5 points per plot)
#Repeat steps 2 & 3 but with:
#eature scaling
#Dynamic learning rate
import numpy as np
import matplotlib.pyplot as plt

def DynamicLinearRegression(a, b, Initial = 0.1, decrease = 0.01, iterations = 100):
    c = len(a)
    theta = [0.0 for _ in range(len(a[0]))]
    history = []

    for d in range(iterations):
        learning = Initial / (1 + decrease * d)
        predictions = []
        for i in range(c):
            pred = 0.0
            for j in range(len(theta)):
                pred += theta[j] * a[i][j]
            predictions.append(pred)

        errorcounter = [predictions[i] - b[i] for i in range(c)]
        miss = sum(error ** 2 for error in errorcounter) / (2 * c)
        history.append(miss)

        grad = [0.0 for _ in range(len(theta))]
        for j in range(len(theta)):
            for i in range(c):
                grad[j] += errorcounter[i] * a[i][j]
            grad[j] /= c
        for j in range(len(theta)):
            theta[j] -= learning * grad[j]
    
    return np.array(theta), history

def plot_dynamic_losses(DynTrueLoss, DynTrueMax):
    fig, axes = plt.subplots(1, 2, figsize=(12,5))
    axes[0].plot(DynTrueLoss, label = 'The Model For Min Price - Dynamic Linear Regression')
    axes[0].set_title('Min Price Loss Curve')
    axes[0].set_xlabel('Iterations')
    axes[0].set_ylabel('Our Loss Rate')
    axes[0].grid(True)
    axes[1].plot(DynTrueMax, label = 'The Model for max Price -  Dynamic Linear Regression', color='red')
    axes[1].set_title('Max Price Loss Curve')
    axes[1].set_xlabel('Iterations')
    axes[1].set_ylabel('Our Loss Rate')
    axes[1].grid(True)
    fig.tight_layout()
    plt.show()

