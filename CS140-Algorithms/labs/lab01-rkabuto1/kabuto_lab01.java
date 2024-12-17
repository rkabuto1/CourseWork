import java.io.*;
import java.util.*;

class kabuto_lab01
{
	public static void main(String[] args)
	{
		if(args.length < 1)
		{
			System.out.println("There are no command line arguemnts");
			return;
		}
		
		int lineCount = 0;
		int totalTokens = 0;
		int intCount = 0;
		long sum = 0;
		int array[] = new int[args.length-1];
		
		for(int i = 0; i < array.length; i++){
			array[i] = 0;
		}

	
		String fileName = "sample_file_1.txt";
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###,###,###,###");
		
		
		try
		{
			BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(args[0])));
			String line;
			while((line = input.readLine()) != null)
			{	
					
				StringTokenizer st = new StringTokenizer(line);
				lineCount++;
				
				
				
				while(st.hasMoreTokens())
				{
					String s = st.nextToken();
					totalTokens++;

					for(int i = 1; i < args.length; i++){
						if(args[i].equalsIgnoreCase(s)){
							array[i-1] += 1;
						}
					}			
					try
					{
						int v = Integer.parseInt(s);
					
						intCount++;
						sum = sum + v;
					}
					catch(Exception e)
					{
					
					}
					
					
					}
				}
			}
			catch(Exception e)
			{
			
			System.out.println(e.toString());
			System.exit(0);
			}
						
			System.out.println("lineCount = " + df.format(lineCount));
            		System.out.println("tokenCount = " + df.format(totalTokens));
            		System.out.println("intCount = " + df.format(intCount));
            		System.out.println("sum = " + df.format(sum));
            		
            		for(int i = 1; i < args.length; i++){
            			System.out.println(args[i] + " count = " + array[i-1]);
            		} 

           
	}

}


