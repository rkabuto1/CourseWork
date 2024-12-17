class checkresults
{
	//Note there are 18 test cases in all.
	//Here, we set up storage for all the different 
	//files associated with each test case.
	public static final int NUM_TEST_CASES = 18;

	static String[] 	solutionFilenames 	= new String[NUM_TEST_CASES]; //test input files
	static String[] 	checkFilenames 		= new String[NUM_TEST_CASES]; //student output files
	static double[] 	results 			= new double[NUM_TEST_CASES]; //scores, 0.0 to 1.0

	//Establish the pathing for solution files (which reside in test_input_files).
	public static final String SOLUTIONS 		= "test_input_files/";
	public static final String TXT_SOLUTIONS 	= SOLUTIONS + "txt/";
	public static final String BIN_SOLUTIONS	= SOLUTIONS + "bin/";

	//Establish the pathing for files being checked (which reside student_output_files).
	public static final String CHECKED			= "student_output_files/";
	public static final String TXT_CHECKED		= CHECKED + "b2t/";
	public static final String BIN_CHECKED		= CHECKED + "t2b/";

	/**
	 * Checks the arguments provided to the executable,
	 * and exits early if incorrectly ran.
	 */ 
	public static void checkArgs(String[] args)
	{
		if( args.length != 1 )
		{
			System.out.println("format: checkresults \"name\"");
			System.exit(0);
		}
	}

	/**
	 * Checks if the test files need to be touched up, 
	 * depending on the operating system the test code is being run on.
	 */ 
	public static boolean testFileTouchupNeeded()
	{
		boolean removeCrFromTestFiles = false;
		String osName = System.getProperty("os.name");
		System.out.println("osName = " + osName);
		
		if( osName.toLowerCase().indexOf("windows") > -1 )
		{
			removeCrFromTestFiles = true;
		}

		return removeCrFromTestFiles;
	}

	/**
	 * Sets up the first nine test cases, 
	 * involving text to binary conversions.
	 */ 
	public static void setup_t2b_test_cases_1_to_9(String studentName)
	{
			for( int i = 1; i <= 9; i++ )
			{
				String fileName 		= "0" + i + ".bin";
				String solutionFilename = BIN_SOLUTIONS + fileName;
				String checkFilename 	= BIN_CHECKED   + studentName + "_" + fileName;

				solutionFilenames[i-1] 	= solutionFilename;
				checkFilenames[i-1] 	= checkFilename;
			}
	}

	/**
	 * Sets up the last nine test cases,
	 * involving binary to text conversions.
	 */ 
	public static void setup_b2t_test_cases_10_to_18(String studentName)
	{
			for( int i = 1; i <= 9; i++ )
			{
				String fileName 		= "0" + i + ".txt";
				String solutionFilename = TXT_SOLUTIONS + fileName;
				String checkFilename 	= TXT_CHECKED 	+ studentName + "_" + fileName;

				solutionFilenames[8+i] 	= solutionFilename;
				checkFilenames[8+i] 	= checkFilename;
			}
	}

	/**
	 * Helper to read a solution file and return a byte[] 
	 * representing the held data.
	 */ 
	public static byte[] read_solution_file(int idx) 
		throws java.io.FileNotFoundException, java.io.IOException 
	{
		java.io.BufferedInputStream inputSolution 
			= new java.io.BufferedInputStream(new java.io.FileInputStream(solutionFilenames[idx]));

		return inputSolution.readAllBytes();
	}

	/**
	 * Helper to read a student file and return a byte[]
	 * representing the held data.
	 */ 
	public static byte[] read_student_file(int idx) 
		throws java.io.FileNotFoundException, java.io.IOException
	{
		java.io.BufferedInputStream inputCheck 
			= new java.io.BufferedInputStream(new java.io.FileInputStream(checkFilenames[idx]));

		return inputCheck.readAllBytes();
	}

	/**
	 * Helper to touchup a byte[] representing a text file.
	 */ 
	public static void touchup_txt_byte_representation(byte[] check, boolean text_touchup_required)
	{
		// if this is a text file, check to see if there a carriage return symbols
		// that need to be removed
		if( text_touchup_required )
		{
			int crCount = 0;

			for( int j = 0; j < check.length-1; j++ )
			{
				if( (check[j] == '\r') && (check[j+1] == '\n') )
				{
					crCount = crCount+1;
				}
			}
			
			// if there are cr symbols, get rid of them
			if( crCount > 0 )
			{
				// make a copy of check[]
				byte[] oldCheck = new byte[check.length];

				for( int j = 0; j < check.length; j++ )
				{
					oldCheck[j] = check[j];
				}
				
				// reallocate check[]
				check = new byte[oldCheck.length-crCount];
				
				// copy the non-cr symbols 
				int k = 0;

				for( int j = 0; j < oldCheck.length-1; j++ )
				{
					if( !((oldCheck[j] == '\r') && (oldCheck[j+1] == '\n')) )
					{
						check[k] = oldCheck[j];
						k = k+1;
					}
				}

				check[check.length-1] = oldCheck[oldCheck.length-1];
			}
		}
	}

	/**
	 * Helper to perform the scoring for each test case
	 */ 
	public static void calculate_test_score(byte[] solution, byte[] check, int idx)
	{
		//Determines how many points are lost on a mismatch.
		double pointsPerByte = 1.0 / 10.0;

		//Determine the limit we are using to compare the two byte[],
		//one byte at a time. In a perfect world, they should have equal length.
		int limit = Math.max(solution.length, check.length);
				
		double result1 = 0.0;
		double result2 = 0.0;

		//First comparison
		for( int j = 0; j < limit; j++ )
		{
			try
			{
				if( solution[j] != check[j] )
				{
					result1 = result1+pointsPerByte;
				}
			}
			catch(ArrayIndexOutOfBoundsException e)
			{
				result1 = result1+pointsPerByte;
			}
		}

		
		//Second comparison, we try to account for an off by one error.
		for( int j = 0; j < limit; j++ )
		{
			try
			{
				if( solution[j] != check[j+1] )
				{
					result2 = result2+pointsPerByte;
				}
			}
			catch(ArrayIndexOutOfBoundsException e)
			{
				result2 = result2+pointsPerByte;
			}
		}

		//Ensure we take off at most 1.0 for a given test case.
		result1 	= Math.min(1.0, result1);
		result2 	= Math.min(1.0, result2);

		//Use whichever result will maximize credit for the given test case.
		//Ie, whichever is closer to 0.0
		results[idx] = Math.min(result1, result2);
	}

	/**
	 * Helper to print out the results, 
	 * which ultimately determines the grading.
	 */ 
	public static void printResults(String studentName)
	{
		System.err.print(studentName);

		for( int i = 0; i < results.length; i++ )
		{
			System.err.print("\t" + results[i]);
		}

		System.err.println();
	}

	public static void main(String[] args)
	{
		checkArgs(args);
		
		boolean removeCrFromTestFiles 	= testFileTouchupNeeded();
		String 	studentName 			= args[0];
		
		//setup the files that will be checked
		setup_t2b_test_cases_1_to_9(studentName);
		setup_b2t_test_cases_10_to_18(studentName);

		try
		{
			for( int i = 0; i < solutionFilenames.length; i++ )
			{
				try
				{
					System.out.println("comparing " + solutionFilenames[i] + " " + checkFilenames[i]);
					byte[] solution = read_solution_file(i);					
					byte[] check 	= read_student_file(i);
					
					//Only the last 9 test cases involve text files.
					//We only touchup the text byte[] representations 
					//if removeCrFromTestFiles is true.
					boolean text_touchup_required = removeCrFromTestFiles && (i >= 9 );

					//Touchup txt byte array representation if needed.
					touchup_txt_byte_representation(check, text_touchup_required);	

					//Calculate the test core for the current test case being considered.
					calculate_test_score(solution, check, i);
				}
				catch(java.io.FileNotFoundException e)
				{	
					results[i] = 1.0;
				}
			}
			
			//print the results
			printResults(studentName);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			System.exit(0);
		}
	}
}
