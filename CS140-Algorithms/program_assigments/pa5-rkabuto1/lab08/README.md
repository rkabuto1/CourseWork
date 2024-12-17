------------------------------
Lab08 - Due 3/14 by 11:59 pm
------------------------------

## Description

For lab08, we will be creating a collection of JUnit5 tests that should do a good job of testing our Binary Search Tree (BST) functionality.

- We have provided the start of some JUnit testing for you, in `BinarySeachTreeTest.java`. 
	- **Note:** It resides in the `lab08` directory of the Program assignment 5 repository.
- You will need to add JUnit5 as a library, otherwise the test code wont't compile.
	- We've covered how to do this in previous assignments, refer to those.
	- You will need to update the references to the `BinarySearchTree` class to use your last name.

## Requirements

- There are 28 unit tests in all.
	- 19 of which have already been provided.
	- You are responsible for implementing the remaining 9 tests.
	- We have added TODOs in the JUnit test file to indicate which you need to work on for this lab.

- [An overview of ***all the JUnit tests*** in more detail has been provided here as well](/lab08/lab08_test_overview.pdf)	

## Disclaimer

- Passing all of the tests does not guarantee that your BST code is completely correct, but does get you started.
	- The insert and delete methods need more testing.
	
- Once you get started implementing your BST, these tests should help ensure things are working well.
	- Some of the tests obviously will not work until your BST implementation is underway.

## Test Descriptions

- For the tests that return  value, we will compare the ***actual returned value*** with the ***expected return value***.
	- Such as `getHeight()`, `getRoot()`, `getMin()`, `getMax()`, etc.

- For the tests that don't return a value, we will use a modified version of the `inOrderWalk()` to verify that all nodes are in their proper places.
	- Such as `insertNode()`, `deleteNode()`

## Tests for you to Work

The following 9 tests need to be implemented:

1. `testInsertTwoNodesB()`
2. `testGetHeightForSevenNodesTree()`
3. `testGetPredecessorOfRootForSevenNodesTree()`
4. `testGetHeight()` 
5. `testGetRoot()`
6. `testGetNode()`
7. `testDeleteNode45And95()`	
8. `testCountForDuplicateNode()`
9. `testCountForDuplicateNodeWithDelete()`

### 1. `testInsertTwoNodesB()`

- This is nearly identical to `testInsertTwoNodes()`
- You can copy the contents of `testInsertTwoNodes()` to `testInsertTwoNodesB()` and then make the following changes:
	- We are inserting nodes with keys `20` & `30`, so update the list of keys from `{20, 10}` to `{20, 30}`
	- In the `assertArrayEquals` statement, we need to change `checkInOrderWalkInsertTwoNodesArray` to `checkInOrderWalkInsertTwoNodesBArray`
	- **Note:** `checkInOrderWalkInsertTwoNodesArray` has the `inOrderWalk` results for keys `{20, 10}`
	- **Note:** `checkInOrderWalkInsertTwoNodesBArray` has the `inOrderWalk` results for keys `{20, 30}`

### 2. `testGetHeightForSevenNodesTree()`

- This test is similar to `testGetSuccessorOfRootForSevenNodesTree()`, so start by copying the content of `testGetSuccessorOfRootForSevenNodesTree()`
- This inserts the keys `{20, 10, 30, 5, 15, 25, 35}` into the BST instance named `tree`
- We need to change the `assertEquals()` statement to compare the number `2` (expected height of tree) with the result of `tree.getHeight(tree.getRoot())`.
- **Note:** `tree.getHeight(tree.getRoot())` returns the height of the subtree of `tree` rooted at the `root` of `tree` 
	- In other words, it will return the height of the entire BST `tree`	

### 3. `testGetPredecessorOfRootForSevenNodesTree()`

- This test is similar to `testGetSuccessorOfRootForSevenNodesTree()`, so start by copying the content of `testGetSuccessorOfRootForSevenNodesTree()`
- This inserts the keys `{20, 10, 30, 5, 15, 25, 35}` into the BST instance named `tree`
- We now need to update the `assertEquals()` statement to compare `“(15,10,,)”`, the expected predecessor of the root of tree, with `tree.getPredecessor(tree.getRoot()).toString()`
- **Note:** `tree.getPredecessor(tree.getRoot()).toString()` returns the string representation of the predecessor of the `root` of `tree`

