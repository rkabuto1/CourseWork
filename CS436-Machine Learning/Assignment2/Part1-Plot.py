#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
#Build a logistic regression model using 2 features of your choice as input, and any 2 flowers of your choice 
#as binary classifiable output. [10 points] Plot the distribution of your selected data.
# More specifically, a 2D scatter plot with the axes being the 2 features.
#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
import pandas as pd
import matplotlib.pyplot as plt
#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
# Psuedocode: 
# Step 1 - Read the data from the iris.data without the headers included and assign coloumn names
# Step 2 - Define the Plot and what the x and y axes are for each feature 
# Step 3 - Create a figure and axes object for plotting
# Step 4 - Split the data by class for seperate plotting. Iris-Setosa = Orange Iris-Virgincia = Yellow
# Step 5 - Construct the graph - Label the axes, title the plot, and adjust to prevent label overlap etc.
#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
df = pd.read_csv('iris.data', header=None)
df.columns = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width', 'class']
df = df[df['class'].isin(['Iris-setosa', 'Iris-virginica'])]

XAxis = 'petal_length'
YAxis = 'petal_width'

fig, ax = plt.subplots(figsize=(8,6))
DataSet = df[df['class'] == 'Iris-setosa']
DataVirg = df[df['class'] == 'Iris-virginica']

ax.scatter(DataSet[XAxis], DataSet[YAxis], label = 'Iris-setosa', marker = 'o', color = 'orange', edgecolor = 'k')
ax.scatter(DataVirg[XAxis], DataVirg[YAxis], label = 'Iris-virginica', marker = 's', color = 'yellow', edgecolor = 'k')
ax.set_xlabel('Our Petal Length in cm')
ax.set_ylabel('Our Petal Width in cm')
ax.set_title('Iris Setosa vs. Iris Virginica Scatter Plot')
ax.legend()
ax.grid(True)
fig.tight_layout()
plt.show()


             