import java.util.*;

class EnhancedBankAccount extends BankAccount
{
	private final java.util.ArrayList<Transaction> successfulTransactions;
	private final java.util.ArrayList<Transaction> failedTransactions;
	
	/**
	 * Value constructor for EnhancedBankAcount.
	 * Constructs an enhanced bank account with all the acount information initialized based upon the values specified.
	 * 
	 * A unique account number is made via a delegate call to the makeAccountNumber() helper function.
	 * 
	 * Additionally, the transactions are initialized.
	 * If the checking balance is some positive amount, we represent that as a successful deposit to checking.
	 * If the savings balance is some positive amount, we represent that as a successful deposit to savings.
	 * 
	 * @param String ownerLastName 		- the account owner's last name	 
	 * @param String ownerFirstName 	- the account owner's first name
	 * @param double checkingBalance 	- the starting checking balance
	 * @param double savingsBalance 	- the starting savings balance
	 */ 
	EnhancedBankAccount(String ownerLastName, String ownerFirstName, double checkingBalance, double savingsBalance)
	{
		super(ownerLastName, ownerFirstName, checkingBalance, savingsBalance);
		
		successfulTransactions = new java.util.ArrayList<>();
		failedTransactions = new java.util.ArrayList<>();
		
		java.util.Date date = new java.util.Date();
		successfulTransactions.add(new Transaction(TransactionType.NEW_ACCOUNT, date, 0.0));
		if( checkingBalance > 0.0 )
		{
			successfulTransactions.add(new Transaction(TransactionType.DEPOSIT_TO_CHECKING, date, checkingBalance));
		}
		
		if( savingsBalance > 0.0 )
		{
			successfulTransactions.add(new Transaction(TransactionType.DEPOSIT_TO_SAVINGS, date, savingsBalance));
		}
	}
	
	/**
	 * Another value constructor for EnhancedBankAcount.
	 * Constructs an enhanced bank account with the specified first and last name for the owner. 
	 * The starting balances for the checking and savings account will be initialized to be zero.
	 * 
	 * Note that this means the transactions will not include a successful deposit to either account,
	 * since both starting balances are zeroed out.
	 * 
	 * @param String ownerLastName 	- the account owner's last name  
	 * @param String ownerFirstName - the account owner's first name
	 */ 
	EnhancedBankAccount(String ownerLastName, String ownerFirstName)
	{
		this(ownerLastName, ownerFirstName, 0.0, 0.0);
	}
	
	/**
	 * Attempts to withdraw the specified amount from the checking balance.
	 * The checking balance is only withdrawn from if there are sufficient funds to make the withdrawal.
	 * 
	 * Returns true if there are sufficient funds to make the withdrawal.
	 * Returns false if there are insufficient funds to make the withdrawal.
	 * 
	 * Additionally, if there are sufficient funds to make the withdrawal, we track that as a 
	 * successful withdrawal from checking.
	 * 
	 * On the other hand, if there are insufficient funds to make the withdrawal, we track that as a
	 * failed withdrawal from checking.
	 * 
	 * @param double amount - the amount to attempt to withdraw from the checking balance
	 * @return 				- whether the withdrawal was successful 
	 */ 
	@Override
	public boolean withdrawFromChecking(double amount)
	{
		boolean successful = false;
		java.util.Date date = new java.util.Date(); 

		//Note: We leverage the withdrawFromChecking in our base class.
		//We extend the functionality to also keep track of whether the transaction was a success or failure.
		if( super.withdrawFromChecking(amount) )
		{
			successfulTransactions.add(new Transaction(TransactionType.WITHDRAW_FROM_CHECKING, date, amount));
			successful = true;
		}
		else
		{
			failedTransactions.add(new Transaction(TransactionType.WITHDRAW_FROM_CHECKING, date, amount));
		}

		return successful;
	}
	
	/**
	 * Attempts to withdraw the specified amount from the savings balance.
	 * The savings balance is only withdrawn from if there are sufficient funds to make the withdrawal.
	 * 
	 * Returns true if there are sufficient funds to make the withdrawal.
	 * Returns false if there are insufficient funds to make the withdrawal.
	 * 
	 * Additionally, if there are sufficient funds to make the withdrawal, we track that as a 
	 * successful withdrawal from savings.
	 * 
	 * On the other hand, if there are insufficient funds to make the withdrawal, we track that as a
	 * failed withdrawal from savings.	 
	 * 
	 * @param double amount - the amount to attempt to withdraw from the savings balance
	 * @return 				- whether the withdrawal was successful 
	 */ 
	@Override
	public boolean withdrawFromSavings(double amount)
	{
		boolean successful = false;
		java.util.Date date = new java.util.Date();
		if( super.withdrawFromSavings(amount) )
		{
			successfulTransactions.add(new Transaction(TransactionType.WITHDRAW_FROM_SAVINGS, date, amount));
			successful = true;
		}
		else
		{
			failedTransactions.add(new Transaction(TransactionType.WITHDRAW_FROM_SAVINGS, date, amount));
		}
		return successful;	
	}
	