### 4. `testGetHeight()`

- This test is similar to `testGetMax()`, so start by copying the content of `testGetMax()`
- Update the `assertEquals()` statement to compare `5`, the expected height of `t`, with `t.getHeight(t.getRoot())`
- **Note:** `t.getHeight(t.getRoot())` returns the height of the tree `t`, rooted at the `root` of `t`

### 5. `testGetRoot()`

- This test is similar to `testGetMax()`, so start by copying the content of `testGetMax()`
- Update the `assertEquals()` statement to compare `“(50,,25,75)”`, the expected `root` of `t`, with the result of `t.getRoot().toString()`
- **Note:** `t.getRoot().toString()` returns the string representation of the `root` of `t`

### 6. `testGetNode()`

- This test is similar to `testGetMax()`, so start by copying the content of `testGetMax()`
- Update the `assertEquals()` statement to compare `“(91,93,,)”`, the expected string for the node with key `91`, to `t.getNode(t.getRoot(), 91).toString()`
- **Note:** `t.getNode(t.getRoot(), 91).toString()` returns the string representation of the node with key `91`, starting the search with the `root` of `t`

### 7. `testDeleteNode45And95()`

- This is similar to `testDeleteNode45()`, so start by copying the the content of `testDeleteNode45()`
- Since we are deleting nodes `45` and `95` from `t`, change the list of keys to delete from `{45}` to `{45, 95}`
- We now need to update the `assertArrayEquals()` statement
	- Replace `checkInOrderWalkPostDelete45Array` with `checkInOrderWalkPostDelete45And95Array`
	- **Note:** `checkInOrderWalkPostDelete45Array` is the `inOrderWalk` after deleting the node with key `45` from the BST instance named `t`
	- **Note:** `checkInOrderWalkPostDelete45And95Array` is the `inOrderWalk` after deleting the nodes with keys `45` and `95` from the BST instance named `t` 	
### 8. `testCountForDuplicateNode()`

- This test is similar to `testGetSuccessorOfRootForSevenNodesTree()`, so start by copying the content of `testGetSuccessorOfRootForSevenNodesTree()`
- Update the list of keys to inser to `{20, 10, 30, 35, 5, 35, 15, 35, 25, 35}`
- Update the `assertEquals()` statement to compate the number `4` (the count for the node with key `35`) to `t.getNode(t.getRoot(), 35).getCount()`

### 9. `testCountForDuplicateNodeWithDelete()`

- This test is similar to `testCountForDuplicateNode()`, so start by copying the content of `testCountForDuplicateNode()`
- Then do the following (after inserting the nodes into the tree):
1. **Delete** one copy of the node with key `35`

```java	
Node node = tree.getNode(tree.getRoot(), 35);
tree.delete(node);
```
2. ***Delete a second copy*** of the node with key `35`

```java
node = tree.getNode(tree.getRoot(), 35);
tree.delete(node);
```
3. Update the `assertEquals()` statement to compare the number `2` (the count for the node with key `35`) to `t.getNode(t.getRoot(), 35).getCount()`

## Getting Credit for Lab 8

- Demonstrate to a TA/CA that you can execute the JUnit tests associated with this lab.
- Show the TA/CA that you have made the appopriate changes

## Submission

Submit your code to github, and your latest commit hash to BrightSpace.

```
git add -A
git commit -m "finished lab08. rest of program assignment 5 to come later"
git push 
git rev-parse HEAD
```

**Note:** Similar to how we did Progam Assignment 4 and lab06, there will be two separate commit hashes that we will utilize to grade Lab 8 and Program Assignment 5 separately, even though your work for both will reside in this single repository.

## Continuing with Program Assignment 05

[If you have time, you may continue with the rest of Program Assignment 05 now.](/README.md#program-assignment-05-requirements)
