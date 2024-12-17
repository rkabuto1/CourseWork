import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.InputStreamReader;
import java.io.FileInputStream;
import java.nio.ByteBuffer;

public class kabuto_p2
{
	public static void main(String[] args) 
	{
		if (args.length == 3) 
		{
		if (args[0].startsWith("b")) 
			{
			 convertBinaryToText(args[1], args[2]);
			} 
		else if (args[0].startsWith("t")) 
			{
			 convertTextToBinary(args[1], args[2]);
			} 
		else 
			{
			 System.out.println("Commandline argument must start with 'b' or 't'");
			}
		} 
		else 
		 {
		   System.out.println("There must be three commandline arguments");
		 }
	}

	private static void convertTextToBinary(String inputFilename, String outputFilename) 
	{
		System.out.println("convertTextToBinary");
	try 
	{
	 	BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(inputFilename)));
		java.io.BufferedOutputStream output = new java.io.BufferedOutputStream(new java.io.FileOutputStream(outputFilename));
		String inn;
		java.util.ArrayList<String> inputLines = new java.util.ArrayList<>(0);

	while ((inn = input.readLine()) != null) 
	{
	if ((inn.trim().length() > 0) && (!inn.trim().startsWith("#"))) 
		{
		 inputLines.add(inn);
		}
	}

	byte[] byteArray = new byte[4];
	ByteBuffer buffer = ByteBuffer.wrap(byteArray);
	buffer.putInt(0, inputLines.size());
	output.write(byteArray);

	  for (int i = 0; i < inputLines.size(); i++) 
	  {
		  byte[] byteArray2 = new byte[8];
		  ByteBuffer buffer2 = ByteBuffer.wrap(byteArray2);
		  String dataType = new String();
		  inn = inputLines.get(i);
		  String[] myStringArray = inn.split("\t", 2);
		  dataType = myStringArray[0].toString();

		if (dataType.equals("int")) 
		{
			buffer2.putChar(0, 'i');
			output.write(byteArray2, 0, 2);
			int intValue = Integer.parseInt(myStringArray[1]);
			buffer2.putInt(0, intValue);
			output.write(byteArray2, 0, 4);
		}
		if (dataType.equals("short")) {
			buffer2.putChar(0, 'h');
			output.write(byteArray2, 0, 2);
			short shortValue = Short.parseShort(myStringArray[1]);
			buffer2.putShort(0, shortValue);
			output.write(byteArray2, 0, 2);
		}
		if (dataType.equals("long")) {
			buffer2.putChar(0, 'l');
			output.write(byteArray2, 0, 2);
			long longValue = Long.parseLong(myStringArray[1]);
			buffer2.putLong(0, longValue);
			output.write(byteArray2, 0, 8);
		}
		if (dataType.equals("float")) 
		{
			buffer2.putChar(0, 'f');
			output.write(byteArray2, 0, 2);
			float floatValue = Float.parseFloat(myStringArray[1]);
			buffer2.putFloat(0, floatValue);
			output.write(byteArray2, 0, 4);
		}
		if (dataType.equals("double")) 
		{
			buffer2.putChar(0, 'd');
			output.write(byteArray2, 0, 2);
			double doubleValue = Double.parseDouble(myStringArray[1]);
			buffer2.putDouble(0, doubleValue);
			output.write(byteArray2, 0, 8);
		}
		if (dataType.equals("string")) 
		{
			buffer2.putChar(0, 's');
			output.write(byteArray2, 0, 2);
			char[] charArray = myStringArray[1].toCharArray();
			int charArrayLength = charArray.length;
			buffer2.putInt(0, charArrayLength);
			output.write(byteArray2, 0, 4);
			
			for (int j = 0; j < charArrayLength; j++) 
			{
			  buffer2.putChar(0, charArray[j]);
			  output.write(byteArray2, 0, 2);
			}
		}
		if (dataType.equals("long array")) 
		{
			buffer2.putChar(0, 'b');
			output.write(byteArray2, 0, 2);
			String longArray = myStringArray[1];
			String[] longArrayElements = longArray.split(",");
			int longArrayLength = longArrayElements.length;
			buffer2.putInt(0, longArrayLength);
			output.write(byteArray2, 0, 4);

			for (int j = 0; j < longArrayLength; j++) 
			{
			  buffer2.putLong(0, Long.parseLong(longArrayElements[j]));
			  output.write(byteArray2, 0, 8);
			}
		}
		if (dataType.equals("float array")) 
		{
			buffer2.putChar(0, 'g');
			output.write(byteArray2, 0, 2);
			String floatArray = myStringArray[1];
			String[] floatArrayElements = floatArray.split(",");
			int floatArrayLength = floatArrayElements.length;
			buffer2.putInt(0, floatArrayLength);
			output.write(byteArray2, 0, 4);

			for (int j = 0; j < floatArrayLength; j++) 
			{
			  buffer2.putFloat(0, Float.parseFloat(floatArrayElements[j]));
			  output.write(byteArray2, 0, 4);
			}
		}
	  }
	input.close();
	output.close();
	} 
	catch (Exception e) 
		{
		 System.out.println(e.toString());
		 System.exit(0);
		}
	}

	private static void convertBinaryToText(String inputFilename, String outputFilename) 
	{
		System.out.println("convertBinaryToText");
	try 
	{
		java.io.PrintWriter output = new java.io.PrintWriter(
		new java.io.BufferedWriter(new java.io.FileWriter(outputFilename)));
		DataInputStream input = new DataInputStream(new FileInputStream(inputFilename));
		
		int numOfBlocks = input.readInt();
		for (int j = 0; j < numOfBlocks; j++)
		{
			char type = input.readChar();
			if(type == 'i')
			{
				int number = input.readInt();
				output.print("int\t" + number);
				output.print("\n");
			}

			if(type == 'h')
			{
				short number1 = input.readShort();
				output.print("short\t" + number1);
				output.print("\n");
			}

			if(type == 'l')
			{
				long number2 = input.readLong();
				output.print("long\t" + number2);
				output.print("\n");
			}

			if (type == 'f')
			{
				float number3 = input.readFloat();
				output.print("float\t" + number3);
				output.print("\n");
			}

			if(type == 'd')
			{
				double number4 = input.readDouble();
				output.print("double\t" + number4);
				output.print("\n");
			}
			if(type =='s')
			{
				int number5 = input.readInt();
				output.print("string\t");
				for (int i = 0; i < number5; i++) 
				{
					char char1 = input.readChar();
					output.print(char1);
				}
				output.print("\n");
			}
			if (type == 'b')
			{
				int number6 = input.readInt();
				output.print("long array\t");
				for (int i = 0; i < number6; i++) 
				{
					long long1 = input.readLong();
					output.print(long1);
				if ((number6 - i) > 1) 
				   {
					output.write(",");
				   }
				}
				output.print("\n");
			}
			if (type == 'g')
			{
				int number7 = input.readInt();
				output.print("float array\t");
				for (int i = 0; i < number7; i++) 
				{
					float float1 = input.readFloat();
					output.print(float1);
				if ((number7 - i) > 1) 
				  {
					output.write(",");
				  }
				}
				output.print("\n");
			}
		}

		input.close();
		output.close();
	} 
	catch (Exception e) 
		{
			System.out.println(e.toString());
			System.exit(0);
		}
	}
}
