class skeleton_lab3
{
	public static void main(String[] args)
	{
		// check the number of commandline arguments
		if( args.length < 2 )
		{
			System.out.println("format: lab3 \"input filename\" \"output filename\" \"<output unique sorted words>\"");
			System.exit(0);
		}
		
		// allocate the DecimalFormat 
		
		// define a boolean variable that specifies if the list of unique words needs to be printed to the screen
		boolean outputWords = false;
		if( args.length > 2 )
		{
			if( args[2].toLowerCase().startsWith("y") || args[2].toLowerCase().startsWith("t") )
			{
				outputWords = true;
			}
		}
		
		// declare and initialize int to keep track of the number of lines
		
		// declare and initialize int to keep track of the number of words
		
		// declare and initialize int to keep track of the number of characters
		
		// try block for all of the work
		try
		{
			// instantiate the BufferedReader for the input file (args[0] is the input filename)
			
			// instantiate the PrintWriter for the output file (args[1] is the output filename)
			
			// instantiate the TreeSet of type String for the list of unique words
			
			// instantiate the ArrayDeque of type String to use to reverse the words of a line of input
			
			// declare a String for the current line from the input file
			
			// while loop to read the input file a line at a time using BufferedReader.readLine()
			while(  )
			{
				// increment the line count
				
				// create a StringTokenizer for the current line using a blank space delimitter
				
				// while loop over the tokens of the StringTokenizer
				while(  )
				{
					// get the current token (or word)
					
					// increment the word count
					
					// increment the character count based on the length of the current token (String.length())
					
					// add the current token to the ArrayDeque using ArrayDeque.addLast() (adds to top of stack)
					
					// add the current token to the TreeSet
				}
				
				// while loop over the elements of the ArrayDeque, containing the words of the current line of input
				while(  )
				{
					// use ArrayDeque.removeLast() to get the element from the top of the stack
					
					// get a char[] of the characters of the current word using String.toCharArray()
					
					// use a for loop, to output the elements of the char[] in reverse order
					for(  )
					{
						// output the current symbol using PrintWriter.print(char)
					}
					
					// if the ArrayDeque is not empty, print a blank space after the current word to the output file
					if(  )
					{
					}
				}
				// output an end of line character to the end of the current line of output to the output file
			}
			
			// close the BufferedReader and PrintWriter
			
			// output the number of lines using the DecimalFormat
			
			// output the number of words using the DecimalFormat
			
			// output the number of characters using the DecimalFormat
			
			// output the number of unique words, size of the TreeSet, using the DecimalFormat
			
			// output the unique list of words to the screen, if requested, using an 
			// enhanced for loop over the elements of the TreeSet
			if( outputWords )
			{
			}
		}
		// catch any exceptions
		catch(Exception e)
		{
			System.out.println(e.toString());
			System.exit(0);
		}
	}
}
