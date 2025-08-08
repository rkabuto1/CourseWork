#------------------------------------------------------------------------------------------------------------------------
#Price Prediction for Missing Years (2012–2018) (10 points: 5 points per plot)
#Since prices are missing from 2012–2018, predict them using your models as if Ford had produced the Ranger during those years.
#Plot price-vs-year curves:
#One for min. price
#One for max. price
#------------------------------------------------------------------------------------------------------------------------
import numpy as np
import matplotlib.pyplot as plt

def predict_missing(FordYears, Lowestprice, Highestprice, MinimumTheta, MaximumTheta, x):
    EmptyYears = np.array([2012,2013,2014,2015,2016,2017,2018,])
    Average = x.mean()
    Standard = x.std()

    EmptyNormalization = []
    for year in EmptyYears:
        EmptyNormalization.append([(year - Average) / Standard])
    MissingYs = []
    for row in EmptyNormalization:
        MissingYs.append([1.0] + row)
    MissingYs = np.array(MissingYs)

    LowestPrediction = []
    HighestPrediction = []
    for row in MissingYs:
        low_sum = 0
        high_sum = 0
        for i in range(len(row)):
            low_sum += row[i] * MinimumTheta[i]
            high_sum += row[i] * MaximumTheta[i]
        LowestPrediction.append(low_sum)
        HighestPrediction.append(high_sum)
    
    CompleteYears = list(FordYears) + list(EmptyYears)
    CompleteLowestPrices = list(Lowestprice) + LowestPrediction
    CompleteMaximumPrices = list(Highestprice) + HighestPrediction

    SortedArray = sorted(range(len(CompleteYears)), key=lambda k: CompleteYears[k])
    SortedYears = [CompleteYears[i] for i in SortedArray]
    CompleteLowestPrices = [CompleteLowestPrices[i] for i in SortedArray]
    CompleteMaximumPrices = [CompleteMaximumPrices[i] for i in SortedArray]

    #Construct The Graph
    #Min Prices
    fig1, ax1 = plt.subplots(figsize =(10,4))
    ax1.plot(SortedYears, CompleteLowestPrices, marker = 'o', label = 'Minimum Price')
    ax1.axvspan(2012, 2018, color='orange', alpha = 0.2, label = 'The Predicted Range')
    ax1.set_title('Minimum Predicted Prices For 2012-2018')
    ax1.set_xlabel('Year')
    ax1.set_ylabel('Price ($)')
    ax1.grid(True)
    ax1.legend()
    fig1.tight_layout()
    plt.show()
    #Max Prices
    fig2, ax2 = plt.subplots(figsize =(10,4))
    ax2.plot(SortedYears, CompleteMaximumPrices, marker = 'o', color = 'red', label = 'Maximum Price')
    ax2.axvspan(2012, 2018, color='orange', alpha = 0.2, label = 'The Predicted Range')
    ax2.set_title('Maximum Predicted Prices For 2012-2018')
    ax2.set_xlabel('Year')
    ax2.set_ylabel('Price ($)')
    ax2.grid(True)
    ax2.legend()
    fig2.tight_layout()
    plt.show()
