import java.util.ArrayList;
import java.util.PriorityQueue;
import java.util.Iterator;

class kabuto_Car implements CarFunctions
{
	private final String id;
	private final int fuelEconomyInMilesPerGallon;
    	private final int fuelCapacityInGallons;
    	private double currentFuelInGallons;


	public kabuto_Car(String id, int fuelEconomyInMilesPerGallon, int fuelCapacityInGallons, double currentFuelInGallons) 
	{
        this.id = id;
        this.fuelEconomyInMilesPerGallon = fuelEconomyInMilesPerGallon;
        this.fuelCapacityInGallons = fuelCapacityInGallons;
        this.currentFuelInGallons = currentFuelInGallons;
   	}

	// return the fuel economy in miles per gallon of the car
	public int getFuelEconomyInMilesPerGallon()
	{
		return fuelEconomyInMilesPerGallon;
	}

	// return the fuel capacity in gallons of the car
	public int getFuelCapacityInGallons()
	{
		return fuelCapacityInGallons;
	}

	// return the current gallons of fuel of the car
	public double getCurrentFuelInGallons()
	{
		return currentFuelInGallons;
	}

	// return the id of the car
	public String getId()
	{
		return id;
	}

	//set the current gallons of fuel of the car
	public void setCurrentFuelInGallons(double v)
	{
		this.currentFuelInGallons = v;
	}

	// get the total range of the car in miles
	public double getTotalRangeInMiles()
	{
		return getFuelCapacityInGallons()*getFuelEconomyInMilesPerGallon();
	}

	// get the remaining range of the car in miles
	public double getRemainingRangeInMiles()
	{
		return getCurrentFuelInGallons()*getFuelEconomyInMilesPerGallon();
	}

	public String toString()
	{
		 return getId() + "\t" + getFuelEconomyInMilesPerGallon() + "\t" + getFuelCapacityInGallons() + "\t" + getCurrentFuelInGallons() + "\t" + getTotalRangeInMiles() + "\t" + getRemainingRangeInMiles();
	}
}