	/**
	 * Attempts to transfer the specified amount from the savings balance to the checking balance.
	 * The savings balance is only transfered from if there are sufficient funds to make the transfer.
	 * 
	 * Returns true if there are sufficient funds to make the transfer.
	 * Returns false if there are insufficient funds to make the transfer.
	 * 
	 * Additionally, if there are sufficient funds to make the transfer, we track that as a 
	 * successful transfer from savings to checking.
	 * 
	 * On the other hand, if there are insufficient funds to make the transfer, we track that as a
	 * failed transfer from savings to checking.	 
	 * 
	 * @param double amount - the amount to attempt to transfer from the savings balance to the checking balance
	 * @return 				- whether the transfer was successful 
	 */ 
	@Override
	public boolean transferFromSavingsToChecking(double amount)
	{
		boolean successful = false;
		java.util.Date date = new java.util.Date(); 
		if( super.transferFromSavingsToChecking(amount) )
		{
			successfulTransactions.add(new Transaction(TransactionType.TRANSFER_TO_CHECKING, date, amount));
			successful = true;
		}
		else
		{
			failedTransactions.add(new Transaction(TransactionType.TRANSFER_TO_CHECKING, date, amount));
		}

		return successful;
	}
	
	/**
	 * Attempts to transfer the specified amount from the checking balance to the savings balance.
	 * The checking balance is only transfered from if there are sufficient funds to make the transfer.
	 * 
	 * Returns true if there are sufficient funds to make the transfer.
	 * Returns false if there are insufficient funds to make the transfer.
	 * 
	 * Additionally, if there are sufficient funds to make the transfer, we track that as a 
	 * successful transfer from checking to savings.
	 * 
	 * On the other hand, if there are insufficient funds to make the transfer, we track that as a
	 * failed transfer from checking to savings.	
	 * 
	 * @param double amount - the amount to attempt to transfer from the checking balance to the savings balance
	 * @return 				- whether the transfer was successful 
	 */ 
	@Override
	public boolean transferFromCheckingToSavings(double amount)
	{
		boolean successful = false;
		java.util.Date date = new java.util.Date(); 
		if(super.transferFromCheckingToSavings(amount))
		{
			successfulTransactions.add(new Transaction(TransactionType.TRANSFER_TO_SAVINGS, date, amount));
			successful = true;
		}
		else
		{
			failedTransactions.add(new Transaction(TransactionType.TRANSFER_TO_SAVINGS, date, amount));
		}
		return successful;
	}

	/**
	 * Deposits the specified amount to the checking balance.
	 * 
	 * Additionally, we track the transaction as a successful deposit to checking.
	 * 
	 * @param double amount - the amount to deposit into the checking balance
	 */ 
	@Override
	public void depositToChecking(double amount)
	{
		//Note: We leverage the depositToChecking in our base class.
		//We extend the functionality to also keep track of the transaction.
		java.util.Date date = new java.util.Date();
		super.depositToChecking(amount);
		successfulTransactions.add(new Transaction(TransactionType.DEPOSIT_TO_CHECKING, date, amount));
	}
	
	/**
	 * Deposits the specified amount to the savings balance.
	 * 
	 * Additionally, we track the transaction as a successful deposit to savings.
	 * 
	 * @param double amount - the amount to deposit into the savings balance
	 */ 
	@Override
	public void depositToSavings(double amount)
	{
		java.util.Date date = new java.util.Date();
		super.depositToSavings(amount);
		successfulTransactions.add(new Transaction(TransactionType.DEPOSIT_TO_SAVINGS, date, amount));		
	}

	/**
	 * Returns all the transactions that were successful.
	 * 
	 * @return all the successful transactions
	 */ 
	public java.util.ArrayList<Transaction> getAllSuccessfulTransactions()
	{
		return successfulTransactions;
	}
	
	/**
	 * Returns all the transactions that were failed.
	 * 
	 * @return all the failed transactions
	 */ 
	public java.util.ArrayList<Transaction> getAllFailedTransactions()
	{
		return failedTransactions;
	}
}
