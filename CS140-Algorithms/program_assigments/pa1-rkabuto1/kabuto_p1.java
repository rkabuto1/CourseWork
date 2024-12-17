import java.util.*;

class kabuto_p1
{ 
    public kabuto_p1()
    {
    
    }
  
    public static String[] selectionSort(String[] values, int lowerBound, int upperBound) 
    {
        Arrays.sort(values, lowerBound, upperBound + 1, (lower, upper)-> // add one because it has to be exclusive
                    {
                        if (lower.length() != upper.length()) 
                        {
                            return lower.length() - upper.length();
                        }
                        return lower.compareTo(upper);
                    }
                    );
        return values;
    }

    public static int forLoopTest(int[] values, int lowerBound, int upperBound, int testValue) 
    {
        int x = 0;
        for (int i = lowerBound; i <= upperBound; i++) 
        {
            if (values[i] > testValue) 
            {
                x++;
            }
        }
        return x;
    }

    public static int whileLoopTest(int[] values, int lowerBound, int upperBound, int testValue) 
    {       
        int lowerint = lowerBound;//the counter 
        int whiletest = 0;// set this as an integer
        while (lowerint < upperBound) 
        {
            if (values[lowerint] <= testValue) 
            {
                whiletest++;
            }
            lowerint++;
        }
        return whiletest;
    }

    public static int doWhileLoopTest(int[] values, int lowerBound, int upperBound, int testValue1, int testValue2) 
    {
        int c = 0; //the counter 
        int dowhiletest = lowerBound; // set this as an integer
        do 
        {
            int m = values[dowhiletest];
            if (m > Math.min(testValue1, testValue2) && m < Math.max(testValue1, testValue2))            
            {
                c++;
            }
            dowhiletest++;
        } 
        while (dowhiletest <= upperBound);
        return c;
    }

    public static int[] switchTest(int[] values, int lowerBound, int upperBound) 
    {
      int arrays[] = new int[11];
		 for(int i = 0; i<arrays.length; i++)
		 {
		 arrays[i] = 0;
		 }
		 
		 for(int z = lowerBound+1; z < upperBound; z++) //add one to lowerbound beacuse it has to be exclusive
		 	{
		 	switch (values[z])
		 		{
		 		case(0):
		 		  int case0 = arrays[0];
		 		  arrays[0]++;
		 		  break;
		 		case(3)://odd number so dont break
		 		  int case1 = arrays[1];
		 		  arrays[1] = case1+1;		 		  
		 		case(6):
		 		  int case2 = arrays[2];
		 		  arrays[2] = case2+1;
		 		  break;
		 		case(9)://odd number so dont break
		 		  int case3 = arrays[3];
		 		  arrays[3] = case3+1;		 		  
		 		case(12):
		 		  int case4 = arrays[4];
		 		  arrays[4] = case4+1;
		 		  break;
		 		case(15)://odd number so dont break
		 		  int case5 = arrays[5];
		 		  arrays[5] = case5+1;		 		    
		 		case(18):
		 		  int case6 = arrays[6];
		 		  arrays[6] = case6+1;
		 		  break;
		 		case(21)://odd number so dont break
		 		  int case7 = arrays[7];
		 		  arrays[7] = case7+1;		 		  
		 		case(24):
		 		  int case8 = arrays[8];
		 		  arrays[8] = case8+1;
		 		  break;
		 		case(27): //odd number so dont break
		 		  int case9 = arrays[9];
		 		  arrays[9] = case9+1;		 		  
		 		default:
		 	          int case10 = arrays[10];
		 	          arrays[10] = case10+1;
		 	          break;
		 	        }
			}
			return arrays; 


    }
    
}


