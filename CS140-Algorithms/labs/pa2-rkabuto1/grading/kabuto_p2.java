class kabuto_p2
{
    public static void main(String[] args)
    {
    	//If command Line arugments do not equal three, stop. This is from lab 2
        if (args.length != 3)
        {
            System.out.println("There needs to be 3 command line arguments exactly.");
            System.exit(0);
        }

        if( args[0].startsWith("b") )
        {
            convertBinaryToText(args[1], args[2]);
        }

        if( args[0].startsWith("t") )
        {
            convertTextToBinary(args[1], args[2]);
        }

        else
        {
            System.out.println("If that is the case, first argument should start with the letter b or t.");
            System.exit(0);
        }
        //End of Command Line arguments 
    }

    private static void convertBinaryToText(String inputFilename, String outputFilename)
    {
        System.out.println("convertBinaryToText");
        try
        {	
            //Buffered Reader From lab 
            java.io.FileInputStream input1 = new java.io.FileInputStream(inputFilename);
            java.io.BufferedInputStream input = new java.io.BufferedInputStream(input1);

            java.io.FileWriter output1 = new java.io.FileWriter(outputFilename);
            java.io.PrintWriter output = new java.io.PrintWriter(new java.io.BufferedWriter(output1));

            byte[] buffer = new byte[16];
            java.nio.ByteBuffer mybuffer = java.nio.ByteBuffer.wrap(buffer);
            //End of Buffered Reader From lab 

	    int z = mybuffer.getInt(0);
            int x = input.read(buffer,0,4);
            System.out.println("Number of lines:" + z);


            for(int i=0; i < z; i++)
            {
                x = input.read(buffer, 0,2);
                char type = mybuffer.getChar(0);
                switch (type)
                {
		//case switches
                    case 'i': //i for int
                        x = input.read(buffer, 0,4);
                        int valueInt = mybuffer.getInt(0);
                        output.println("int\t" + valueInt);
                        break;
                    case 'l': //l for Long
                        x = input.read(buffer, 0,8);
                        long valueLong = mybuffer.getLong(0);
                        output.println("long\t" + valueLong);
                        break;
                    case 'h'://h for short 
                        x = input.read(buffer, 0,2);
                        short valueShort = mybuffer.getShort(0);
                        output.println("short\t" + valueShort);
                        break;
                    case 'd'://d for double
                        x = input.read(buffer, 0,8);
                        double valueDouble = mybuffer.getDouble(0);
                        output.println("double\t" + valueDouble);
                        break;
                    case 'f'://f for float
                        x = input.read(buffer, 0,4);
                        float valueFloat = mybuffer.getFloat(0);
                        output.println("float\t" + valueFloat);
                        break;
                    case 'a'://a for array
                        x = input.read(buffer, 0,4);
                        int arraySize1 = mybuffer.getInt(0);
                        System.out.println("Size of integer array:" + arraySize1);
                        output.print("Integer array\t");

                        for(int k = 0; k < arraySize1; k++)
                        {
                            x = input.read(buffer, 0,4);
                            int value_Int = mybuffer.getInt(0);
                            if(k != 0)
                            {
                                output.print(",");
                            }
                            output.print(value_Int);
                        }

                        output.println();
                        break;
                    case 'e':
                        x = input.read(buffer, 0,4);
                        int s2 = mybuffer.getInt(0);
                        System.out.println("Size of integer array:" + s2);
                        output.print("Double array\t");

                        for(int k = 0; k < s2; k++)
                        {
                            x = input.read(buffer, 0,8);
                            double value_Double = mybuffer.getDouble(0);
                            if(k != 0)
                            {
                                output.print(",");
                            }
                            output.print(value_Double);
                        }
                        output.println();
                        break;
                    case 's':
                        x = input.read(buffer, 0,4);
                        int s3 = mybuffer.getInt(0);
                        System.out.println("Size of integer array:" + s3);

                        char[] charArray = new char[s3];

                        for(int k = 0; k < s3; k++)
                        {
                            x = input.read(buffer, 0,2);
                            charArray[k] = mybuffer.getChar(0);
                        }

                        String str = new String(charArray);
                        output.println("String\t"+str);
                        break;

                }
            }

            output.close();
            input.close();
        }

        catch(Exception e)
        {
            System.out.println(e.toString());
            System.exit(0);
        }
    }

    private static void convertTextToBinary(String inputFilename, String outputFilename)
    {
        System.out.println("convertTextToBinary");
        try
        {
            //Buffered Reader From Lab
            java.io.BufferedReader input = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(inputFilename)));
            java.io.DataOutputStream output = new java.io.DataOutputStream(new java.io.FileOutputStream(outputFilename));

            String mylines;
            java.util.ArrayList<String> inputmylines = new java.util.ArrayList<>();
            //End Buffered Reader From Lab

            while((mylines = input.readLine()) != null)
            {
                if(! mylines.startsWith("#"))
                {
                    inputmylines.add(mylines);
                }
            }
            int s = inputmylines.size();
            System.out.println("The Input size is: " + s);
            output.writeInt(s);

            for(int i=0; i< s; i++)
            {
                inputmylines.get(i);
                String inn = inputmylines.get(i);
                java.util.StringTokenizer st = new java.util.StringTokenizer(inn,"\t");
                String type = st.nextToken();
                String value = st.nextToken();
                switch (type) 
                {
		//case switches
                    case "int": 
                        output.writeChar('i');
                        int p1 = Integer.parseInt(value);
                        output.writeInt(p1);
                        break;                    
                    case "double":
                        output.writeChar('d');
                        double p4 = Double.parseDouble(value);
                        output.writeDouble(p4);
                        break;
                    case "short":
                        output.writeChar('s');
                        short p3 = Short.parseShort(value);
                        output.writeShort(p3);
                        break;    
                    case "long":
                        output.writeChar('l');
                        long p2 = Long.parseLong(value);
                        output.writeLong(p2);
                        break;                
                    case "float":
                        output.writeFloat('f');
                        float p5 = Float.parseFloat(value);
                        output.writeFloat(p5);
                        break;
                    case "int array":
                        output.writeChar('a');
                        java.util.StringTokenizer intst = new java.util.StringTokenizer(value,",");
                        System.out.println("int arraycount tokens: "+ intst.countTokens());
                        output.writeInt(intst.countTokens());

                        while(intst.hasMoreTokens())
                        {
                            output.writeInt(Integer.parseInt(intst.nextToken()));
                        }
                        break;
                    case "double array":
                        output.writeChar('e');
                        java.util.StringTokenizer doublest = new java.util.StringTokenizer(value,",");
                        System.out.println("double arraycount tokens: "+ doublest.countTokens());
                        output.writeDouble(doublest.countTokens());

                        while(doublest.hasMoreTokens())
                        {
                            output.writeDouble(Double.parseDouble(doublest.nextToken()));
                        }
                        break;
                    case "string":
                        output.writeChar('s');
                        System.out.println("string arraycount tokens: "+ value.length());
                        output.writeInt(value.length());
                        char[] arrchar = value.toCharArray();
                        for(int j=0; j < arrchar.length ;j++)
                        {
                            output.writeChar(arrchar[j]);
                        }
                        break;
                }

            }

            output.close();
            input.close();
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
            System.exit(0);
        }
    }
}


