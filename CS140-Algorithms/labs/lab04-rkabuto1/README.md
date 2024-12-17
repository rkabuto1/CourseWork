# lab04
Lab04

- For lab 4 we will be filling in code in a skeleton of a program to help test our `BankAccount` and `EnhancedBankAccount` classes
- We will also be updating `makeBankAccountsAndTransactions.java`
- The program we will be updating, ***reads a text file of transactions***, and then “executes” the transactions
- The transaction types are
	- `new BankAccount` - this is already implemented via the constructor
	- `new EnhancedBankAccount` - this is already implemented via the constructor
	- `withdrawFromChecking` - this is already implemented for both account types

	- **withdrawFromSavings** - *you will implement this for both account types*
	- **depositToChecking** - *you will implement this for both account types*
	- **depositToSavings** - *you will implement this for both account types*
	- **transferToChecking** - *you will implement this for both account types*
	- **transferToSavings** - *you will implement this for both account types*

- For this lab, we provided the following java files:
	- makeBankAccountsAndTransactions.java
	- BankAccount.java
	- TransactionType.java
	- EnhancedBankAccount.java
	- Transaction.java
		- If this doesn't compile, we have a backup file in the backup folder you can use.
		- Transaction_with_class.java (doesn't use the record)
		- Only use this if Transaction.java doesn't compile for you, as a replacement.
		- This should only be an issue if you are using an older version of java.

- You will need to make a few minor changes

- We also provided the following test files:
	- transactions_test_1.txt
	- transactions_test_2.txt
	- transactions_test_3.txt

**Example input file**

- Here's a short sample of an input file, `transactions_test_2.txt`:

```
#first account
new BankAccount SmithJane 0 0
withdrawFromChecking 20.1
withdrawFromSavings 10.5
depositToChecking 100.0
depositToSavings 200.0
transferToChecking 10.5
transferToSavings 20.3
```

- The code currently creates a new BankAccount object for “Jane Smith” with initial account balances of 0 and 0
- The code will read the other transaction types. Your updates to the code will process the non “new account” transactions

**Example of expected output**

- Here's the expected output of a run where we process `transactions_test_2.txt`.
- **Note:** You will need to update your code for `makeBankAccountsAndTransactions`, `BankAccount`, and `EnhancedBankAccount` so the output matches:

```
java makeBankAccountsAndTransactions transactions_test_2.txt 
new BankAccount Smith Jane 0 0
Smith, Jane, 000000 
0.0
0.0
withdrawFromChecking 20.1
withdrawFromSavings 10.5
depositToChecking 100.0
depositToSavings 200.0
transferToChecking 10.5
transferToSavings 20.3
Smith, Jane, 000000
90.2
209.8
```

**Information omitted at start**

Above, the following lines will not print until you have implemented the `toString()` method in `BankAccount`:

```
Smith, Jane, 000000 
0.0
0.0
```

and

```
Smith, Jane, 000000
90.2
209.8
```

Also, the following lines  will not print until you have updated `makeBankAccountsAndTransactions.java`:
```
withdrawFromSavings 10.5
depositToChecking 100.0
depositToSavings 200.0
transferToChecking 10.5
transferToSavings 20.3
```

**Analysis**

- Here's an analysis of what should have occurred processing each transaction (when your updates to the code are completed):

| Transaction | Value | checking | savings | successful |
| ----------- | ----- | -------- | ------- | ---------- |
| create | | 0 | 0 | yes |
| withdrawFromChecking | 20.1 | 0 | 0 | no |
| withdrawFromSavings | 10.5 | 0 | 0 | no |
| depositToChecking | 100 | 100 | 0 | yes |
| depositToSavings | 200 | 100 | 200 | yes |
| transferToChecking | 10.5 | 110.5 | 189.5 | yes | 
| transferToSavings | 20.3 | 90.2 | 209.8 | yes |

**Printing Details**
- The program `makeBankAccountsAndTransactions.java` should output each transaction as they are processed (see the TODOs) 
- Each time a new BankAccount or EnhancedBankAccount is created, the `toString()` for the account is written to the screen to show the initial account information
- When the transactions for the current account are complete, the `toString()` for the account is written to the
screen, showing the cummulative effect of the transactions

**Requirements / TODOs**
1. Add code to process the five transactions that are not implemented (for both account types `BankAccount` and `EnhancedBankAccount`)
	- `withdrawFromSavings`, `depositToChecking`, `depositToSavings`, `transferToChecking`, `transferToSavings`
	- implement the `toString()` method in `BankAccount`
	- implement the getter methods that are not finished: `getAccountNumber`, `getCheckingBalance`, `getSavingsBalance`
	- the **TODOs** will help show you what needs to be implemented.

2. There are comments in `makeBankAccountsAndTransactions.java` where the code needs to be modified
	- **Note:** The `withdrawFromChecking` transaction has already been implemented
		- Call the `withdrawFromChecking()` method
		- Output to the screen the transaction type and amount
	- You need to add code, `if` statements, `if-then-else` statements, or a `switch` statement to process the other five transactions
		- `withdrawFromSavings`, `depositToChecking`, `depositToSavings`, `transferToChecking`, `transferToSavings`

	- In my implementation, processing a transaction type in `makeBankAccountsAndTransactions.java` consists of 6 lines
		- an if statement line, two squiggly bracket lines, a blank line, and a line to call the appropriate method, and a print statement line

**Credit**

You will know you are finished with lab04 when you see the following output:

**Run with transactions_test_2.txt**

```
java makeBankAccountsAndTransactions transactions_test_2.txt 
new BankAccount Smith Jane 0 0
Smith, Jane, 000000 
0.0
0.0
withdrawFromChecking 20.1
withdrawFromSavings 10.5
depositToChecking 100.0
depositToSavings 200.0
transferToChecking 10.5
transferToSavings 20.3
Smith, Jane, 000000
90.2
209.8
```

**Run with transactions_test_3.txt**

```
java makeBankAccountsAndTransactions transactions_test_3.txt 
new EnhancedBankAccount Smith Joe 30 40
Smith, Joe, 000000
30.0
40.0
withdrawFromChecking 20.1
withdrawFromSavings 10.5
depositToChecking 100.0
depositToSavings 200.0
transferToChecking 10.5
transferToSavings 20.3
Smith, Joe, 000000
100.10000000000001
239.3
```

**Submission**

As usual, be sure push your completed code to github, and submit your last commit hash to BrightSpace.

```
git add -A
git commit -m "finished lab04"
git push
git rev-parse HEAD
```