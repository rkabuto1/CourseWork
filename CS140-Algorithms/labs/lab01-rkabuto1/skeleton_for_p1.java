class skeleton_for_p1
{
	public static void main(String[] args)
	{
		// check if there are any commandline arguements, and if none output a message and exit
		
		// create the DecimalFormat here
		
		// try/catch block to catch any exceptions related to the BufferedReader
		try
		{
			// put your code here to open the BufferedReader

			// loop to read the input file
			while(  )
			{
				// create the StringTokenizer
				// loop over the tokens of the StringTokenizer
				while(  )
				{
					// try/catch block for checking if the current token is an integer
					try
					{
						// convert the current token into an int
						// increment int counter and int sum
					}
					catch(Exception e)
					{
						// you shouldn't need anything here
						// if the current token is not an int, the Integer.parseInt() statement will
						// throw an exception and come here
					}
					// loop over the commandline arguments with indices 1, 2, 3, ... , args.length-1
					// and compare each to the current token using s1.equalsIgnoreCase(s2) as 
					// mentioned in the lab description
				}
			}
			// close the BufferedReader
			// output the results
		}
		catch(Exception e)
		{
			// output the exception if there is one and exit
			System.out.println(e.toString());
			System.exit(0);
		}
	}
}

