#!/bin/bash

javac fixName.java
javac makeRunFile.java 

java fixName $1_BankAccount.java
java fixName $1_EnhancedBankAccount.java
java makeRunFile $1
javac $1_makeBankAccountsAndTransactions.java
java $1_makeBankAccountsAndTransactions transactions_test_7.txt
