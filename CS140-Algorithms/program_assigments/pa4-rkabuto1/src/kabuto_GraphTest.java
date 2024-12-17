import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class kabuto_GraphTest 
{	
	String directedAndConnectedVertices = "{1,3,2,4,5,1,2}";
	String directedAndConnectedEdges = "{(1,4),(2,1),(2,3),(3,5),(4,5),(5,2)}";
		
	String directedAndNotConnectedVertices = "{1,3,2,4,5,1,2}";
	String directedAndNotConnectedEdges = "{(1,4),(2,1),(2,3),(3,5),(4,5),(0,1),(0,7),(1,7)}";
		
	String undirectedAndConnectedVertices = "{0,1,3,2,4,5,6,7,8,9,0,2}";
	String undirectedAndConnectedEdges = "{(0,5),(1,7),(2,4),(3,6),(4,9),(5,8),(6,9),(7,9),(8,9),(5,0)}";
	
	String undirectedAndNotConnectedVertices = "{0,1,3,2,4,5,6,7,8,9,0,2}";
	String undirectedAndNotConnectedEdges = "{(0,5),(1,7),(2,4),(4,9),(5,8),(6,9),(7,9),(8,9),(5,0)}";
	int[] undirectedAndNotConnectedSubset = new int[] {0,1,2,4,5,6,7,8,9};
	
	kabuto_Graph g;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception 
	{

	}

	@BeforeEach
	void setUp() throws Exception 
	{
		g = new kabuto_Graph();
	}
	@Test
	void testgetNumberOfVertices() 
	{
		int[] getNumberOfVertices = new int[101];
		int[] expectedResultgetNumberOfVertices = new int[getNumberOfVertices.length];
		getNumberOfVertices[0] = g.getNumberOfVertices();
		expectedResultgetNumberOfVertices[0] = 0;
		for( int i = 0; i < getNumberOfVertices.length; i++ )
		{
			expectedResultgetNumberOfVertices[i] = i;
			try
			{// sample_undirected_graph_2.txt
				g.addVertex(i-1);
				getNumberOfVertices[i] = g.getNumberOfVertices();
				g.addVertex(i);
			}
			catch(Exception e)
			{
			}
		}
		assertArrayEquals(getNumberOfVertices, expectedResultgetNumberOfVertices);
	}	
	@Test
	void testToString() 
	{	
		String expectedToString = "G = (V, E)\n";
		expectedToString = expectedToString + "V = {0,1,2,3,4,5,6,7,8,9}\n";
		expectedToString = expectedToString + "E = {0,1),(1,2),(2,3),(4,5),(5,6),(6,7),(7,8),(8,9)}\n";
		for( int i = 0; i < 10; i++ )
		{
			try
			{
				g.addVertex(i);
			}
			catch(GraphException e)
			{
			}
		}
		
		for( int i = 1; i < 9; i++ )
		{
			try
			{
				g.addEdge(i-1, i);				
			}
			catch(GraphException e)
			{
			}
		}
		
		assertEquals(expectedToString, g.toString());
	}
	
	@Test
	void testAddEdge() 
	{
		int[] NumberOfEdges = new int[101];
		int[] expectedNumberOfEdges = new int[NumberOfEdges.length];
		NumberOfEdges[0] = g.getNumberOfEdges();
		expectedNumberOfEdges[0] = 0;
		for( int i = 0; i < NumberOfEdges.length-1; i++ )
		{
			expectedNumberOfEdges[i+1] = i+1;
			try
			{
				if(i==0)
				{
					g.addVertex(i);
				}
				g.addVertex(i+1);
				g.addEdge(i, i+1);
				NumberOfEdges[i+1] = g.getNumberOfEdges();
			}
			catch(GraphException e)
			{
			}
		}
				
		assertArrayEquals(NumberOfEdges, NumberOfEdges);
	}
	@Test
	void testAddVertex() 
	{
		int[] numberOfVertices = new int[101];
		int[] expectedNumberOfVertices = new int[numberOfVertices.length];
		numberOfVertices[0] = g.getNumberOfVertices();
		expectedNumberOfVertices[0] = 0;
		for( int i = 0; i < numberOfVertices.length-1; i++ )
		{
			expectedNumberOfVertices[i+1] = i+1;
			try
			{// sample_undirected_graph_2.txt
				g.addVertex(i);
				numberOfVertices[i+1] = g.getNumberOfVertices();
				g.addVertex(i);
			}
			catch(Exception e)
			{
			}
		}
		assertArrayEquals(numberOfVertices, expectedNumberOfVertices);
	}
	
	// Test 5 - add vertices 0 - 100, then add edges (i,i+1) i = 0, ..., 99,
	// verify the number of edges is correct after each one is added
	@Test
	void testGetNumberOfEdges() 
	{
		int[] getNumberOfEdges = new int[101];
		int[] expectedResultGetNumberOfEdges = new int[getNumberOfEdges.length];
		getNumberOfEdges[0] = g.getNumberOfEdges();
		expectedResultGetNumberOfEdges[0] = 0;
		for( int i = 0; i < getNumberOfEdges.length; i++ )
		{
			try
			{
				g.addVertex(i);
			}
			catch(GraphException e)
			{
			}
		}
		
		for( int i = 1; i < getNumberOfEdges.length; i++ )
		{
			expectedResultGetNumberOfEdges[i] = i;
			try
			{
				g.addEdge(i-1, i);
				getNumberOfEdges[i] = g.getNumberOfEdges();
				
			}
			catch(GraphException e)
			{
			}
		}
		
		assertArrayEquals(getNumberOfEdges, expectedResultGetNumberOfEdges);
	}
	@Test
	void testGraphExceptionForDuplicateEdge3b()
	{
		g = new kabuto_Graph(true);
		try
		{
			g.addVertex(0);
			g.addVertex(1);
			g.addEdge(0,1);
			assertDoesNotThrow(() -> g.addEdge(1, 0));
		}
		catch(GraphException e)
		{			
		}
	}
	@Test
	void testGraphExceptionForInvalidEdge()
	{
		assertThrows(GraphException.class, () -> g.addEdge(0, 1));
	}
	@Test
	void testGraphExceptionForDuplicateEdge2()
	{
		try
		{
			g.addVertex(0);
			g.addVertex(1);
			g.addEdge(0,1);
		}
		catch(GraphException e)
		{
		}
		assertThrows(GraphException.class, () -> g.addEdge(1, 0));
	}
	@Test
	void testIsDirectedForUndirectedGraph()
	{
		assertEquals(false, g.isDirected());
	}
	@Test
	void testIsDirectedFordirectedGraph()
	{
		g = new kabuto_Graph(true);
		assertTrue(g.isDirected());
	}
	@Test
	void testIsDirectedForUndirectedGraph2()
	{
		g = new kabuto_Graph(false);
		assertFalse(g.isDirected());
	}
	// Test 6 - try to add vertex 0 twice, verify there is an exception on the second one
	@Test
	void testGraphExceptionForDuplicateEdge()
	{
		try
		{
			g.addVertex(0);
			g.addVertex(1);
			g.addEdge(0,1);
		}
		catch(GraphException e)
		{
		}
		assertThrows(GraphException.class, () -> g.addEdge(0,1));
	}
	@Test
	void testGraphExceptionForDuplicateVertex()
	{
		try
		{
			g.addVertex(0);
		}
		catch(GraphException e)
		{
		}
		assertThrows(GraphException.class, () -> g.addVertex(0));
	}
	@Test
	void testIsConnectedDirectedAndConnected() 
	{
		g = new kabuto_Graph(false);
		int startingVertex = -1;
		java.util.StringTokenizer st = new java.util.StringTokenizer(directedAndConnectedVertices, "{},");
		while( st.hasMoreTokens() )
		{
			int newVertex = Integer.parseInt(st.nextToken());
			startingVertex = newVertex;
			
			try
			{
				g.addVertex(newVertex);
			}
			catch(GraphException e)
			{
			}
		}
		
		st = new java.util.StringTokenizer(directedAndConnectedEdges, "{}");
		String inn = st.nextToken();
		st = new java.util.StringTokenizer(inn, "(),");
		while( st.hasMoreTokens() )
		{
			int from = Integer.parseInt(st.nextToken());
			int to = Integer.parseInt(st.nextToken());
			
			try
			{
				g.addEdge(from, to);
			}
			catch(GraphException e)
			{
			}
		}
		
		assertEquals(true, g.isConnected(startingVertex));
	}
	@Test
	void testIsConnectedUndirectedAndConnected() 
	{
		g = new kabuto_Graph(false);
		int startingVertex = -1;
		java.util.StringTokenizer st = new java.util.StringTokenizer(undirectedAndConnectedVertices, "{},");
		while( st.hasMoreTokens() )
		{
			int newVertex = Integer.parseInt(st.nextToken());
			startingVertex = newVertex;
			
			try
			{
				g.addVertex(newVertex);
			}
			catch(GraphException e)
			{
			}
		}
		
		st = new java.util.StringTokenizer(undirectedAndConnectedEdges, "{}");
		String inn = st.nextToken();
		st = new java.util.StringTokenizer(inn, "(),");
		while( st.hasMoreTokens() )
		{
			int from = Integer.parseInt(st.nextToken());
			int to = Integer.parseInt(st.nextToken());
			
			try
			{
				g.addEdge(from, to);
			}
			catch(GraphException e)
			{
			}
		}
		
		assertEquals(true, g.isConnected(startingVertex));
	}
	@Test
	void testIsConnectedDirectedAndNotConnected() 
	{
		g = new kabuto_Graph(false);
		int startingVertex = -1;
		java.util.StringTokenizer st = new java.util.StringTokenizer(directedAndConnectedVertices, "{},");
		while( st.hasMoreTokens() )
		{
			int newVertex = Integer.parseInt(st.nextToken());
			startingVertex = newVertex;
			
			try
			{
				g.addVertex(newVertex);
			}
			catch(GraphException e)
			{
			}
		}
		
		st = new java.util.StringTokenizer(directedAndNotConnectedEdges, "{}");
		String inn = st.nextToken();
		st = new java.util.StringTokenizer(inn, "(),");
		while( st.hasMoreTokens() )
		{
			int from = Integer.parseInt(st.nextToken());
			int to = Integer.parseInt(st.nextToken());
			
			try
			{
				g.addEdge(from, to);
			}
			catch(GraphException e)
			{
			}
		}
		
		assertEquals(false, g.isConnected(startingVertex));
	}
	
	// Test 15 - test isConnected() recognizes sample_undirected_graph_2.txt is not connected
	@Test
	void testIsConnectedUndirectedAndNotConnected() 
	{
		g = new kabuto_Graph(false);
		int startingVertex = -1;
		java.util.StringTokenizer st = new java.util.StringTokenizer(undirectedAndConnectedVertices, "{},");
		while( st.hasMoreTokens() )
		{
			int newVertex = Integer.parseInt(st.nextToken());
			startingVertex = newVertex;
			
			try
			{
				g.addVertex(newVertex);
			}
			catch(GraphException e)
			{
			}
		}
		
		st = new java.util.StringTokenizer(undirectedAndNotConnectedEdges, "{}");
		String inn = st.nextToken();
		st = new java.util.StringTokenizer(inn, "(),");
		while( st.hasMoreTokens() )
		{
			int from = Integer.parseInt(st.nextToken());
			int to = Integer.parseInt(st.nextToken());
			
			try
			{
				g.addEdge(from, to);
			}
			catch(GraphException e)
			{
			}
		}
		
		assertEquals(false, g.isConnected(startingVertex));
	}
	
	// Test 18 - test getConnectedSet() returns correct connected subset for sample_directed_graph_2.txt
	@Test
	void testGetConnectedSetDirectedAndNotConnected() 
	{
		g = new kabuto_Graph(true);
		int startingVertex = -1;
		java.util.StringTokenizer st = new java.util.StringTokenizer(directedAndNotConnectedVertices, "{},");
		while( st.hasMoreTokens() )
		{
			int newVertex = Integer.parseInt(st.nextToken());
			startingVertex = newVertex;
			
			try
			{
				g.addVertex(newVertex);
			}
			catch(GraphException e)
			{
			}
		}
		
		st = new java.util.StringTokenizer(directedAndNotConnectedEdges, "{}");
		String inn = st.nextToken();
		st = new java.util.StringTokenizer(inn, "(),");
		while( st.hasMoreTokens() )
		{
			int from = Integer.parseInt(st.nextToken());
			int to = Integer.parseInt(st.nextToken());
			
			try
			{
				g.addEdge(from, to);
			}
			catch(GraphException e)
			{
			}
		}
		
		java.util.HashSet<Integer> connectedSubset = g.getConnectedSet(startingVertex);
		
		boolean correctSize = connectedSubset.size() == 1;
		boolean containsStartingVertex = connectedSubset.contains(2);
		
		assertTrue(correctSize && containsStartingVertex);
	}
	
	
	@Test
	void testGetConnectedSetUndirectedAndNotConnected() 
	{
		g = new kabuto_Graph(false);
		int startingVertex = -1;
		java.util.StringTokenizer st = new java.util.StringTokenizer(undirectedAndNotConnectedVertices, "{},");
		while( st.hasMoreTokens() )
		{
			int newVertex = Integer.parseInt(st.nextToken());
			startingVertex = newVertex;
			
			try
			{
				g.addVertex(newVertex);
			}
			catch(GraphException e)
			{
			}
		}
		
		st = new java.util.StringTokenizer(undirectedAndNotConnectedEdges, "{}");
		String inn = st.nextToken();
		st = new java.util.StringTokenizer(inn, "(),");
		while( st.hasMoreTokens() )
		{
			int from = Integer.parseInt(st.nextToken());
			int to = Integer.parseInt(st.nextToken());
			
			try
			{
				g.addEdge(from, to);
			}
			catch(GraphException e)
			{
			}
		}
		
		java.util.HashSet<Integer> connectedSubset = g.getConnectedSet(startingVertex);
				
		boolean correctSize = connectedSubset.size() == undirectedAndNotConnectedSubset.length;
		boolean containsCorrectVertics = true;
		for( int i = 0; i < undirectedAndNotConnectedSubset.length; i++ )
		{
			containsCorrectVertics = containsCorrectVertics && connectedSubset.contains(undirectedAndNotConnectedSubset[i]);
		}
		
		assertTrue(correctSize && containsCorrectVertics);
	}

}