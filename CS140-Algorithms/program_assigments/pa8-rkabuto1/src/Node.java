public class Node implements NodeFunctions
{
	private final int key;
	private Node parent;
	private Node left;
	private Node right;
	
	public Node(int key)
	{
		this.key = key;
		parent = null;
		left = null;
		right = null;
	}
	
	public int getKey()
	{
		return key;
	}
	
	public Node getParent()
	{
		return parent;
	}
	
	public Node getLeft()
	{
		return left;
	}
	
	public Node getRight()
	{
		return right;
	}
	
	public void setLeft(Node n)
	{
		left = n;
	}
	
	public void setRight(Node n)
	{
		right = n;
	}
	
	public void setParent(Node n)
	{
		parent = n;
	}
	
	public String toString()
	{
		String leftKey = "";
		String rightKey = "";
		String parentKey = "";
		if( this.getLeft() != null )
		{
			leftKey = ""+this.getLeft().getKey();
		}
		
		if( this.getRight() != null )
		{
			rightKey = ""+this.getRight().getKey();
		}
		
		if( this.getParent() != null )
		{
			parentKey = ""+this.getParent().getKey();
		}
		
		return "(" + this.getKey() + "," + parentKey + "," + leftKey + "," + rightKey + ")";
	}
	
	public boolean equals(Object o)
	{
		if( o instanceof Node )
		{
			if( ((Node) o).getKey() == key )
			{
				return true;
			}
		}
		
		return false;
	}
}
