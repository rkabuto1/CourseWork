class Transaction
{
	final private TransactionType type;
	final private java.util.Date date;
	final private double amount;
	
	Transaction(TransactionType type, java.util.Date date, double amount)
	{
		this.type = type;
		this.date = date;
		this.amount = amount;
	}
	
	public java.util.Date date()
	{
		return date;
	}
	
	public double amount()
	{
		return amount;
	}
	
	public TransactionType type()
	{
		return type;
	}
	
	public String toString()
	{
		return type.name() + " " + date.toString() + " " + amount;
	}
}
