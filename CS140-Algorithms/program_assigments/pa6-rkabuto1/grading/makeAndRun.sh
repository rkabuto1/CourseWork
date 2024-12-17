#!/bin/bash

old_tester_name="bailey_checkWeightedGraph"
tester_name="$1_checkWeightedGraph"

#move tester name appropriately
mv ${old_tester_name}.java ${tester_name}.java

#replace 'bailey' with student last name
sed -i "s/bailey/${1}/g" ${tester_name}.java

#compile the tester and student code
javac *.java

#run the tester
echo "==============================================================================================="
echo "Running tester:"
echo "java $1_checkWeightedGraph"
echo "==============================================================================================="

java $tester_name