import java.util.*;



class kabuto_ManageCarData implements ManageCarDataFunctions
{
   private final ArrayList<CarFunctions> carList;
   private final PriorityQueue<CarFunctions> carListByTotalRange;
   private final PriorityQueue<CarFunctions> carListByRemainingRange;

   kabuto_ManageCarData()
   {
       this.carList = new ArrayList<>();
       this.carListByTotalRange = new PriorityQueue<>(new TotalRangeComparator());
       this.carListByRemainingRange = new PriorityQueue<>(new RemainingRangeComparator());
   }

   public void readData(String filename)
   {
       try
       {

       java.io.BufferedReader input = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(filename)));
       String inn;
       	while ( (inn = input.readLine()) != null)
       	{

           StringTokenizer st = new StringTokenizer(inn, "\t");
           String id = st.nextToken();
           int fuelEconomy = Integer.parseInt(st.nextToken());
           int fuelCapacity = Integer.parseInt(st.nextToken());
           double currentFuel = Double.parseDouble(st.nextToken());

           CarFunctions c = new kabuto_Car(id, fuelEconomy, fuelCapacity, currentFuel);
           carList.add(c);
           carListByTotalRange.add(c);
           carListByRemainingRange.add(c);
         }
       }
       catch (Exception e)
       {
           System.out.println("Error. There is no such file");
       }
   }

   public ArrayList<CarFunctions> getCarList()
   {
       ArrayList<CarFunctions> x = new ArrayList<>();
       for (int i = 0; i < carList.size(); i++)
       {
           x.add(carList.get(i));
       }
       return x;
   }

   public PriorityQueue<CarFunctions> getCarListByTotalRange()
   {
       PriorityQueue<CarFunctions> x = new PriorityQueue<>(new TotalRangeComparator());
       for (CarFunctions c : carList)
       {
           x.add(c);
       }
       return x;
   }

   public ArrayList<CarFunctions> getCarListByTotalRangeUsingIterator()
   {
       ArrayList<CarFunctions> x = new ArrayList<>();
       Iterator<CarFunctions> y = carListByTotalRange.iterator();
       while (y.hasNext())
       {
           x.add(y.next());
       }
       return x;
   }



   public PriorityQueue<CarFunctions> getCarListByRemainingRange()
   {
	PriorityQueue<CarFunctions> x = new PriorityQueue<>(new RemainingRangeComparator());
        for (CarFunctions c : carList)
        {
           x.add(c);
        }
        return x;
   }



   public ArrayList<CarFunctions> getCarListByRemainingRangeUsingIterator()
   {
       ArrayList<CarFunctions> x = new ArrayList<>();
       Iterator<CarFunctions> y = carListByRemainingRange.iterator();
       while (y.hasNext())
       {
           x.add(y.next());
       }
       return x;
   }



   public ArrayList<String> getCarListByTotalRangeViaPoll(double minTotalRange, double maxTotalRange) 
	{
       	ArrayList<String> counter = new ArrayList<String>();
       	int index = 0;
       	while (!carListByTotalRange.isEmpty()) 
       		{
           	CarFunctions x = carListByTotalRange.poll();
           	double currentTotalRange = x.getTotalRangeInMiles();

           	if (currentTotalRange >= minTotalRange && currentTotalRange <= maxTotalRange) 
		  {
           		StringBuilder xStr = new StringBuilder(x.toString());
           		int equalIndex = carList.indexOf(x);
           		xStr.append("\t").append(equalIndex);
           		double currentFuelEconomy = x.getFuelEconomyInMilesPerGallon();
           		for (int i = 0; i < carList.size(); i++) 
			{
             	  	CarFunctions tempCar = carList.get(i);
               		if (tempCar.getFuelEconomyInMilesPerGallon() == currentFuelEconomy) 
					{
                   			 xStr.append("\t").append(i);
               				}
          	 		}
  			counter.add(xStr.toString());
       		  }
   		}
   		for (int i = 0; i < carList.size(); i++) 
		{
			carListByTotalRange.add(carList.get(i));
		}

   		return counter;

   	 }

  
    public ArrayList<String> getCarListByRemainingRangeViaPoll(double minTotalRange, double maxTotalRange) 
	{
       	ArrayList<String> counter = new ArrayList<String>();
       	int index = 0;

       		while (!carListByRemainingRange.isEmpty()) 
		{
           		CarFunctions x = carListByRemainingRange.poll();
           		double currentRemainingRange = x.getRemainingRangeInMiles();

           	  if (currentRemainingRange >= minTotalRange && currentRemainingRange <= maxTotalRange) 
		  {
               		StringBuilder xStr = new StringBuilder(x.toString());
               		int equalIndex = carList.indexOf(x);
               		xStr.append("\t").append(equalIndex);
              		double currentFuelEconomy = x.getFuelEconomyInMilesPerGallon();
               		for (int i = 0; i < carList.size(); i++) 
			{
                   	CarFunctions tempCar = carList.get(i);
                   	if (tempCar.getFuelEconomyInMilesPerGallon() == currentFuelEconomy) 
      		   		{
                        		xStr.append("\t").append(i);
                   		}
               		}
                	counter.add(xStr.toString());
           	  }
       		}
       for (int i = 0; i < carList.size(); i++) 
       {
           carListByRemainingRange.add(carList.get(i));
       }
       return counter;
   }
}


