import time
import torch
import torch.nn as nn
import torch.optim as optim
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Psuedcode
# 1. Set the model to evaluation mode
# 2. Initialize empty lists to store predicted and true labels.
# 3. Use a while loop to manually iterate through the validation data loader.
# 4.    - For each batch
# 5.    - Move the inputs and labels to the target device
# 6.    - Disable gradient tracking with torch.no_grad().
# 7. Run a forward pass to obtain output logits.
# 8. Compute predictions using argmax over output logits.
# 9. Append predictions and true labels to respective lists.
# 10. Compute the number of correct predictions.
# 11. Calculate and return the final accuracy as a percentage.
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
def TrainMultipleEpochs(Model, TrainData, ValidateData, CPU, NumberEpochs=5):
    Model.to(CPU)
    LossFunc = nn.CrossEntropyLoss()
    UpdateModel = optim.SGD(Model.parameters(), lr=0.001, momentum=0.9)
    StartTrainingTime = time.time()

    for Epoch in range(NumberEpochs):
        AverageLoss, Accuracy = TrainSingleEpochs(Model, TrainData, CPU, UpdateModel, LossFunc)
        print(f"Epoch is {Epoch+1}: Our Loss={AverageLoss:.3f}, Training Accuracy={Accuracy:.2f}%")

    TotalTime = time.time() - StartTrainingTime
    FinalAccuracy = ModelAccuracy(Model, ValidateData, CPU)
    return TotalTime, Accuracy, FinalAccuracy

def TrainSingleEpochs(Model, TrainData, CPU, UpdateModel, LossFunc):
    Model.train()
    LostValues = []
    PredictedLabels = []
    TruthLabels = []

    TrainIterator = iter(TrainData)
    while True:
        try:
            Images = next(TrainIterator)
        except StopIteration:
            break

        Input, TypeLabel = Images
        Input = Input.to(CPU)
        TypeLabel = TypeLabel.to(CPU)

        UpdateModel.zero_grad()
        Predictions = Model.forward(Input)
        ComputedLoss = LossFunc(Predictions, TypeLabel)
        ComputedLoss.backward()
        UpdateModel.step()
    
        LostValues.append(ComputedLoss.item())
        PredictedLabels.extend(torch.argmax(Predictions, dim=1).detach().cpu().numpy())
        TruthLabels.extend(TypeLabel.detach().cpu().numpy())

    CountCorrect = sum([int(p == l) for p, l in zip(PredictedLabels, TruthLabels)])
    Accuracy = 100 * CountCorrect / len(TruthLabels)
    AverageLoss = sum(LostValues)
    return AverageLoss, Accuracy

def ModelAccuracy(Model, ValidateData, CPU):
    Model.eval()
    ListPredVal = []
    ListTrueLabels = []

    ValidateIterator = iter(ValidateData)
    while True:
        try:
            Images = next(ValidateIterator)
        except StopIteration:
            break

        Input, TypeLabel = Images
        Input = Input.to(CPU)
        TypeLabel = TypeLabel.to(CPU)

        with torch.no_grad():
            Output = Model(Input)
            Predictions = torch.argmax(Output, dim=1)
            ListPredVal.extend(Predictions.cpu().numpy())
            ListTrueLabels.extend(TypeLabel.cpu().numpy())

    CorrectPredictionsSet = sum([int(p == l) for p, l in zip(ListPredVal, ListTrueLabels)])
    FinalValidateAccuracy = 100 * CorrectPredictionsSet / len(ListTrueLabels)
    return FinalValidateAccuracy
