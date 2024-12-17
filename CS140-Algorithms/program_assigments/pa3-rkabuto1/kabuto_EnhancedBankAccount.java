
import java.util.ArrayList;

class kabuto_EnhancedBankAccount extends kabuto_BankAccount
{
	private final java.util.ArrayList<Transaction> successfulTransactions;
	private final java.util.ArrayList<Transaction> failedTransactions;
	
	kabuto_EnhancedBankAccount(String ownerLastName, String ownerFirstName, double checkingBalance, double savingsBalance)
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
	
	kabuto_EnhancedBankAccount(String ownerLastName, String ownerFirstName)
	{
		this(ownerLastName, ownerFirstName, 0.0, 0.0);
	}
	
	public boolean withdrawFromChecking(double amount)
	{
		boolean returnValue = false;
		java.util.Date date = new java.util.Date(); 
		if( super.withdrawFromChecking(amount) )
		{
			successfulTransactions.add(new Transaction(TransactionType.WITHDRAW_FROM_CHECKING, date, amount));
			returnValue = true;
		}
		else
		{
			failedTransactions.add(new Transaction(TransactionType.WITHDRAW_FROM_CHECKING, date, amount));
		}
		return returnValue;
	}
	
	public boolean withdrawFromSavings(double amount)
	{
		boolean returnValue = false;
		java.util.Date date = new java.util.Date(); 
		if( super.withdrawFromSavings(amount) )
		{
			successfulTransactions.add(new Transaction(TransactionType.WITHDRAW_FROM_SAVINGS, date, amount));
			returnValue = true;
		}
		else
		{
			failedTransactions.add(new Transaction(TransactionType.WITHDRAW_FROM_SAVINGS, date, amount));
		}
		return returnValue;
	}
	
	public boolean transferFromSavingsToChecking(double amount)
	{
		boolean returnValue = false;
		java.util.Date date = new java.util.Date(); 
		if( super.transferFromSavingsToChecking(amount) )
		{
			successfulTransactions.add(new Transaction(TransactionType.TRANSFER_TO_CHECKING, date, amount));
			returnValue = true;
		}
		else
		{
			failedTransactions.add(new Transaction(TransactionType.TRANSFER_TO_CHECKING, date, amount));
		}
		return returnValue;
	}
	
	public boolean transferFromCheckingToSavings(double amount)
	{
		boolean returnValue = false;
		java.util.Date date = new java.util.Date(); 
		if( super.transferFromCheckingToSavings(amount) )
		{
			successfulTransactions.add(new Transaction(TransactionType.TRANSFER_TO_SAVINGS, date, amount));
			returnValue = true;
		}
		else
		{
			failedTransactions.add(new Transaction(TransactionType.TRANSFER_TO_SAVINGS, date, amount));
		}
		return returnValue;
	}
	
	public void depositToSavings(double amount)
	{
		java.util.Date date = new java.util.Date();
		super.depositToSavings(amount);
		successfulTransactions.add(new Transaction(TransactionType.DEPOSIT_TO_SAVINGS, date, amount));
	}
	
	public void depositToChecking(double amount)
	{
		java.util.Date date = new java.util.Date();
		super.depositToChecking(amount);
		successfulTransactions.add(new Transaction(TransactionType.DEPOSIT_TO_CHECKING, date, amount));
	}
	
	public java.util.ArrayList<Transaction> getAllSuccessfulTransactions()
	{
		return successfulTransactions;
	}
	
	public java.util.ArrayList<Transaction> getAllFailedTransactions()
	{
		return failedTransactions;
	}
	
	public java.util.ArrayList<Transaction> getSavingsDepositTransactions()
	{
		java.util.ArrayList<Transaction> results = new java.util.ArrayList<>();
		for(Transaction t : successfulTransactions )
		{
			if( t.type() == TransactionType.DEPOSIT_TO_SAVINGS )
			{
				results.add(t);
			}
		}
		return results;
	}
	
	public java.util.ArrayList<Transaction> getCheckingDepositTransactions()
	{
		java.util.ArrayList<Transaction> results = new java.util.ArrayList<>();
		for( Transaction t : successfulTransactions )
		{
			if( t.type() == TransactionType.DEPOSIT_TO_CHECKING )
			{
				results.add(t);
			}
		}
		return results;
	}
	
	public java.util.ArrayList<Transaction> getSavingsWithdrawalTransactions()
	{
		java.util.ArrayList<Transaction> results = new java.util.ArrayList<>();
		for( Transaction t : successfulTransactions )
		{
			if( t.type() == TransactionType.WITHDRAW_FROM_SAVINGS )
			{
				results.add(t);
			}
		}
		return results;
	}
	
	public java.util.ArrayList<Transaction> getCheckingWithdrawalTransactions()
	{
		java.util.ArrayList<Transaction> results = new java.util.ArrayList<>();
		for( Transaction t : successfulTransactions )
		{
			if( t.type() == TransactionType.WITHDRAW_FROM_CHECKING )
			{
				results.add(t);
			}
		}
		return results;
	}
	
	public java.util.ArrayList<Transaction> getSavingsToCheckingTransferTransactions()
	{
		java.util.ArrayList<Transaction> results = new java.util.ArrayList<>();
		for( Transaction t : successfulTransactions )
		{
			if( t.type() == TransactionType.TRANSFER_TO_CHECKING )
			{
				results.add(t);
			}
		}
		return results;
	}
	
	public java.util.ArrayList<Transaction> getCheckingToSavingsTransferTransactions()
	{
		java.util.ArrayList<Transaction> results = new java.util.ArrayList<>();
		for( Transaction t : successfulTransactions )
		{
			if( t.type() == TransactionType.TRANSFER_TO_SAVINGS )
			{
				results.add(t);
			}
		}
		return results;
	}
	
	public java.util.ArrayList<Transaction> getFailedTransactions(java.util.Date startDate, java.util.Date endDate)
	{
		java.util.ArrayList<Transaction> ft = new ArrayList<Transaction>();
		for(Transaction i : failedTransactions)
		{
			if(startDate.compareTo(i.date()) <= 0 && endDate.compareTo(i.date() ) >= 0)
			{
				ft.add(i);
			}
		}
		
		return ft;
	}
	
	public java.util.ArrayList<Transaction> getSuccessfulTransactions(java.util.Date startDate, java.util.Date endDate)
	{
		java.util.ArrayList<Transaction> st = new ArrayList<Transaction>();
		for(Transaction i : successfulTransactions)
		{
			if(startDate.compareTo(i.date()) <= 0 && endDate.compareTo(i.date() ) >= 0)
			{
				st.add(i);
			}
		}
		
		return st;
	}
}
