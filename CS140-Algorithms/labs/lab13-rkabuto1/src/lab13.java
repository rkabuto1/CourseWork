import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Scanner;
import java.io.InputStreamReader;
import java.io.FileInputStream;

public class lab13 {
	
	private ArrayList<Integer> intarray = new ArrayList<Integer>();
	
	public void readData(String filename)
	{
		try
		{
			BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(filename)));
			
			String inn;
			
			while((inn = input.readLine()) != null)
			{
				intarray.add(Integer.valueOf(inn.trim()));
			}
		
			input.close();
		}
		
		catch(Exception e)
		{
			
		}
		
		
	}
	
	public long getTotalCount()
	{
		return intarray.stream().count();
		
	}
	public long getOddCount()
	{
		return intarray.stream().filter(n -> n % 2 != 0).count();
	}
	
	
	public long getEvenCount()
	{
		return intarray.stream().filter(n -> n % 2 == 0).count();
	}
	
	public long getDistinctGreaterThanFiveCount()
	{
		return intarray.stream().distinct().filter(n-> n > 5).count();
	}
	
	public Integer[] getresult1()
	{
		return intarray.stream().filter(n -> n % 2 == 0).filter(n -> n > 5).filter(n -> n < 50).sorted().toArray(Integer[] :: new);
	}
	
	public Integer[] getresult2()
	{
		return intarray.stream().limit(50).map(n -> n * n * 3).toArray(Integer[] :: new);
	}
	
	public Integer[] getresult3()
	{
		return intarray.stream().filter(n -> n % 2 != 0).map(n -> n * 2).sorted().skip(20).distinct().toArray(Integer[] :: new);
	}
	
	
	
	
	

}

