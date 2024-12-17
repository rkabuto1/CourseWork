import java.util.Comparator;

public class WeightedVertex
{
    private final Integer vertex;
    private Double weight;

    public WeightedVertex(Integer vertex, Double weight)
    {
        this.vertex = vertex;
        this.weight = weight;
    }

    public Integer getVertex()
    {
        return vertex;
    }

    public Double getWeight()
    {
        return weight;
    }

    public void setWeight(Double weight)
    {
        this.weight = weight;
    }

    public static Comparator<WeightedVertex> getComparator()
    {
        return Comparator.comparing(WeightedVertex::getWeight).thenComparing(WeightedVertex::getVertex);
    }

    public String toString() {
        return "()" + vertex + "," + weight + ")";
    }

    public boolean equals(Object o)
    {
        if(o == null)
        {
            return false;
        }

        if(this == o)
        {
            return true;
        }
        
        if(getClass() == o.getClass())
        {
            if(vertex.intValue() == ((WeightedVertex) o).getVertex().intValue())
            {
                return true;
            }
        }
        return false;
    }

    public int compare(WeightedVertex o1, WeightedVertex o2) {
        if (o1.getWeight() < o2.getWeight()) 
        {
            return -1;
        } 
        
        else if (o1.getWeight() > o2.getWeight()) 
        {
            return 1;
        } 
        
        else 
        {
            int vertexComp = o1.getVertex().compareTo(o2.getVertex());
            if (vertexComp < 0) 
            {
                return 1;
            } 
            else if (vertexComp > 0) 
            {
                return -1;
            } 
            else 
            {
                return 0;
            }
        }
    }

}