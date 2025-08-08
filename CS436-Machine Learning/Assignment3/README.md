# Assignment III

**CS 436/536**
**Due: 07/21 23:59**

## Description

(Please carefully follow the directions and answer all the questions.)

---

## Part 1

1. Use 2 Deep Learning Models (MLP, CNN) to perform classification of CIFAR-10 dataset.
   **\[30 Points]**

2. Please refer: [https://pytorch.org/tutorials/beginner/blitz/cifar10\_tutorial.html](https://pytorch.org/tutorials/beginner/blitz/cifar10_tutorial.html)
   to know how to load CIFAR-10 Dataset in pytorch.

3. In CIFAR-10 there are 50000 images in training dataset and 10000 images in test dataset.

4. Split train data in 80:20 (Train: Validation) and perform 5-fold validation.
   **\[20 Points]**

5. Report the Training Time, model size and training accuracy for all 2 models.
   **\[10 Points]**

6. Report their test accuracies as well as draw confusion matrix.
   **\[10 Points]**

You may refer to the following notebooks posted under Notebook section on Brightspace for examples of K-Fold Cross Validation and CNN implementations:

* Notebook\_HousePricePrediction\_K-fold\_CrossValidation.ipynb
* Notebook\_MNIST\_Classification\_LeNet\_ResNet.ipynb

You may use the CNN code from the notebook or use them as a baseline.
However, make sure you thoroughly understand the code, as this understanding will be essential for Part 2.

---

## Part 2

Choose at least 3 hypotheses, test them with CNN, and explain why they are correct or wrong.
**\[30 Points]**

Following are some example hypotheses:

1. Increase/decrease the model size/complexity will improve performance
   (justify) (test) (yes/no) (explain)

2. Increase/decrease the batch\_size
   (justify) (test) (yes/no) (explain)

3. Increase/decrease input sample size for training
   (justify) (test) (yes/no) (explain)

4. Change the model, which model?
   (justify) (test) (yes/no) (explain)

5. Needs more regularization for better training
   (justify) (test) (yes/no) (explain)

---

## Submission

* 5% deduction for every late day and maximum of 7 late days are allowed.
* Please submit a single PDF file that includes all your code with comments and answers/summary paragraph to all the questions in the Description section.
* Code should be computer readable. NO SCREENSHOTS.
