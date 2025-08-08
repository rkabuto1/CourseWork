import numpy as np
import matplotlib.pyplot as plt

FordYears = np.array([
    1992,1993,1994,1995,1996,1997,1998,1999,2000,
    2001,2002,2003,2004,2005,2006,2007,2008,2009,
    2010,2011,2019,2020,2021,2022,2023,2024,2025
])

Lowestprice = np.array([
    8730,8781,9449,10224,10575,11070,11485,11845,11580,
    11960,12565,13645,14575,14610,14450,13970,14490,16395,
    17820,18160,24000,24110,24820,25980,27400,32820,33330
])

Highestprice = np.array([
    14840,16535,18328,19571,20295,20325,19695,19435,19785,
    24335,25010,25450,26015,26795,26670,24425,24350,25805,
    25800,26070,38565,38675,39035,39730,40945,55720,56070
])

def LinearRegression(a, b, learning=0.01, iterations = 100):
    c = len(a)
    theta = [0.0 for _ in range(len(a[0]))]
    history = []
    d = 0
    while d < iterations:
        predictions = []
        for i in range(c): 
            pred = 0.0
            for j in range(len(theta)):
                pred += theta[j] * a[i][j]
            predictions.append(pred)
        errorcounter = [predictions[i] - b[i] for i in range(c)]
        miss = sum(error ** 2 for error in errorcounter) / (2*c)
        history.append(miss)
        #-------------------------------------------------------
        #Train 2 separate linear regression models:
        #One for minimum price
        #One for maximum price
        #-------------------------------------------------------
        grad = [0.0 for _ in range(len(theta))]
        for j in range(len(theta)):
            for i in range(c):
                grad[j] += errorcounter[i] * a[i][j]
            grad[j] /= c
        for j in range(len(theta)):
            theta[j] -= learning * grad[j]
        d += 1
    return np.array(theta), history
    #End of Linear Regression Function

#Plot Loss Curves over 100 iterations
#Our Function To Graph Our Results
def plot_losses(TrueLoss, TrueMax):
    fig, axes = plt.subplots(1, 2, figsize=(12,5))
    axes[0].plot(TrueLoss, label = 'The Model For Min Price')
    axes[0].set_title('Min Price Loss Curve')
    axes[0].set_xlabel('Iterations')
    axes[0].set_ylabel('Our Loss Rate')
    axes[0].grid(True)
    axes[1].plot(TrueMax, label = 'The Model for max Price', color='red')
    axes[1].set_title('Max Price Loss Curve')
    axes[1].set_xlabel('Iterations')
    axes[1].set_ylabel('Our Loss Rate')
    axes[1].grid(True)
    fig.tight_layout()
    plt.show()






