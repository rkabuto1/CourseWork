class lab05b
{
   public static void main (String[] args)
   {
      System.out.println("yo, I am here, and below are the commandline arguments you gave me:");
      for(int i = 0; ++i < args.length; )
      {
         System.out.println("\t arg[" + i + "] = " + args[i]);
      }
      
      for(int i = 0; i < args.length; i++)
      {
         int intValue = Integer.parseInt(args[i]);
         System.out.println("\t arg[" + i + "] as an int = " + intValue);
      }
   }
}