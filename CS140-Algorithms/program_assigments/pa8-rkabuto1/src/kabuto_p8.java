import javax.swing.*;
import java.awt.Color;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.PriorityQueue;
import java.util.TreeSet;
import java.awt.*;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.*;

class kabuto_p8 
{
	  private static int width = 750;
	  private static int height = 350;
	  private static int[] sortedData;
	  private static int[] sortData;
	  private static int[] searchData;
	  private static String sort;
	  private static String search;
	  private static BinarySearchTree binarysearchTree;
	  private static TreeSet<Integer> treeSet = new TreeSet<>();
	  private static PriorityQueue<Integer> priorityQueue = new PriorityQueue<>();
	  private static ArrayList<Integer> arrayList = new ArrayList<>();
	  private static ArrayList<Integer> arraySortList = new ArrayList<>();
	  private static HashSet<Integer> hashSet = new HashSet<>();
	  private static int[] sortList;
	  private static JButton sortInBtn;
	  private static JButton addToBstBtn;
	  private static JButton addToTreeSetBtn;
	  private static JButton addToPriorityQueueBtn;
	  private static JButton addToHashSetBtn;
	  private static JButton addToArrayListBtn;
	  private static JButton addToSortedArrayListBtn;
	  private static JButton addToArrayBtn;
	  private static JLabel sortIntLabel;
	  private static JLabel addToBstLabel;
	  private static JLabel addToTreeSetLabel;
	  private static JLabel addToPriorityQueueLabel;
	  private static JLabel addToHashSetLabel ;
	  private static JLabel addToArrayListLabel ;
	  private static JLabel addToSortedArrayListLabel ;
	  private static JLabel addToArrayLabel;
	  private static JButton searchSortedIntsBtn ;
	  private static JButton searchBstBtn;
	  private static JButton searchTreeSetBtn;
	  private static JButton searchPriorityQueueBtn;
	  private static JButton searchHashSetBtn;
	  private static JButton searchArrayListBtn;
	  private static JButton searchSortedArrayListBtn;
	  private static JButton searchArrayBtn;
	  private static JLabel searchSortedIntLabel;
	  private static JLabel searchBstBtnLabel;
	  private static JLabel searchTreeSetBtnLabel;
	  private static JLabel searchPriorityQueueBtnLabel;
	  private static JLabel searchHashSetBtnLabel;
	  private static JLabel searchArrayListBtnLabel;
	  private static JLabel searchSortedArrayListBtnLabel;
	  private static JLabel searchArrayBtnLabel;
	  private static boolean readDone = false;
	  private static boolean btn1 = false;
	  private static boolean btn2 = false;
	  private static boolean btn3 = false;
	  private static boolean btn4 = false;
	  private static boolean btn5 = false;
	  private static boolean btn6 = false;
	  private static boolean btn7 = false;
	  private static boolean btn8 = false;
	  
	  
  	public static void main(String[] args)
  	{
	      sort = args[0];
	      search = args[1];	   
	      javax.swing.JFrame f = new javax.swing.JFrame();
	      f.setPreferredSize(new java.awt.Dimension(width, height));
	      f.setMinimumSize(new java.awt.Dimension(width, height));
	      f.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);	    
	      javax.swing.JMenuBar menuBar = new javax.swing.JMenuBar();	    
	      javax.swing.JMenu fileMenu = new javax.swing.JMenu("File");
	      fileMenu.setMnemonic(java.awt.event.KeyEvent.VK_F);
	      javax.swing.JMenuItem readSort = new javax.swing.JMenuItem("Read sort file");	    
	      javax.swing.JMenuItem ReadSearchFile = new javax.swing.JMenuItem("Read search file");
	      javax.swing.JMenuItem fileExit = new javax.swing.JMenuItem("Exit");	    
	      menuBar.add(fileMenu);
	      fileMenu.add(readSort);
	      fileMenu.add(ReadSearchFile);
	      fileMenu.add(fileExit);
	      MenuItemActionListener fileExitMenuItemActionListener = new MenuItemActionListener(fileExit);
	      MenuItemActionListener readSortMenuItemActionListener = new MenuItemActionListener(readSort);
	      MenuItemActionListener readSearchFileMenuItemActionListener = new MenuItemActionListener(ReadSearchFile);
	      fileExit.addActionListener(fileExitMenuItemActionListener);
	      readSort.addActionListener(readSortMenuItemActionListener);
	      ReadSearchFile.addActionListener(readSearchFileMenuItemActionListener);	      
	      javax.swing.JPanel leftbuttonPanel = new javax.swing.JPanel();
	      java.awt.GridBagLayout gridBagLayoutleft = new java.awt.GridBagLayout();
	      leftbuttonPanel.setLayout(gridBagLayoutleft);
	      java.awt.GridBagConstraints buttonPanelConstraintsleft = new java.awt.GridBagConstraints();
	      leftbuttonPanel.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));	      
	      javax.swing.JPanel rightbuttonPanel = new javax.swing.JPanel();
	      java.awt.GridBagLayout gridBagLayoutright = new java.awt.GridBagLayout();
	      rightbuttonPanel.setLayout(gridBagLayoutright);
	      java.awt.GridBagConstraints buttonPanelConstraintsright = new java.awt.GridBagConstraints();
	      rightbuttonPanel.setBorder(BorderFactory.createLineBorder(Color.PINK, 2));	      
	      javax.swing.JPanel mainbuttonPanel = new javax.swing.JPanel();
	      javax.swing.BoxLayout boxLayout = new javax.swing.BoxLayout(mainbuttonPanel, javax.swing.BoxLayout.X_AXIS);
	      mainbuttonPanel.setLayout(boxLayout);
	      mainbuttonPanel.add(leftbuttonPanel);
	      mainbuttonPanel.add(rightbuttonPanel);	    
	      javax.swing.JPanel mainPanel = new javax.swing.JPanel();
	      mainPanel.setLayout(new java.awt.BorderLayout());
	      mainPanel.add(menuBar, java.awt.BorderLayout.NORTH);
	      mainPanel.setBorder(BorderFactory.createLineBorder(Color.black, 2));
	      mainPanel.add(mainbuttonPanel);
	      sortInBtn = new javax.swing.JButton("sort ints");
	      addToBstBtn = new javax.swing.JButton("add to bst");
	      addToTreeSetBtn = new javax.swing.JButton("add to tree set");
	      addToPriorityQueueBtn = new javax.swing.JButton("add to priority queue");
	      addToHashSetBtn = new javax.swing.JButton("add to hashset");
	      addToArrayListBtn = new javax.swing.JButton("add to array list");
	      addToSortedArrayListBtn = new javax.swing.JButton("add to sorted arraylist");
	      addToArrayBtn = new javax.swing.JButton("add to array");
	      sortIntLabel = new JLabel("no result");
	      addToBstLabel = new JLabel("no result");
	      addToTreeSetLabel = new JLabel("no result");
	      addToPriorityQueueLabel = new JLabel("no result");
	      addToHashSetLabel = new JLabel("no result");
	      addToArrayListLabel = new JLabel("no result");
	      addToSortedArrayListLabel = new JLabel("no result");
	      addToArrayLabel = new JLabel("no result");
	      buttonPanelConstraintsleft.weightx = 1;
	      buttonPanelConstraintsleft.weighty = 1;
	      buttonPanelConstraintsleft.anchor = java.awt.GridBagConstraints.LINE_START;
	      buttonPanelConstraintsleft.fill = java.awt.GridBagConstraints.NONE;
	      buttonPanelConstraintsleft.gridx = 0;
	      buttonPanelConstraintsleft.gridy = 0;
	      buttonPanelConstraintsleft.gridwidth = 1;
	      gridBagLayoutleft.setConstraints(sortInBtn, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(sortInBtn, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 1;
	      buttonPanelConstraintsleft.gridy = 0;
	      buttonPanelConstraintsleft.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutleft.setConstraints(sortIntLabel, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(sortIntLabel, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 0;
	      buttonPanelConstraintsleft.gridy = 1;
	      buttonPanelConstraintsleft.gridwidth = 1;
	      gridBagLayoutleft.setConstraints(addToBstBtn, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(addToBstBtn, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 1;
	      buttonPanelConstraintsleft.gridy = 1;
	      buttonPanelConstraintsleft.gridwidth = GridBagConstraints.REMAINDER;
	      leftbuttonPanel.add(addToBstLabel, buttonPanelConstraintsleft);    
	      buttonPanelConstraintsleft.gridx = 0;
	      buttonPanelConstraintsleft.gridy = 2;
	      buttonPanelConstraintsleft.gridwidth = 1;
	      gridBagLayoutleft.setConstraints(addToTreeSetBtn, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(addToTreeSetBtn, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 1;
	      buttonPanelConstraintsleft.gridy = 2;
	      buttonPanelConstraintsleft.gridwidth = GridBagConstraints.REMAINDER;
	      leftbuttonPanel.add(addToTreeSetLabel, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 0;
	      buttonPanelConstraintsleft.gridy = 3;
	      buttonPanelConstraintsleft.gridwidth = 1;
	      gridBagLayoutleft.setConstraints(addToPriorityQueueBtn, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(addToPriorityQueueBtn, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 1;
	      buttonPanelConstraintsleft.gridy = 3;
	      buttonPanelConstraintsleft.gridwidth = GridBagConstraints.REMAINDER;
	      leftbuttonPanel.add(addToPriorityQueueLabel, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 0;
	      buttonPanelConstraintsleft.gridy = 4;
	      buttonPanelConstraintsleft.gridwidth = 1;
	      gridBagLayoutleft.setConstraints(addToHashSetBtn, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(addToHashSetBtn, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 1;
	      buttonPanelConstraintsleft.gridy = 4;
	      buttonPanelConstraintsleft.gridwidth = GridBagConstraints.REMAINDER;
	      leftbuttonPanel.add(addToHashSetLabel, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 0;
	      buttonPanelConstraintsleft.gridy = 5;
	      buttonPanelConstraintsleft.gridwidth = 1;
	      gridBagLayoutleft.setConstraints(addToArrayListBtn, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(addToArrayListBtn, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 1;
	      buttonPanelConstraintsleft.gridy = 5;
	      buttonPanelConstraintsleft.gridwidth = GridBagConstraints.REMAINDER;
	      leftbuttonPanel.add(addToArrayListLabel, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 0;
	      buttonPanelConstraintsleft.gridy = 6;
	      buttonPanelConstraintsleft.gridwidth = 1;
	      gridBagLayoutleft.setConstraints(addToSortedArrayListBtn, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(addToSortedArrayListBtn, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 1;
	      buttonPanelConstraintsleft.gridy = 6;
	      buttonPanelConstraintsleft.gridwidth = GridBagConstraints.REMAINDER;
	      leftbuttonPanel.add(addToSortedArrayListLabel, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 0;
	      buttonPanelConstraintsleft.gridy = 7;
	      buttonPanelConstraintsleft.gridwidth = 1;
	      gridBagLayoutleft.setConstraints(addToArrayBtn, buttonPanelConstraintsleft);
	      leftbuttonPanel.add(addToArrayBtn, buttonPanelConstraintsleft);
	      buttonPanelConstraintsleft.gridx = 1;
	      buttonPanelConstraintsleft.gridy = 7;
	      buttonPanelConstraintsleft.gridwidth = GridBagConstraints.REMAINDER;
	      leftbuttonPanel.add(addToArrayLabel, buttonPanelConstraintsleft);
	      ButtonActionListener sortBtnListner = new ButtonActionListener(sortInBtn);
	      sortInBtn.addActionListener(sortBtnListner );
	      ButtonActionListener addToBSTListener = new ButtonActionListener(addToBstBtn);
	      addToBstBtn.addActionListener(addToBSTListener);
	      ButtonActionListener topLeftButtonActionListener = new ButtonActionListener(addToTreeSetBtn);
	      addToTreeSetBtn.addActionListener(topLeftButtonActionListener);
	      ButtonActionListener addToPQListener = new ButtonActionListener(addToPriorityQueueBtn);
	      addToPriorityQueueBtn.addActionListener(addToPQListener);
	      ButtonActionListener addToArrayBActionListener = new ButtonActionListener(addToArrayListBtn);
	      addToArrayListBtn.addActionListener(addToArrayBActionListener);
	      ButtonActionListener addToHashBtnListener = new ButtonActionListener(addToHashSetBtn );
	      addToHashSetBtn .addActionListener(addToHashBtnListener);
	      ButtonActionListener addTosortedListListener = new ButtonActionListener(addToSortedArrayListBtn);
	      addToSortedArrayListBtn.addActionListener(addTosortedListListener);
	      ButtonActionListener addToArrayListener = new ButtonActionListener(addToArrayBtn);
	      addToArrayBtn.addActionListener(addToArrayListener);	    	      
	      searchSortedIntsBtn = new javax.swing.JButton("search sort ints");
	      searchBstBtn = new javax.swing.JButton("search bst");
	      searchTreeSetBtn = new javax.swing.JButton("search tree set");
	      searchPriorityQueueBtn = new javax.swing.JButton("search priority queue");
	      searchHashSetBtn = new javax.swing.JButton("search hashset");
	      searchArrayListBtn = new javax.swing.JButton("search array list");
	      searchSortedArrayListBtn = new javax.swing.JButton("search sorted arraylist");
	      searchArrayBtn = new javax.swing.JButton("search array");
	      searchSortedIntLabel = new JLabel("no result");
	      searchBstBtnLabel = new JLabel("no result");
	      searchTreeSetBtnLabel = new JLabel("no result");
	      searchPriorityQueueBtnLabel = new JLabel("no result");
	      searchHashSetBtnLabel = new JLabel("no result");
	      searchArrayListBtnLabel = new JLabel("no result");
	      searchSortedArrayListBtnLabel = new JLabel("no result");
	      searchArrayBtnLabel = new JLabel("no result");
	      buttonPanelConstraintsright.weightx = 1;
	      buttonPanelConstraintsright.weighty = 1;
	      buttonPanelConstraintsright.anchor = java.awt.GridBagConstraints.LINE_START;
	      buttonPanelConstraintsright.fill = java.awt.GridBagConstraints.NONE;
	      buttonPanelConstraintsright.gridx = 0;
	      buttonPanelConstraintsright.gridy = 0;
	      buttonPanelConstraintsright.gridwidth = 1;
	      gridBagLayoutright.setConstraints(searchSortedIntsBtn, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchSortedIntsBtn, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 1;
	      buttonPanelConstraintsright.gridy = 0;
	      buttonPanelConstraintsright.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutright.setConstraints(searchSortedIntLabel, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchSortedIntLabel, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 0;
	      buttonPanelConstraintsright.gridy = 1;
	      buttonPanelConstraintsright.gridwidth = 1;
	      gridBagLayoutright.setConstraints(searchBstBtn, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchBstBtn, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 1;
	      buttonPanelConstraintsright.gridy = 1;
	      buttonPanelConstraintsright.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutright.setConstraints(searchBstBtnLabel, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchBstBtnLabel, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 0;
	      buttonPanelConstraintsright.gridy = 2;
	      buttonPanelConstraintsright.gridwidth = 1;
	      gridBagLayoutright.setConstraints(searchTreeSetBtn, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchTreeSetBtn, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 1;
	      buttonPanelConstraintsright.gridy = 2;
	      buttonPanelConstraintsright.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutright.setConstraints(searchTreeSetBtnLabel, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchTreeSetBtnLabel, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 0;
	      buttonPanelConstraintsright.gridy = 3;
	      buttonPanelConstraintsright.gridwidth = 1;
	      gridBagLayoutright.setConstraints(searchPriorityQueueBtn, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchPriorityQueueBtn, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 1;
	      buttonPanelConstraintsright.gridy = 3;
	      buttonPanelConstraintsright.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutright.setConstraints(searchPriorityQueueBtnLabel, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchPriorityQueueBtnLabel, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 0;
	      buttonPanelConstraintsright.gridy = 4;
	      buttonPanelConstraintsright.gridwidth = 1;
	      gridBagLayoutright.setConstraints(searchHashSetBtn, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchHashSetBtn, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 1;
	      buttonPanelConstraintsright.gridy = 4;
	      buttonPanelConstraintsright.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutright.setConstraints(searchHashSetBtnLabel, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchHashSetBtnLabel, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 0;
	      buttonPanelConstraintsright.gridy = 5;
	      buttonPanelConstraintsright.gridwidth = 1;
	      gridBagLayoutright.setConstraints(searchArrayListBtn , buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchArrayListBtn , buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 1;
	      buttonPanelConstraintsright.gridy = 5;
	      buttonPanelConstraintsright.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutright.setConstraints(searchArrayListBtnLabel, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchArrayListBtnLabel, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 0;
	      buttonPanelConstraintsright.gridy = 6;
	      buttonPanelConstraintsright.gridwidth = 1;
	      gridBagLayoutright.setConstraints(searchSortedArrayListBtn, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchSortedArrayListBtn, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 1;
	      buttonPanelConstraintsright.gridy = 6;
	      buttonPanelConstraintsright.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutright.setConstraints(searchSortedArrayListBtnLabel, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchSortedArrayListBtnLabel, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 0;
	      buttonPanelConstraintsright.gridy = 7;
	      buttonPanelConstraintsright.gridwidth = 1;
	      gridBagLayoutright.setConstraints(searchArrayBtn, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchArrayBtn, buttonPanelConstraintsright);
	      buttonPanelConstraintsright.gridx = 1;
	      buttonPanelConstraintsright.gridy = 7;
	      buttonPanelConstraintsright.gridwidth = GridBagConstraints.REMAINDER;
	      gridBagLayoutright.setConstraints(searchArrayBtnLabel, buttonPanelConstraintsright);
	      rightbuttonPanel.add(searchArrayBtnLabel, buttonPanelConstraintsright);
	      ButtonActionListener searchedsortBtnListner = new ButtonActionListener(searchSortedIntsBtn);
	      searchSortedIntsBtn.addActionListener(searchedsortBtnListner);
	      ButtonActionListener searchedaddToBSTListener = new ButtonActionListener(searchBstBtn);
	      searchBstBtn.addActionListener(searchedaddToBSTListener);
	      ButtonActionListener searchTreeSetBtnListener = new ButtonActionListener(searchTreeSetBtn);
	      searchTreeSetBtn.addActionListener(searchTreeSetBtnListener);
	      ButtonActionListener searchPriorityQueueBtnListener = new ButtonActionListener(searchPriorityQueueBtn);
	      searchPriorityQueueBtn.addActionListener(searchPriorityQueueBtnListener);
	      ButtonActionListener searchHashSetBtnListener = new ButtonActionListener(searchHashSetBtn);
	      searchHashSetBtn.addActionListener(searchHashSetBtnListener);
	      ButtonActionListener searchArrayListBtnListener = new ButtonActionListener(searchArrayListBtn);
	      searchArrayListBtn.addActionListener(searchArrayListBtnListener);
	      ButtonActionListener searchSortedArrayListBtnListener = new ButtonActionListener(searchSortedArrayListBtn);
	      searchSortedArrayListBtn.addActionListener(searchSortedArrayListBtnListener);
	      ButtonActionListener searchArrayBtnListener = new ButtonActionListener(searchArrayBtn);
	      searchArrayBtn.addActionListener(searchArrayBtnListener);    
	      sortInBtn.setEnabled(false);
	      addToBstBtn.setEnabled(false);
	      addToTreeSetBtn.setEnabled(false);
	      addToPriorityQueueBtn.setEnabled(false);
	      addToHashSetBtn.setEnabled(false);
	      addToArrayListBtn.setEnabled(false);
	      addToSortedArrayListBtn.setEnabled(false);
	      addToArrayBtn.setEnabled(false);
	      searchSortedIntsBtn.setEnabled(false);
	      searchBstBtn.setEnabled(false);
	      searchTreeSetBtn.setEnabled(false);
	      searchPriorityQueueBtn.setEnabled(false);
	      searchHashSetBtn.setEnabled(false);
	      searchArrayListBtn.setEnabled(false);
	      searchSortedArrayListBtn.setEnabled(false);
	      searchArrayBtn.setEnabled(false);
	      f.setContentPane(mainPanel);
	      f.validate();
	      f.setVisible(true);
	}
	
   	static class ButtonActionListener implements java.awt.event.ActionListener
  	{
     
	      private javax.swing.JButton test;	    
	      ButtonActionListener(javax.swing.JButton test)
	      {
		  this.test = test;
	      }
    
      	public void actionPerformed(java.awt.event.ActionEvent e)
      	{
        System.out.println("action performed on " + test.getText() + " button");
		if(test.getText().toLowerCase().equals("sort ints")) 
		{
			long alpha = System.currentTimeMillis();
			selectionSort();
			long beta = System.currentTimeMillis();
			long t = beta - alpha;
			sortIntLabel.setText(t + "ms");
			btn1 = true;
              		if (readDone) 
              		{
                 	searchSortedIntsBtn.setEnabled(true);
              		}
          	}
          	if(test.getText().toLowerCase().equals("search sort ints")) 
          	{
			long alpha = System.currentTimeMillis();
			searchInts();
			long beta = System.currentTimeMillis();
			long t = beta - alpha;
			searchSortedIntLabel.setText(searchInts() + "/" + t + "ms");
            
          	}
          	if(test.getText().toLowerCase().equals("add to bst")) 
          	{
		       long alpha = System.currentTimeMillis();
		       addToBinarySearchTree();
		       long beta = System.currentTimeMillis();
		       long t = beta - alpha;
		       addToBstLabel.setText(t + "ms");
		       btn2 = true;
		       System.out.print("btn2 is "+ btn2);
		        
              		if (readDone) 
              		{
				  System.out.print("enabled");
				  searchBstBtn.setEnabled(true);
              		}
          	}
          	if(test.getText().toLowerCase().equals("search bst")) //f
          	{
		      long alpha = System.currentTimeMillis();
		      searchBinarySearchTree();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      searchBstBtnLabel.setText(searchBinarySearchTree() + "/" + t + "ms");
            
          	}
          	if(test.getText().toLowerCase().equals("add to tree set")) 
          	{
		      long alpha = System.currentTimeMillis();
		      addToTreeSet();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      addToTreeSetLabel.setText(t + "ms");
		      btn3 = true;
              		if (readDone == true) 
              		{
                 	 searchTreeSetBtn.setEnabled(true);
              		}
          	}
          	if(test.getText().toLowerCase().equals("search tree set")) 
          	{
		      long alpha = System.currentTimeMillis();
		      searchTreeSet();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      searchTreeSetBtnLabel.setText(searchTreeSet() + "/" + t + "ms");
            
          	}
          	if(test.getText().toLowerCase().equals("add to hashset")) 
          	{
		      long alpha = System.currentTimeMillis();
		      addToHashSet();
		      long beta= System.currentTimeMillis();
		      long t = beta - alpha;
		      addToHashSetLabel.setText(t + "ms");
		      btn4 = true;
              		if (readDone == true) 
              		{
                  	 searchHashSetBtn.setEnabled(true);
              		}
          	}
          	if(test.getText().toLowerCase().equals("search hashset")) 
          	{
		      long alpha = System.currentTimeMillis();
		      searchHashSet();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      searchHashSetBtnLabel.setText(searchHashSet() + "/" + t + "ms");
            
          	}
          	if(test.getText().toLowerCase().equals("add to priority queue")) 
          	{
		      long alpha = System.currentTimeMillis();
		      addToPriorityQueue();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      addToPriorityQueueLabel.setText(t + "ms");
		      btn5 = true;
              		if (readDone == true) 
              		{
                  	searchPriorityQueueBtn.setEnabled(true);
              		}
          	}
          	if(test.getText().toLowerCase().equals("search priority queue")) 
          	{
		      long alpha = System.currentTimeMillis();
		      searchPriorityQueue();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
             	      searchPriorityQueueBtnLabel.setText(searchPriorityQueue() + "/" + t + "ms");
            
          	}
          	if(test.getText().toLowerCase().equals("add to array list")) 
          	{
		      long alpha = System.currentTimeMillis();
		      addToArrayList();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      addToArrayListLabel.setText(t + "ms");
		      btn6 = true;
              		if (readDone == true) 
              		{
                  	searchArrayListBtn.setEnabled(true);
              		}
          	}
          	if(test.getText().toLowerCase().equals("search array list")) 
          	{
		      System.out.println("started Search array list");
		      long alpha = System.currentTimeMillis();
		      searchArrayList();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      searchArrayListBtnLabel.setText(searchArrayList() + "/" + t + "ms");
            
          	}
          	if(test.getText().toLowerCase().equals("add to sorted arraylist")) 
          	{
		      long alpha = System.currentTimeMillis();
		      addToSortedArrayList();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      addToSortedArrayListLabel.setText(t + "ms");
		      btn7 = true;
              	if (readDone == true) 
              		{
                  	searchSortedArrayListBtn.setEnabled(true);
              		}
          	}
          	if(test.getText().toLowerCase().equals("search sorted arraylist")) 
          	{
		      long alpha = System.currentTimeMillis();
		      searchSortedArrayList();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      searchSortedArrayListBtnLabel.setText(searchSortedArrayList() + "/" + t + "ms");
            
          	}
          	if(test.getText().toLowerCase().equals("add to array")) 
          	{
		      long alpha = System.currentTimeMillis();
		      addToArray();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      addToArrayLabel.setText(t + "ms");
		      btn8 = true;
              		if (readDone == true) 
              		{
                  	searchArrayBtn.setEnabled(true);
              		}
            
          	}
          	if(test.getText().toLowerCase().equals("search array")) 
          	{
		      long alpha = System.currentTimeMillis();
		      searchArray();
		      long beta = System.currentTimeMillis();
		      long t = beta - alpha;
		      searchArrayBtnLabel.setText(searchArray() + "/" + t + "ms");
            
          	}
      	}
   }
   	// action listener for the menu items
  	static class MenuItemActionListener implements java.awt.event.ActionListener
  	{
      	// the menu item associated with the action listener, so that we can
      	// share this one class with multiple menu items
      	private javax.swing.JMenuItem test1;
      	MenuItemActionListener(javax.swing.JMenuItem test1)
      		{
          	this.test1 = test1;
      		}
    
      	public void actionPerformed(java.awt.event.ActionEvent e)
      	{
		  System.out.println("action performed on " + test1.getText() + " menu item");
		
		  // if exit is selected from the file menu, exit the program
		  if( test1.getText().toLowerCase().equals("exit") )
		  {
		      System.exit(0);
		  }
		  if( test1.getText().toLowerCase().equals("read sort file") )
		  {
		      System.out.println(sort);
		      readData(sort, true);
		      System.out.println("Done!");
		      sortInBtn.setEnabled(true);
		      addToBstBtn.setEnabled(true);
		      addToTreeSetBtn.setEnabled(true);
		      addToPriorityQueueBtn.setEnabled(true);
		      addToHashSetBtn.setEnabled(true);
		      addToArrayListBtn.setEnabled(true);
		      addToSortedArrayListBtn.setEnabled(true);
		      addToArrayBtn.setEnabled(true);
		  }
		  if( test1.getText().toLowerCase().equals("read search file") )
		  {
		      readData(search, false);
		      readDone = true;
		      if (btn1 == true) {
		          searchSortedIntsBtn.setEnabled(true);
		      }
		      if (btn2 == true) {
		          System.out.print("BTN is true and enabling");
		          searchBstBtn.setEnabled(true);
		          System.out.print("enabled");
		      }
		      if (btn3 == true) {
		          searchTreeSetBtn.setEnabled(true);
		      }
		      if (btn5 == true) {
		          searchPriorityQueueBtn.setEnabled(true);
		      }
		      if (btn4 == true) {
		          searchHashSetBtn.setEnabled(true);
		      }
		      if (btn6 == true) {
		          searchArrayListBtn.setEnabled(true);
		      }
		      if (btn7 == true) {
		          searchSortedArrayListBtn.setEnabled(true);
		      }
		      if (btn8 == true) {
		          searchArrayBtn.setEnabled(true);
		      }
		     
		  }
	  }
  	 }
  	 private static void readData(String filename, boolean readSortValues) 
  	 {
      	 	try 
      	 	{
		  BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(filename)));
		  String line;
		  ArrayList<Integer> inputValueList = new ArrayList<Integer>();
		  while((line = input.readLine()) != null) 
		  {
		      if(line.trim().length() > 0) 
		      { 
		          inputValueList.add(Integer.parseInt(line));
              	      }
          	  }
          		if(readSortValues) 
          		{
              	  sortData = new int[inputValueList.size()];
              	  System.out.println(sortData.length);
              	  		for(int i = 0; i < inputValueList.size(); i++) 
              			{
                  		sortData[i] = inputValueList.get(i);
              			}
          		}
        
          		else 
          		{
			searchData = new int[inputValueList.size()];
			System.out.println(searchData.length);
			      for(int i = 0; i < inputValueList.size(); i++) 
			      {
                  		searchData[i] = inputValueList.get(i);
             		      }
          		}
          		input.close();
      			}
      		catch(Exception e) 
      		{
          	System.out.println(e);
        	}
  	}
  	private static void selectionSort() 
  	{
      	sortedData = new int[sortData.length];
    
      	for (int i = 0; i < sortData.length; i++) 
      		{
          		sortedData[i] = sortData[i];
      		}
      	for (int j = 0; j < sortedData.length - 1; j++) 
      		{
		  int minVal = j;
		  for (int x = j + 1; x < sortedData.length; x++) 
		  {
		      if (sortedData[x] < sortedData[minVal]) 
		      	{
		          minVal = x;
              		}
            
          	  }
          int temp = sortedData[minVal];
          sortedData[minVal] = sortedData[j];
          sortedData[j] = temp;
      		}
    
  	}
  	private static int searchInts() 
  	{
      	  int a = 0;
      	  for (int i = 0; i < searchData.length; i++) 
      	  {
          int b = 0;
          int c = sortedData.length - 1;
          while (b <= c) 
          	{
		      int d = ((b + c) / 2);
		      if (searchData[i] < sortedData[d]) 
		      {
                  	c = d - 1;
              	      }
                      else 
                      {
		      if (searchData[i] > sortedData[d]) 
		              {
		              	b = d + 1;
		              }
		              else 
		              {
		                a++;
		                break;
		              }
             	      }
          	}
      	  }
      	return a;
  	}
  	private static void addToBinarySearchTree() 
  	{
        binarysearchTree = new BinarySearchTree();
        for(int i = 0; i < sortData.length; i++) 
      		{
		  Node n = new Node(sortData[i]);
		  binarysearchTree.insertNode(n);
      		}
  	}	
  	private static int searchBinarySearchTree() 
  	{
      	int x = 0;
      	for(int i = 0; i < searchData.length; i++) 
      		{
          	if (binarysearchTree.getNode(binarysearchTree.getRoot(), searchData[i]) != null) 
		  	{
		      	x++;
		  	}
      		}
      	return x;
  	}
	private static void addToTreeSet() 
	{
	      if (treeSet.size() > 0) 
	      {
		  treeSet.clear();
	      }
	      for(int i = 0; i<sortData.length; i++) 
	      {
		  treeSet.add(sortData[i]);
	      }
	}
	private static int searchTreeSet() 
	{
	      int x = 0;
	      for(int i = 0; i<searchData.length;i++) 
	      {
		  if(treeSet.contains(searchData[i])) 
		  {
		      x++;
		  }
	      }
	      return x;
	}
	private static void addToHashSet() 
	{
	      if(hashSet.size() > 0) 
	      {
		  hashSet.clear();
	      }
	      for(int i = 0; i<sortData.length;i++) 
	      	{
		  hashSet.add(sortData[i]);
	      	}
	}
	private static int searchHashSet() 
	{
	      int x = 0;
	      for(int i = 0; i < searchData.length; i++) 
	      {
		  if(hashSet.contains(searchData[i])) 
		  {
		      x++;
		  }
	      }
	      return x;
	}
	private static void addToPriorityQueue() 
	{
	      if (priorityQueue.size() > 0) 
	      {
		  priorityQueue.clear();
	      }
	      for(int i = 0; i<sortData.length; i++) 
	      	{
		  priorityQueue.add(sortData[i]);
	      	}
	}
	private static int searchPriorityQueue() 
	{
	      int x = 0;
	      for(int i = 0; i < searchData.length;i++) 
	      {
		  if(priorityQueue.contains(searchData[i])) 
		  {
		      x++;
		  }
	      }
	      return x;
	  }
	private static void addToArrayList() 
	{
	      if (arrayList.size() > 0) 
	      {
		  arrayList.clear();
	      }
	      for(int i = 0; i < sortData.length; i++) 
	      	{
		  arrayList.add(sortData[i]);
	      	}
	 }
	 private static int searchArrayList() 
	 {
	      int x = 0;
	      for(int i = 0; i<searchData.length;i++) 
	      {
		  if(arrayList.contains(searchData[i])) 
		  {
		      x++;
		  }
	      }
	      return x;
	 }
	 private static void addToSortedArrayList() 
	 {
	      if (arraySortList.size() > 0) 
	      {
		  arraySortList.clear();
	      }
	      for(int i = 0; i < sortData.length; i++) 
	      	{
		  arraySortList.add(sortData[i]);
	      	}
	      Collections.sort(arraySortList);
	 }
	 private static int searchSortedArrayList() 
	 {
	      int x = 0;
	      for(int i = 0; i < searchData.length; i++) 
	      {
		  if(Collections.binarySearch(arraySortList, searchData[i]) >= 0) 
		  {
		      x++;
		  }
	      }
	      return x;
	 }
	 private static void addToArray() 
	 {
	      sortList = new int[sortData.length];
	      for(int i = 0; i < sortData.length;i++) 
	      {
		  sortList[i] = sortData[i];
	      }
	 }
	 private static int searchArray() 
	 {
	      int x = 0;
	      for (int i = 0; i < searchData.length; i++) 
	      {
		  for (int j = 0; j < sortList.length; j++) 
		  {
		      if (searchData[i] == sortList[j]) 
		      {
		          x++;
		      }
		  }
	      }
	      return x;
  	}
}
 
 



