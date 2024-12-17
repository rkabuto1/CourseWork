#!/bin/bash

sed -i "s/bailey/${1}/g" checkBinarySearchTree.java


javac checkBinarySearchTree.java
java checkBinarySearchTree binary_search_tree_test_data.txt