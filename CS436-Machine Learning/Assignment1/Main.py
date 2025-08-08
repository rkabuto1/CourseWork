import numpy as np
from Part2_LinearRegression import FordYears, Lowestprice, Highestprice, LinearRegression, plot_losses
from Part3_PricePrediction import predict_missing
from Part4_DynamicLearning import DynamicLinearRegression, plot_dynamic_losses

#------------------------------------------------------
#Question 2 - Linear Regression – Model Training
x = FordYears.reshape(-1, 1)
Normalization = (x - x.mean()) / x.std()
y = np.c_[np.ones(x.shape[0]), Normalization]

MinimumTheta, TrueLoss = LinearRegression(y, Lowestprice)
MaximumTheta, TrueMax = LinearRegression(y, Highestprice)
plot_losses(TrueLoss, TrueMax)
print(f"Our final model weights after training")
print(f"Min Price Intercept: {MinimumTheta[0]:.2f}, slope = {MinimumTheta[1]:.2f}")
print(f"Max Price Intercept: {MaximumTheta[0]:.2f}, slope = {MaximumTheta[1]:.2f}")
#------------------------------------------------------
#Question 3 - Predict The Missing Year Prices
predict_missing(FordYears, Lowestprice, Highestprice, MinimumTheta, MaximumTheta, x)
#------------------------------------------------------
#Question 4 - Dynamic Linear Regression
DynamicMinimumTheta, DynTrueLoss = DynamicLinearRegression(y, Lowestprice)
DynamicMaximumTheta, DynTrueMax = DynamicLinearRegression(y, Highestprice)
plot_dynamic_losses(DynTrueLoss, DynTrueMax)
predict_missing(FordYears, Lowestprice, Highestprice, DynamicMinimumTheta, DynamicMaximumTheta, x)