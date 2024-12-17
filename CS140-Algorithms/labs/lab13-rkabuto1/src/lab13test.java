import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class lab13test 
{
	lab13 lab;
	Integer[] expectedResult1;
	Integer[] expectedResult2;
	Integer[] expectedResult3;
	String inputFilename = "/home/rkabuto1/cs140/labs/lab13-rkabuto1/data/lab13_input_data.txt"; //Input filename for the raw data
	String expectedResultsFilename = "/home/rkabuto1/cs140/labs/lab13-rkabuto1/data/lab13_expected_results.txt"; //Filename which holds expected results.

	@BeforeEach
	public void setUp() throws Exception 
	{
		// instantiate an instance of lab13
		lab = new lab13();
		
		// read the input value and populate the ArrayList<Integer> in the lab13 class
		lab.readData(inputFilename);
		
		// testData.get(0) has the expected results for getResult1()
		// testData.get(1) has the expected results for getResult2()
		// testData.get(2) has the expected results for getResult3()
		ArrayList<ArrayList<Integer>> testData = new ArrayList<>();
		for( int i = 0; i < 3; i++ )
		{
			testData.add(new ArrayList<Integer>());
		}
		
		try
		{
			System.out.println("reading " + expectedResultsFilename);
			java.io.BufferedReader input = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(expectedResultsFilename)));
			for( int i = 0; i < testData.size(); i++ )
			{
				ArrayList<Integer> currentTestData = testData.get(i); 
				String inn;
				input.readLine();
				while( (inn = input.readLine()) != null )
				{
					if( inn.length() > 0 )
					{
						currentTestData.add(Integer.valueOf(inn));
					}
					else
					{
						break;
					}
				}
				testData.set(i, currentTestData);
				System.out.println("testData.get(" + i + ").size() = " + testData.get(i).size());
			}
			input.close();
			
			// put code here to populate expectedResult1 with the values in testData.get(0)
			// so that you can use "assertArrayEquals" to verify expectedResult1 and lab.getResult1() are the same
			expectedResult1 = new Integer[testData.get(0).size()];
			ArrayList<Integer> currentTestData= testData.get(0);
			for ( int i =0; i < currentTestData.size();i++)
			{
				expectedResult1[i] = currentTestData.get(i);
			}
			
			
			// put code here to populate expectedResult2 with the values in testData.get(1)
			// so that you can use "assertArrayEquals" to verify expectedResult2 and lab.getResult2() are the same
			expectedResult2 = new Integer[testData.get(1).size()];
			currentTestData = testData.get(1);
			for (int i =0; i < currentTestData.size(); i++)
			{
				expectedResult2[i] = currentTestData.get(i);
			}
			
			// put code here to populate expectedResult3 with the values in testData.get(2)
			// so that you can use "assertArrayEquals" to verify expectedResult3 and lab.getResult3() are the same
			expectedResult3 = new Integer[testData.get(2).size()];
			currentTestData = testData.get(2);
			for (int i =0; i < currentTestData.size(); i++)
			{
				expectedResult3[i] = currentTestData.get(i);
			}
			
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			System.exit(0);
		}
		
		
		
		
	}
	
	@Test
	void testgetTotalCount()
	{
		assertEquals(1000, lab.getTotalCount());
	}
	@Test
	void testgetOddCount()
	{
		assertEquals(507, lab.getOddCount());
	}
	@Test
	void testgetEvenCount()
	{
		assertEquals(493, lab.getEvenCount());
	}
	@Test
	void testgetDistinctGreaterThanFiveCount()
	{
		assertEquals(94, lab.getDistinctGreaterThanFiveCount());
	}
	@Test
	void testgetgetresult1()
	{
		assertArrayEquals(expectedResult1, lab.getresult1());
	}
	@Test
	void testgetgetresult2()
	{
		assertArrayEquals(expectedResult2, lab.getresult2());

	}
	@Test
	void testgetgetresult3()
	{
		assertArrayEquals(expectedResult3, lab.getresult3());

	}
	
}



