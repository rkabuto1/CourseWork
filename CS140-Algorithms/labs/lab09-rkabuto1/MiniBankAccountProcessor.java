// the class extends Thread, so we can have multiple copies of the class executing
// at the same time
class MiniBankAccountProcessor extends Thread
{
	// since the type of miniBankAccount is MiniBankAccountFunctions, any class that implements
	// MiniBankAccountFunctions can be assigned to miniBankAccount
	// so miniBankAccount can be assined an object of type
	// MiniBankAccount or MiniBankAccountSync or MiniBankAccountSemaphore
	private final MiniBankAccountFunctions miniBankAccount;

	// the list of transactions that miniBankAccount will process
	private final java.util.ArrayList<Transaction> transactionsToPerform;

	// constructor for MiniBankAccountProcessor
	MiniBankAccountProcessor(MiniBankAccountFunctions mba, java.util.ArrayList<Transaction> transactionsToPerform)
	{
		this.miniBankAccount = mba;
		this.transactionsToPerform = transactionsToPerform;
	}

	// the method that needs to be implemented for any class extending Thread
	public void run()
	{
		// loop over all of the transactions with an enhanced for loop
		for( Transaction currentTransaction : transactionsToPerform )
		{
			// get the type of the current transaction
			String type = currentTransaction.type();

			// get the amount of the current transaction
			double amount = currentTransaction.amount();

			// process the current transaction
			switch( type )
			{
				case "depositSavings":
					// add code to call the appropriate method of miniBankAccount
					miniBankAccount.depositToSavings(amount);
					break;
				case "depositChecking":
					// add code to call the appropriate method of miniBankAccount
					miniBankAccount.depositToChecking(amount);
					break;
				case "withdrawSavings":
					// add code to call the appropriate method of miniBankAccount
					miniBankAccount.withdrawFromSavings(amount);
					break;
				case "withdrawChecking":
					// add code to call the appropriate method of miniBankAccount
					miniBankAccount.withdrawFromChecking(amount);
					break;
				case "transferToChecking":
					// add code to call the appropriate method of miniBankAccount
					miniBankAccount.transferFromSavingsToChecking(amount);
					break;
				case "transferToSavings":
					// add code to call the appropriate method of miniBankAccount
					miniBankAccount.transferFromCheckingToSavings(amount);
					break;
			}
		}
	}
}

