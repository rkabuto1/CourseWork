import java.util.*;
import java.util.ArrayDeque;
import java.util.ArrayList;

public class kabuto_Graph implements ConnectedGraphFunctions
{
	private final java.util.ArrayList<Integer> vertices;
	private final java.util.ArrayList<Edge> edges;
	private final boolean isDirected;
	
	kabuto_Graph(boolean isDirected)
	{
		this.isDirected = isDirected;
		vertices = new java.util.ArrayList<>();
		edges = new java.util.ArrayList<>();
	}
	kabuto_Graph()
	{
		this(false);
	}
	@Override
	public int getNumberOfVertices()
	{	
		return vertices.size();
	}
	@Override
	public int getNumberOfEdges()
	{
		return edges.size();
	}
	@Override
	public boolean isDirected()
	{
		return isDirected;
	}
	@Override
	public void addVertex(int v) throws GraphException
	{
		if(!vertices.contains(v))
		{
			vertices.add(v);
		}
		else
		{
			throw new GraphException();
		}

	}
	@Override
	public void addEdge(int from, int to) throws GraphException
	{
		if(!vertices.contains(to) && vertices.contains(from))
		{
			throw new GraphException("Invalid Edges");
		}
		Edge edge1 = new Edge(from, to);
		
		if(isDirected)
		{
		for (int i = 0; i < edges.size(); i++)
		{
			Edge e = edges.get(i);
			
		if(e.fromVertex() == from && e.toVertex() == to)
		{
			throw new GraphException("bad edge");
		}

		}
			edges.add(edge1);
		}
		
		for (Edge e : edges) 
		{
		    if ((e.fromVertex() == from && e.toVertex() == to) || (e.fromVertex() == to && e.toVertex() == from)) 
		    {
		        throw new GraphException("bad edge");
		    }
		}
		edges.add(edge1);
	}
	@Override
	public String toString()
	{
		 StringBuilder sb = new StringBuilder("G = (V, E)\nV = {");
		    
		    for (int i = 0; i < vertices.size(); i++) 
		    {
		        sb.append(i);
		        if (i != vertices.size() - 1) 
		        {
		            sb.append(",");
		        }
		    }
		    sb.append("}\nE = {");
		    
		    for (int n = 0; n < edges.size(); n++)
		    {
		        sb.append(edges.get(n)).append(",");
		    }
		    if (!edges.isEmpty()) 
		    {
		        sb.deleteCharAt(sb.length() - 1);
		    }
		    
		    sb.append("}");
		    return sb.toString();

	}
	@Override
	public boolean isConnected(int startingVertex)
	{	
		// construct the set of connected vertices
		java.util.HashSet<Integer> connectedSubset = this.getConnectedSet(startingVertex);
		return connectedSubset.size() == vertices.size();
	}
	
	@Override
	public java.util.HashSet<Integer> getConnectedSet(int startingVertex)
	{
		new java.util.HashSet<>();
		HashSet<Integer> connectedSubset = new HashSet<>();
		
		if (isDirected == true)
		{
			HashSet<Integer> a = new HashSet<>();
			a = getConnectedSet(startingVertex, edges);
			
			ArrayList<Edge> rev = new ArrayList<>();
			for (Edge e: edges)
			{
				int FromVertex = e.toVertex();
				int ToVertex = e.fromVertex();
				Edge y = new Edge(FromVertex,ToVertex);
				rev.add(y);				
			}
			HashSet<Integer> revSubset = new HashSet<>();
			revSubset = getConnectedSet(startingVertex, rev);
			for(Integer i: a)
			{
				int vertexIntersection = i;
				if (revSubset.contains(vertexIntersection))
				{
					connectedSubset.add(i);
				}
			}
		}
		else
		{
			connectedSubset = getConnectedSet(startingVertex, edges);
		}
		return connectedSubset;
	}
		private HashSet<Integer> getConnectedSet(int startingVertex, ArrayList<Edge> edges)
		{
			HashSet<Integer> connectedSubset = new HashSet<>();
			java.util.ArrayDeque<Integer> newlyAddedVerticies = new java.util.ArrayDeque<>();
			connectedSubset.add(startingVertex);
			newlyAddedVerticies.add(startingVertex);
			int currentVertex;
			
			while(!newlyAddedVerticies.isEmpty())
			{
				currentVertex = newlyAddedVerticies.pollFirst();
				for(Edge e: edges)
				{
					if (currentVertex == e.fromVertex())
					{
						if(!connectedSubset.contains(e.toVertex()))
						{
							connectedSubset.add(e.toVertex());
							newlyAddedVerticies.add(e.toVertex());							
						}
					}
					if ((currentVertex == e.toVertex()) && (isDirected == false))
					{
						if (!connectedSubset.contains(e.fromVertex()))
						{
							connectedSubset.add(e.fromVertex());
							newlyAddedVerticies.add(e.fromVertex());
						}
													
					}
				}
				
			}
			return connectedSubset;
		}
}

