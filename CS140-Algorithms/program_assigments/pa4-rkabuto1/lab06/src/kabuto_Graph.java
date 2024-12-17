
public class kabuto_Graph implements ConnectedGraphFunctions
{
	private final java.util.ArrayList<Integer> verticies;
	private final java.util.ArrayList<Edge> edges;
	private final boolean isDirected;
	
	kabuto_Graph(boolean isDirected)
	{
		this.isDirected = isDirected;
		verticies = new java.util.ArrayList<>();
		edges = new java.util.ArrayList<>();
	}
	kabuto_Graph()
	{
		this(false);
	}
	
	public int getNumberOfVertices()
	{	
		return verticies.size();
	}
	public int getNumberOfEdges()
	{
		return edges.size();
	}
	
	public boolean isDirected()
	{
		return isDirected;
	}
	
	public void addVertex(int v) throws GraphException
	{
		
	}
	
	public void addEdge(int from, int to) throws GraphException
	{
		
	}
	
	public String toString()
	{
		return "";
	}
	
	public boolean isConnected(int startingVertex)
	{
		return false;
	}
	
	public java.util.HashSet<Integer> getConnectedSet(int startingVertex)
	{
		return new java.util.HashSet<Integer>();
	}
}
