/**
 * The NodeFunctions interface specifies all the functionality expected of our Node class.
 */ 
interface NodeFunctions
{
    /**
     * Returns the key value stored within the current node.
     * 
     * @return the internally held key value
     */ 
    public int getKey();

    /**
     * Returns the Node which is the parent of the current Node.
     * 
     * @return the internally held parent Node
     */ 
    public Node getParent();

    /**
     * Returns the Node which is the left child of the current Node.
     * 
     * @return the internally held left child Node
     */ 
    public Node getLeft();

    /**
     * Returns the Node which is the right child of the current Node.
     * 
     * @return the internally held right child Node
     */ 
    public Node getRight();
    
    /**
     * Returns the count, which indicates how many times this Node's held key has been inserted.
     *
     * @return the count of this Node's held key
     */
    public int getCount();

    /**
     * Sets the left child Node of the current Node.
     * 
     * @param Node n - specifies which node will be stored as the left child.
     */ 
    public void setLeft(Node n);

    /**
     * Sets the right child Node of the current Node.
     * 
     * @param Node n - specifies which node will be stored as the right child.
     */ 
    public void setRight(Node n);

    /**
     * Sets the parent Node of the current Node.
     * 
     * @param Node n - specifies which node will be stored as the parent.
     */ 
    public void setParent(Node n);

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
    public String toString();

    /**
     * Returns whether the current Node is equal to another object.
     * A Node is considered equal to another Node if they have the same key value.
     * 
     * @param Object o - the other object being compared to the current Node for equality.
     *
     * @return true for equality, false otherwise.
     */ 
     @Override 
    public boolean equals(Object o);
}