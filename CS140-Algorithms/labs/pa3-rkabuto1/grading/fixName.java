class fixName
{
	public static void main(String[] args)
	{
		try
		{
			String oldName = " BankAccount";
			String oldNameA = "\tBankAccount";
			String oldName2 = " EnhancedBankAccount";
			String oldName2A = "\tEnhancedBankAccount";
			int index = args[0].indexOf("_");
			if( index < 0 )
			{
				System.out.println("unable to find _, quitting");
				System.exit(0);
				
			}
			String newName = " "+args[0].substring(0, index)+"_"+oldName.substring(1);
			String newNameA = "\t"+args[0].substring(0, index)+"_"+oldName.substring(1);
			String newName2 = " "+args[0].substring(0, index)+"_"+oldName2.substring(1);
			String newName2A = "\t"+args[0].substring(0, index)+"_"+oldName2.substring(1);
			//String newName = " " + args[0].substring(0, args[0].length()-5);
			//String newName2 = " " + args[1].substring(0, args[1].length()-5);
			//System.out.println("replacing " + "\"" + oldName + "\" with \"" + newName + "\"");
			
			
			java.io.BufferedReader input = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(args[0])));
			String inn;
			java.util.ArrayList<String> lines = new java.util.ArrayList<>();
			while( (inn = input.readLine()) != null )
			{
				if( inn.indexOf(oldName) >= 0 )
				{
					if( true )
					{
						System.out.print("replacing " + inn + " with ");
						inn = inn.replace(oldName, newName);
						System.out.println(inn);
					}
				}
				
				if( inn.indexOf(oldNameA) >= 0 )
				{
					if( true )
					{
						System.out.print("replacing " + inn + " with ");
						inn = inn.replace(oldNameA, newNameA);
						System.out.println(inn);
					}
				}
					
				if( inn.indexOf(oldName2) >= 0 )
				{
					if( true )
					{
						System.out.print("replacing " + inn + " with ");
						inn = inn.replace(oldName2, newName2);
						System.out.println(inn);
					}
				}
				
				if( inn.indexOf(oldName2A) >= 0 )
				{
					if( true )
					{
						System.out.print("replacing " + inn + " with ");
						inn = inn.replace(oldName2A, newName2A);
						System.out.println(inn);
					}
				}
				lines.add(inn);
			}
			input.close();
			
			if( true )
			{
				java.io.PrintWriter output = new java.io.PrintWriter(new java.io.BufferedWriter(new java.io.FileWriter(args[0])));
				for( String currentLine : lines )
				{
					output.println(currentLine);
				}
				output.close();
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			System.exit(0);
		}
	}
}
