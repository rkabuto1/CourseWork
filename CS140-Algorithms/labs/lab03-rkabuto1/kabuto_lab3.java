class kabuto_lab3
{
    public static void main(String[] args)
    {
        if( args.length < 2 ) // check the number of commandline arguments
        {
            System.out.println("format: lab3 \"input filename\" \"output filename\" \"<output unique sorted words>\"");
            System.exit(0);
        }

	//allocate the decimal format. df format given in the lab.
        java.text.DecimalFormat df = new java.text.DecimalFormat("###,###,###,###,###"); 
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
        int numberoflines = 0;        
        int numberofwords = 0;    
        int numberofchar = 0;

        // try block for all of the work
        try
        {
            // instantiate the BufferedReader for the input file (args[0] is the input filename)
            // instantiate the PrintWriter for the output file (args[1] is the output filename)
            // instantiate the TreeSet of type String for the list of unique words
            // instantiate the TreeSet of type String for the list of unique words
            // instantiate the ArrayDeque of type String to use to reverse the words of a line of input
            java.io.BufferedReader input = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(args[0])));            
            java.io.PrintWriter out = new java.io.PrintWriter(new java.io.BufferedWriter(new java.io.FileWriter(args[1])));            
            java.util.TreeSet<String> uniqueStr = new java.util.TreeSet<>(); 
            java.util.ArrayDeque<String> CurrentStr = new java.util.ArrayDeque<>();

            // declare a String for the current line from the input file
            // while loop to read the input file a line at a time using BufferedReader.readLine()
            String line;
            while((line = input.readLine())!=null  )
            {
                
                numberoflines++;// increment the line count      
                // create a StringTokenizer for the current line using a blank space delimitter         
                java.util.StringTokenizer st = new java.util.StringTokenizer(line, " ");

                // while loop over the tokens of the StringTokenizer
                while(st.hasMoreTokens()  )
                {
                    
                    String token = st.nextToken();// get the current token (or words)                   
                    numberofwords++; // increment the word count
                    numberofchar = numberofchar + token.length(); // increment the character count based on the length of the current token
                    // add the current token to the ArrayDeque using ArrayDeque.addLast() (adds to top of stack)
                    CurrentStr.addLast(token);
                    // add the current token to the TreeSet
                    if(! uniqueStr.contains(token)){
                        uniqueStr.add(token);}

                }


                // while loop over the elements of the ArrayDeque, containing the words of the current line of input
                while(!CurrentStr.isEmpty())
                {
                    // use ArrayDeque.removeLast() to get the element from the top of the stack
                    // get a char[] of the characters of the current word using String.toCharArray()
                     /* use a for loop, to output the elements of the char[] in reverse order */
                    String element = CurrentStr.removeLast();               
                    char[] characters = element.toCharArray();                 
                    for(int i =(characters.length-1); i >= 0; i--) // -1 because it has to be exclusive
                    {
                        out.print(characters[i]); //  the current symbol using PrintWriter.print(char)
                    }

                    // if the ArrayDeque is not empty, print a blank space after the current word to the output file
                    if(!CurrentStr.isEmpty()  )
                    {
                        out.print(" ");
                    }
                }
                // output an end of line character to the end of the current line of output to the output file
                out.println();

            }

            // close the BufferedReader and PrintWriter
            input.close();
            out.close();

            // output the number of lines using the DecimalFormat
            // output the number of words using the DecimalFormat
            // output the number of characters using the DecimalFormat
            // output the number of unique words, size of the TreeSet, using the DecimalFormat           
            System.out.println("lines = " + df.format(numberoflines));           
            System.out.println("words = " + df.format(numberofwords));            
            System.out.println("character in words = " + df.format(numberofchar));
            System.out.println("unique words = " + uniqueStr.size());
            System.out.println("ordered unique words");


            // output the unique list of words to the screen, if requested, using an
            // enhanced for loop over the elements of the TreeSet        
            if(outputWords)
            {

                for(String w: uniqueStr)
                {
                    System.out.println(w);
                    
                }
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


