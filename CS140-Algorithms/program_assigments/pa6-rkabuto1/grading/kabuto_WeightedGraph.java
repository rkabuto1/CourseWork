import java.util.ArrayList;

class kabuto_WeightedGraph implements WeightedGraphFunctions
{
    private final java.util.ArrayList<Integer> vertices;
    private final java.util.ArrayList<WeightedEdge> edges;
    //private boolean debugOutput = false;


    kabuto_WeightedGraph()
    {
        this.vertices = new java.util.ArrayList<Integer>();
        this.edges = new java.util.ArrayList<WeightedEdge>();
    }

    private Object getPath(int fromVertex, int toVertex, WeightedGraphReturnType typeOfInfo)
    {
    	java.util.PriorityQueue<WeightedVertex> minPriorityQueueByWeight = new java.util.PriorityQueue<>(vertices.size(), new WeightedVertexComparator());
    	
    	boolean pathExists = false;
    	double minWeight;
    	WeightedEdge[] path;
    	
    	Integer fromV = fromVertex;
    	Integer toV = toVertex;
    	
    	if((vertices.contains(fromV) == false) || (vertices.contains(toV) == false))
    	{
    		if(typeOfInfo.equals(WeightedGraphReturnType.HAS_PATH))
    		{
    			pathExists = false;
    			return (Object) pathExists;
    		}
    		if(typeOfInfo.equals(WeightedGraphReturnType.GET_PATH))
    		{
    			path = new WeightedEdge[0];
    			return (Object) path;
    		}
    		if(typeOfInfo.equals(WeightedGraphReturnType.GET_MINIMUM_WEIGHT))
    		{
    			minWeight = Double.NaN;
    			return (Object) minWeight;
    		}
    		
    	}
    	
    	WeightedVertex[] vertexCost = new WeightedVertex[vertices.size()];
    	int[] parent = new int[vertices.size()];
    	
    	for(int i = 0; i < vertices.size(); i++)
    	{
    		parent[i] = -1;
    		vertexCost[i] = new WeightedVertex(vertices.get(i), Double.POSITIVE_INFINITY);
    	}
    	
    	parent[getIndex(fromVertex)] = fromVertex;
    	vertexCost[getIndex(fromVertex)] = new WeightedVertex(vertices.get(getIndex(fromVertex)), 0.0);
    	
    	for(int i = 0; i < vertices.size(); i++)
    	{
    		minPriorityQueueByWeight.add(vertexCost[i]);
    	}
    	
    	while(minPriorityQueueByWeight.size() > 0) 
    	{
    		WeightedVertex v = minPriorityQueueByWeight.poll();
    		
    		if(parent[getIndex(v.getVertex())] == -1)
    		{
    			break;
    		}
    		if(v.getVertex() == toVertex)
    		{
    			break;
    		}
    		
    		for(WeightedEdge e : edges)
    		{
    			if(e.fromVertex() == v.getVertex())
    			{
    				int u = e.toVertex();
    				if(v.getWeight() + e.weight() < vertexCost[getIndex(u)].getWeight())
    				{
    					minPriorityQueueByWeight.remove(vertexCost[getIndex(u)]);
    					vertexCost[getIndex(u)] = new WeightedVertex(getIndex(u), v.getWeight() + e.weight());
    					minPriorityQueueByWeight.add(vertexCost[getIndex(u)]);
    					parent[getIndex(u)] = v.getVertex();
    				}
    			}
    		}
    	}
    	
    	if(parent[getIndex(toVertex)] != -1)
    	{
    		pathExists = true;
    	}
    	
    	ArrayList<Integer> forwardPath = new ArrayList<>();
    	
    	if(pathExists == false)
    	{
    		minWeight = Double.NaN;
    		path = new WeightedEdge[0];
    	}
    	else
    	{
    		int q = toVertex;
    		ArrayList<Integer> reversePath = new ArrayList<>();
    		
    		reversePath.add(q);
    		
    		while(q != fromVertex)
    		{
    			q = parent[getIndex(q)];
    			reversePath.add(q);
    		}
    		
    		for(int i = reversePath.size() - 1; i>=0; i--)
    		{
    			forwardPath.add(reversePath.get(i));
    		}
    		if(forwardPath.size() > 0)
    		{
    			path = new WeightedEdge[forwardPath.size() - 1];
    		}
    		else
    		{
    			path = new WeightedEdge[0];
    		}
    		
    		minWeight = vertexCost[getIndex(toVertex)].getWeight();
    		for(int i = 0; i < forwardPath.size() - 1; i++)
    		{
    			WeightedEdge e = new WeightedEdge(forwardPath.get(i), forwardPath.get(i+1), vertexCost[forwardPath.get(getIndex(i+1))].getWeight() - vertexCost[forwardPath.get(getIndex(i))].getWeight());
    			path[i] = e;
    		}
    	
    	}
    	
    	if(typeOfInfo.equals(WeightedGraphReturnType.HAS_PATH))
    	{
    		return(Object) pathExists;
    	}
    	if(typeOfInfo.equals(WeightedGraphReturnType.GET_PATH))
    	{
    		return (Object) path;
    	}
    	if(typeOfInfo.equals(WeightedGraphReturnType.GET_MINIMUM_WEIGHT))
    	{
    		return (Object) minWeight;
    	}
    	
    	return null;
    	
    	
    }


    public boolean hasPath(int fromVertex, int toVertex)
    {
        WeightedGraphReturnType ret = WeightedGraphReturnType.HAS_PATH;
        boolean result = (boolean) getPath(fromVertex, toVertex, ret);
        return result;
        
    }


    public double getMinimumWeight(int fromVertex, int toVertex){
        Object returnValue = getPath(fromVertex, toVertex, WeightedGraphReturnType.GET_MINIMUM_WEIGHT);
        double rettype = Double.valueOf(((Double) returnValue).doubleValue());
        return rettype;

    }

    public int getIndex(int value)
    {
        for( int i = 0; i < vertices.size(); i++ )
        {
            if( vertices.get(i).intValue() == value ){return i;}
        }
        return 0;
    }

    public WeightedEdge[] getPath(int fromVertex, int toVertex){
    	Object returnValue = getPath(fromVertex, toVertex, WeightedGraphReturnType.GET_PATH);
		WeightedEdge[] rettype = (WeightedEdge[]) returnValue;
        return rettype;

    }

    public boolean addVertex(int v){
        boolean rettype = false;
        if(!vertices.contains(Integer.valueOf(v)))
        {
            vertices.add(Integer.valueOf(v));
            rettype= true;
        }
        return rettype;
    }

    public boolean addWeightedEdge(int from, int to, double weight)
    {
        for(WeightedEdge i: edges)
        {
            if(i.fromVertex() == from && i.toVertex() == to) return false;

        }

        edges.add(new WeightedEdge(from, to, weight));
        return true;


    }

    public String toString()
    {

        java.lang.StringBuilder e = new java.lang.StringBuilder();
        e = e.append("G = (V, E)\n");
        e = e.append("V = {");

        for(int i=0; i<vertices.size(); i++){

            e = e.append(vertices.get(i));
            if(i!= vertices.size()-1){

                e = e.append(",");

            }
        }

        e = e.append("}\n");
        e = e.append("E = {");

        for(int i=0; i<edges.size(); i++){

            e = e.append(edges.get(i));
            if(i!= edges.size()-1){

                e = e.append(",");

            }
        }

        e = e.append("}");
        return e.toString();

    }

}

