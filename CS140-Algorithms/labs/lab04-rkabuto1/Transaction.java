record Transaction(TransactionType type, java.util.Date date, double amount)
{	
	public String toString()
	{
		return type.name() + " " + date.toString() + " " + amount;
	}
}
