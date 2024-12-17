import *.java;

public class Test

{
	byte[] buffer = new byte[100];
	for(int i = 0; i < buffer.length; i++)
	{
	buffer[i] = ‘_’;
	}
	java.nio.ByteBuffer byteBuffer = java.nio.ByteBuffer.wrap(buffer);

	long[] longValues = new long[] {1, 3, 7, 9, 11, 15, 22, 23, 26, 28, 30};

	byteBuffer.putShort((short) longValues.length);
	for(int i = 0; i < longValues.length; i++)
	{
	for(int i = 0; i < buffer.length; i++)
	}
	if(buffer[i] == ‘_’
		{
			System.out.println(“i = “ + i);
			break;
		}
}

