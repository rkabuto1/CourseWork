-----------------------------------
Programming Assignment 3 - Due 2/28
-----------------------------------

- For programming assignment 3 we will be updating the `BankAccount` and
`EnhancedBankAccount` classes from lab04, to fill in the missing functionality. We have already reviewed the two classes. `BankAccount` is a very basic class to implement the functionality of a bank account. `EnhancedBankAccount` is a subclass of `BankAccount`, adding functionality of tracking all of the transactions. 

- When you submit your program, you should rename `BankAcount` and `EnhancedBankAcount` to `your_last_name_in_lower_case_BankAccount` and
`your_last_name_in_lower_case_EnhancedBankAccount` (along with the corresponding changes to the class names, constructor names, and any statements instantiating a `BankAccount` or `EnhancedBankAccount` object).

**Continuing on From Lab 04**

- As part of lab 4 we updated `makeBankAccountsAndTransactions.java` to process transactions from a text file. This can be used as the starting point for testing your updates. And, you should be able to test the balance processing functionality for both `BankAccount` and `EnhancedBankAccount` with `makeBankAccountsAndTransactions.java`. 

**Testing Transaction functionality**

- During next lecture we will discuss ideas on how to test the transaction tracking that the `EnhancedBankAccount` adds.

## Verify the following was completed during lab04

To ensure you get full credit for programming assignment 3, verify that all of the following is true for 
the methods implemented in lab04.

1. In `BankAccount`
	- In the ***withdraw and transfer methods***, if there are insufficient funds to perform the operation, the method returns false and does not perform the operation. Otherwise it performs the operation and returns true.
	- By "performs the operation", I mean adjust the savings and checking account balances based on the operation.
	- In the ***deposit methods***, the saving or checking account balance is properly adjusted based on the specified amount.
	- The ***get methods*** return the appropriate values held in the fields of the class.
	- The `toString()` method returns a `String` of the following information (a,b,c should be on separate lines in the string returned by toString()):
		1. `ownerLastName`, `ownerFirstName`, `accountNumber`
		2. `checkingBalance`
		3. `savingsBalance`

2. In `EnhancedBankAccount`
	- The `Transaction` record can be used to create a transaction
	- The types of transactions supported are embodied by the `TransactionType` enumeration 
	
	```java
		enum TransactionType{
			NEW_ACCOUNT, 
			DEPOSIT_TO_CHECKING, 
			DEPOSIT_TO_SAVINGS, 
			WITHDRAW_FROM_SAVINGS, 
			WITHDRAW_FROM_CHECKING, 
			TRANSFER_TO_SAVINGS, 
			TRANSFER_TO_CHECKING
		}
	```
	- For the constructor of `EnhancedBankAccount`, there should be:
		- a `NEW_ACCOUNT` transaction added to the successful transactions. 
		- If the initial value for savings is greater than 0, then a `DEPOSIT_TO_SAVINGS` transaction should be added to the successful transactions. 
		- If the initial value for the checking is greater than 0, then a `DEPOSIT_TO_CHECKING` transaction should be added to the successful transactions.
		- (I believe this was provided for you in the start code given for lab04.)

## Implement some New Functionality

- The additional functionality that you need to implement is below. Most of the methods are very simple.

**Update deposit, withdraw, and transfer methods in both classes**

- If you didn't already do so, update the deposit, withdraw, and transfter methods to ignore the request if the specified amount is some **negative value.**
- In such a case, if the function returns a boolean, it should **return false if the amount specified is negative**. 

**Update deposit, withdraw, and transfer methods in EnhancedBankAcount class**

- Update the deposit, withdraw, and transfer methods to apply the appropriate
operation, updating the `ArrayLists` of `Transactions` as appropriate
1. If successful, add a transaction of the appropriate type to the
successfulTransactions ArrayList<Transaction>

2. If unsuccessful, add a transaction of the appropriate type to the
failedTransactions ArrayList<Transaction>

**Implement the following get transaction methods in the EnhancedBankAccount**

- Add the following methods to the `EnhancedBankAccount` class:

```java
    /**
	 * Returns all the successful transactions involving some deposit to savings.
	 * 
	 * @return all the successful depositToSavings transactions
	 */ 
	public java.util.ArrayList<Transaction> getSavingsDepositTransactions()
	{
		java.util.ArrayList<Transaction> results = new java.util.ArrayList<>();
		for( Transaction t : successfulTransactions )
		{
			if( t.type() == TransactionType.DEPOSIT_TO_SAVINGS)
			{
				results.add(t);
			}
		}
		return results;
	}
	
	/**
	 * Returns all the successful transactions involving some deposit to checking.
	 * 
	 * @return all the successful depositToChecking transactions
	 */ 
	public java.util.ArrayList<Transaction> getCheckingDepositTransactions()
	{
		//TODO - implement
		return null;
	}
	
	/**
	 * Returns all the successful transactions involving some withdrawal from savings.
	 * 
	 * @return all the successful withdrawFromSavings transactions
	 */ 
	public java.util.ArrayList<Transaction> getSavingsWithdrawalTransactions()
	{
		//TODO - implement
		return null;
	}
	
	/**
	 * Returns all the successful transactions involving some withdrawal from checking.
	 * 
	 * @return all the successful withdrawFromChecking transactions
	 */
	public java.util.ArrayList<Transaction> getCheckingWithdrawalTransactions()
	{
		//TODO - implement
		return null;
	}
	
	/**
	 * Returns all the successful transactions involving some transfer from savings to checking.
	 * 
	 * @return all the successful transferFromSavingsToChecking transactions
	 */
	public java.util.ArrayList<Transaction> getSavingsToCheckingTransferTransactions()
	{
		//TODO - implement
		return null;
	}
	
	/**
	 * Returns all the successful transactions involving some transfer from checking to savings.
	 * 
	 * @return all the successful transferFromCheckingToSavings transactions
	 */
	public java.util.ArrayList<Transaction> getCheckingToSavingsTransferTransactions()
	{
		//TODO - implement
		return null;
	}
	
	/**
	 * Returns all the transactions that were failed, and occured between the specified start and end dates.
	 * 
	 * @return all the failed transactions within the specified start and end dates.
	 */ 
	public java.util.ArrayList<Transaction> getFailedTransactions(java.util.Date startDate, java.util.Date endDate)
	{
		//TODO - implement
		return null;
	}
	
	/**
	 * Returns all the transactions that were successful, and occured between the specified start and end dates.
	 * 
	 * @return all the successful transactions within the specified start and end dates.
	 */ 
	public java.util.ArrayList<Transaction> getSuccessfulTransactions(java.util.Date startDate, java.util.Date endDate)
	{
		//TODO - implement
		return null;
	}
```

- Implement the get methods to return an `ArrayList<Transaction>` of `Transactions` of the appropriate type. I've implemented `getSavingsDepositTransactions()` as an example.

- For the get transactions methods, if they do not have the word successful or
failed in the name, then you only need to return the **successful transactions** of that type

- Implement the `getFailedTransactions` and `getSuccessfulTransactions`. Both methods take a starting date and ending date. Return the transactions of the appropriate type that are within the parameterized date range. The Java documentation explains how to compare dates.

**Submission**

When finished, be sure to push your code up to github, and then submit the latest commit hash on BrightSpace.

```
git add -A
git commit -m "finished programming assignment 3"
git push
git rev-parse HEAD
```
