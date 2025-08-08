import torchvision
import torchvision.transforms as transforms
from torch.utils.data import DataLoader, Subset
from sklearn.model_selection import KFold
import numpy as np
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-
# Pseudo Code 
# 1. Download and apply transformation to the CIFAR 10 dataset for both training and testing
# 2. Shuffle the training dataset and extract the first 80% as the new training subset
# 3. Initialize KFold with 5 splits and set a random seed
# 4. Manually iterate through the KFold split generator using a conditional loop
#     - At each iteration, conditionally append the pair to the list of folds
#     - Replace direct list conversion of the generator
# 5. Return the processed training subset, test dataloader, and constructed list of fold indices
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-
def SplittingDataSet(CompleteTraining, train_ratio=0.8, seed=42, n_splits=5):
    i = np.arange(len(CompleteTraining))
    np.random.seed(seed)
    np.random.shuffle(i)
    SizeOfTrain = int(train_ratio * len(i))
    TrainI = i[:SizeOfTrain]
    ValueOfIndex = i[SizeOfTrain:]
    Train = Subset(CompleteTraining, TrainI)
    KTimes = KFold(n_splits=n_splits, shuffle=True, random_state=seed)
    AmountofTimes = []
    Generator = KTimes.split(np.arange(len(Train)))
    idx = 0

    for train_idx, val_idx in Generator:
        if idx < n_splits: 
            AmountofTimes.append((train_idx, val_idx))
        idx += 1
    return Train, AmountofTimes

def ObtainData(batch_size=64):
    Translation = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
    CompleteTraining = torchvision.datasets.CIFAR10(root='./data', train=True, download=True, transform=Translation)
    TestingSet = torchvision.datasets.CIFAR10(root='./data', train=False, download=True, transform=Translation)
    TestingLoader = DataLoader(TestingSet, batch_size=batch_size, shuffle=False, num_workers=2)
    DataSetD, AmountofTimes = SplittingDataSet(CompleteTraining)
    return DataSetD, TestingLoader, AmountofTimes

Classes = ('plane', 'car', 'bird', 'cat', 'deer', 'dog', 'frog', 'horse', 'ship', 'truck')
