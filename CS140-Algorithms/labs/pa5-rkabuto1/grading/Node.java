/**
 * The Node class is our building block which will be used to create our Binary Search Tree.
 * Note that a Node contains other nodes. Thus, it has a recursive nature.
 * 
 * The key value dictates where a Node will reside in the BST
 * 	- Nodes with strictly smaller key values will be found in our left subtree.
 * 	- Nodes with strictly larger key values will be found in our right subtree.
 * 
 * Additionally, each Node can hold some internal data.
 */ 
public class Node implements NodeFunctions
{
	private final int key;  //dictates where the Node will be placed within a BST.
	private Node parent;    //points to the Node that is our parent, one depth above us, closer to the root of the entire BST.
	private Node left;      //points to the Node that is our left child, the relative root of our left subtree.
	private Node right;     //points to the Node that is our right child, the relative root of our right subtree.
	private int count;      //indicates how many times the held key currently resides in a BST.
	
	/**
	 * Value constructor which creates a Node with a starting count of 0.
	 * A Node should only have its count incremented when it is inserted into some BST.
	 * 
	 * Note that this Node's parent node and children nodes are all initialized to null.
	 * 
	 * @param int key  - specifies the key value held by this Node. 	
	 */ 
	public Node(int key)
	{
		this.key = key;
		parent = null;
		left = null;
		right = null;
		this.count = 0;
	}
	
	/**
	 * Returns the key value stored within the current node.
	 * 
	 * @return the internally held key value
	 */
	public int getKey()
	{
		//TODO - implement
		return 0;
	}
	
	/**
	 * Returns the Node which is the parent of the current Node.
	 * 
	 * @return the internally held parent Node
	 */ 
	public Node getParent()
	{
		//TODO - implement
		return null;
	}
	
	/**
	 * Returns the Node which is the left child of the current Node.
	 * 
	 * @return the internally held left child Node
	 */ 
	public Node getLeft()
	{
		//TODO - implement
		return null;
	}
	
	/**
	 * Returns the Node which is the right child of the current Node.
	 * 
	 * @return the internally held right child Node
	 */ 
	public Node getRight()
	{
		//TODO - implement
		return null;
	}

	/**
     * Returns the count, which indicates how many times this Node's held key has been inserted.
     *
     * @return the count of this Node's held key
     */
    public int getCount()
    {
    	//TODO - implement 
    	return 0;
    }
	
	/**
	 * Sets the left child Node of the current Node.
	 * 
	 * @param Node n - specifies which node will be stored as the left child.
	 */ 
	public void setLeft(Node n)
	{
		//TODO - implement
	}
	
	/**
	 * Sets the right child Node of the current Node.
	 * 
	 * @param Node n - specifies which node will be stored as the right child.
	 */ 
	public void setRight(Node n)
	{
		//TODO - implement
	}
	
	/**
	 * Sets the parent Node of the current Node.
	 * 
	 * @param Node n - specifies which node will be stored as the parent.
	 */ 
	public void setParent(Node n)
	{
		//TODO - implement
	}
	
	/**
     * Returns a string representation of the current Node's state, of the form "(x,y,z,w,c)", where:
     * 
     *  - x is the current Node's key value.
     *  - y is the parent Node's key value.
     *  - z is the left child Node's key value.
     *  - w is the right child Node's key value.
     *  - c is the count of the Node's held key value.
     * 
     * If any of the Nodes are null, then its key value should be reprented via an empty String
     * 
     * Example: "(10,,3,14,2)" 
     * - represents Node with key value 10
     * - whose parent Node is null
     * - whose left child Node has key value 3
     * - whose right child Node has key value 14
     * - whose count is 2, indicating 10 occurs twice 
     *
     * @return String representation of the current Node
     */
	@Override
	public String toString()
	{
		//TODO - implement
		return "";
	}
	
	/**
	 * Returns whether the current Node is equal to another object.
	 * A Node is considered equal to another Node if they have the same key value.
	 * 
	 * @param Object o - the other object being compared to the current Node for equality.
     *
	 * @return true for equality, false otherwise.
	 */ 
	@Override
	public boolean equals(Object o)
	{
		//TODO - implement
		return false;
	}
}
