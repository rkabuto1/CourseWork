#Split your data into 80% Training and 20% Testing.
import pandas as pd
from sklearn.model_selection import train_test_split
#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
# PsuedoCode:
# Step 1 - Read the data from the iris.data without the headers included and assign coloumn name
# Step 2 - Set 0 = Setosa and Set 1 = Virgincia
# Step 3 - Extract the feature matrix and label array and split data into training sets(80/20 split)
# Step 4 - Print the result of the split
#-=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=--=-=-=-=-
iris_df = pd.read_csv('iris.data', header=None)
iris_df.columns = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width', 'species']
iris_df = iris_df.query("species == 'Iris-setosa' or species == 'Iris-virginica'")

iris_df['target'] = iris_df['species'].apply(lambda x: 0 if x == 'Iris-setosa' else 1)

selected_features = iris_df.loc[:, ['petal_length', 'petal_width']].to_numpy()
target_values = iris_df['target'].to_numpy()

TrainFeature, TestFeature, TrainLabel, TestLabel = train_test_split(selected_features, target_values, test_size=0.2, random_state=42)

print('Train/test split complete:')
print(f"Training Sampels: {len(TrainFeature)}")
print(f"Testing Samples: {len(TestFeature)}")

