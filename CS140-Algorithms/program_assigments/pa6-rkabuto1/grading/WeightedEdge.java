record WeightedEdge(Integer fromVertex, Integer toVertex, Double weight) implements WeightedEdgeFunctions
{
    public String toString()
    {
        return "(" + fromVertex + "," + toVertex + "," + weight + ")";
    }
} 

//NOTE: ONLY USE IF THE RECORD ABOVE DOESNT COMPILE (OLDER JAVA COMPILER)
//class WeightedEdge implements WeightedEdgeFunctions 
//{
//    private final Integer fromVertex;
//    private final Integer toVertex;
//    private final Double weight;
//    
//    /**
//     * Value constructor for a WeightedEdge
//     * 
//     * @param int       from    - specifies the edge's from vertex
//     * @param int       to      - specifies the edge's to vertex
//     * @param double    weight  - specifies the edge's weight
//     */ 
//    WeightedEdge(int from, int to, double weight)
//    {
//        this.fromVertex = Integer.valueOf(from);
//        this.toVertex = Integer.valueOf(to);
//        this.weight = Double.valueOf(weight);
//    }
//    
//    /**
//     * Returns the from vertex of the Weighted Edge
//     * 
//     * @return the from vertex
//     */ 
//    public int getFromVertex()
//    {
//        return fromVertex.intValue();
//    }
//    
//    /**
//     * Returns the to vertex of the Weighted Edge
//     * 
//     * @return the to vertex
//     */ 
//    public int getToVertex()
//    {
//        return toVertex.intValue();
//    }
//    
//    /**
//     * Returns the weight of the Weighted Edge
//     * 
//     * @return the weight
//     */ 
//    public double getWeight()
//    {
//        return weight.doubleValue();
//    }
//    
//    /**
//     * Returns a string representation of the Weighted Edge.
//     * 
//     * Form is "(x,y,w)", where:
//     * x - is the from vertex
//     * y - is the to vertex
//     * w - is the weight
//     * 
//     * @return string representation of this Weighted Edge.
//     */ 
//    public String toString()
//    {
//        return "(" + fromVertex + "," + toVertex + "," + weight + ")";
//    }
//}
