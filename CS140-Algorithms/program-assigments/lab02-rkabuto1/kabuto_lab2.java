import java.io.*;
import java.util.ArrayList;

public class kabuto_lab2 
{
    public static void main(String[] args) 
    {
        if (args.length != 3) 
        {
            System.err.println("No command Line arguments, please put --> kabuto_lab2 <t or b> <input file> <output file>");
            System.exit(1);
        }
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
            System.err.println("Error: first argument must start with 'b' or 't'");
            System.exit(1);
        }
    }
    
    public static void convertTextToBinary(String inputFilename, String outputFilename) 
    {
        ArrayList<String> inputLines = new ArrayList<>(0);
        try (BufferedReader input = new BufferedReader(new FileReader(inputFilename));
             DataOutputStream output = new DataOutputStream(new FileOutputStream(outputFilename))) 
        {
            String line;
            while ((line = input.readLine()) != null) 
            {
                inputLines.add(line);
                output.write(line.getBytes());
                output.write(System.lineSeparator().getBytes());
            }
        } catch (IOException e) 
            {
            System.err.println("Error: " + e.getMessage());
            System.exit(1);
            }
    }
    
    public static void convertBinaryToText(String inputFilename, String outputFilename) 
    {
        try (DataInputStream input = new DataInputStream(new FileInputStream(inputFilename));
             PrintWriter output = new PrintWriter(new FileWriter(outputFilename))) 
        {
             byte[] b = new byte[1];
             while (input.read(b) != -1) 
            {
                String s = new String(b);
                output.print(s);
            }
        } catch (IOException e) 
           {
            System.err.println("Error: " + e.getMessage());
            System.exit(1);
           }
    }
}
