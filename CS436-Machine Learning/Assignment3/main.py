# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# PsuedoCode
# 1. Load and preprocess CIFAR 10 dataset
# 2. Create 5 fold splits dynamically using KFold
# 3. Train and validate each model across all folds
# 4. Log training time, accuracy, and save the best model
# 5. Evaluate each model on the 10K CIFAR 10 test set
# 6. Generate and save a confusion matrix for each model
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
def main():
    from models import ConvoNurelNetwork, MultiLayerPerception
    from dataset import ObtainData, Classes as classes
    from train import TrainMultipleEpochs
    import torch
    import os
    import numpy as np
    import matplotlib.pyplot as plt
    from torch.utils.data import DataLoader, Subset
    from sklearn.model_selection import KFold as KFold
    from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay

    device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
    batch_size = 64
    num_epochs = 5
    DataTraining, ImageTester, I = ObtainData(batch_size)
    ListOfIndex = list(range(len(DataTraining)))
    KFold = KFold(n_splits=5, shuffle=True, random_state=42)
    SpltKFold = list(KFold.split(ListOfIndex))

    ListModels = [('CNN', ConvoNurelNetwork), ('MLP', MultiLayerPerception)]
    IndexFromModel = 0

    while IndexFromModel < len(ListModels):
        NameOfModel, ModelTypeClass = ListModels[IndexFromModel]
        print(f"\n====== {NameOfModel} Training ======")

        ListTrainingTimes = []
        ListTrainingAcc = []
        ListValidationAcc = []

        y = 0
        while y < len(SpltKFold):
            Samples, ValSamples = SpltKFold[y]
            print(f"\nFold {y+1}/5")

            TrainSub = Subset(DataTraining, Samples)
            ValSub = Subset(DataTraining, ValSamples)

            Load = DataLoader(TrainSub, batch_size=batch_size, shuffle=True, num_workers=2)
            LoadValue = DataLoader(ValSub, batch_size=batch_size, shuffle=False, num_workers=2)

            ModelClass = ModelTypeClass()
            Output = TrainMultipleEpochs(ModelClass, Load, LoadValue, device, num_epochs)
            TimeDuration, TrainingAccuracy, ValueAccuracy = Output

            ListTrainingTimes.append(TimeDuration)
            ListTrainingAcc.append(TrainingAccuracy)
            ListValidationAcc.append(ValueAccuracy)

            y += 1

        AverageDuration = np.mean(ListTrainingTimes)
        AverageTrainingAccuracy = np.mean(ListTrainingAcc)
        AverageValidationAccuracy = np.mean(ListValidationAcc)

        print(f"\n{NameOfModel} Complete. Here is the Data:")
        print(f"Average Training Time Duration: {AverageDuration:.2f}s")
        print(f"Average Training Accuracy: {AverageTrainingAccuracy:.2f}%")
        print(f"Average Validation Accuracy: {AverageValidationAccuracy:.2f}%")

        ModelPath = f"{NameOfModel.lower()}_model.pth"
        torch.save(ModelClass.state_dict(), ModelPath)
        SizeOfModel = os.path.getsize(ModelPath) / 1024
        print(f"The Model Size was: {SizeOfModel:.2f} KB")

        print(f"\nTesting {NameOfModel}")
        ModelClass = ModelTypeClass()
        ModelClass.load_state_dict(torch.load(ModelPath))
        ModelClass.to(device)
        ModelClass.eval()

        Total = 0
        ListPreds = []
        ListLAbels = []

        IteratorTester = iter(ImageTester)
        while True:
            try:
                BatchINputs, labels = next(IteratorTester)
            except StopIteration:
                break

            BatchINputs, labels = BatchINputs.to(device), labels.to(device)
            with torch.no_grad():
                CompleteOutput = ModelClass(BatchINputs)
                _, ClassPredictions = torch.max(CompleteOutput, 1)
                Total += labels.size(0)
                correct = (ClassPredictions == labels).sum().item()
                ListPreds.extend(ClassPredictions.cpu().numpy())
                ListLAbels.extend(labels.cpu().numpy())

        FinalTestAcc = 100 * sum([int(p == l) for p, l in zip(ListPreds, ListLAbels)]) / Total
        print(f"Test Accuracy: {FinalTestAcc:.2f}%")

        ConfusionMatrix = confusion_matrix(ListLAbels, ListPreds)
        DisplayMatrix = ConfusionMatrixDisplay(confusion_matrix=ConfusionMatrix, display_labels=classes)
        DisplayMatrix.plot(xticks_rotation=45)
        plt.title(f'{NameOfModel} Confusion Matrix')
        plt.tight_layout()
        plt.savefig(f'{NameOfModel}_confusion_matrix.png')
        print(f"Confusion Matrix is a png file called {NameOfModel}_confusion_matrix.png")

        IndexFromModel += 1


if __name__ == "__main__":
    main()
