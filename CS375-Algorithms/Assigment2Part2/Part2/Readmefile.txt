--------------------------------------------------------------------------------------------------------------------------------
This project compares two different algorithms for solving the Closest Pair of Points problem: 
	1) Brute Force  
	2) Divide and Conquer. 

The goal is to find the pair of points that are closest to each other in both 2D and 3D spaces. 

The Brute Force approach is a method that iterates through all pairs of points, which results in a time complexity of O(n²), While easy to implement, the brute force approach becomes inefficient as the dataset size grows because it examines every possible combination of points, making it slow for large datasets. While, the Divide and Conquer approach is more efficient and uses a recursive method to split the set of points into 1/2, based on their x-coordinates. The time complexity of this algorithm is O(n log n), making it faster than brute force. 

--------------------------------------------------------------------------------------------------------------------------------
How to Run)

To see the outputfile. 
1) Run Make
2) "gedit outputFile.txt"
3) "gedit inputFile.txt" 
 
This produces the corresponding inputfile that got the results from the output file.
Imporant - I coded this so that you are able to put the large datasets inside the main and it iterates through and outputs 
the large data set into an inputfile so its a lot easier to access and utilize

4) Make Clean to remove outputfile, inputfile, and exectuables

The project also makes use of a Makefile that automates the creation of an input file, compiles the code, and runs the program based on the generated input. The input file, `inputFile.txt`, contains 10,000 randomly generated points for both 2D and 3D spaces. 

After the input file is created, the program is compiled and upon running the executable, the program reads the points from the input file, applies both the brute force and divide-and-conquer algorithms, and writes the results, including the closest pair and the time taken by each algorithm, to an output file named `outputFile.txt`.
--------------------------------------------------------------------------------------------------------------------------------
Explanation of my code)

The major code sections include implementations of the brute force and divide-and-conquer algorithms. 

bruteForce2D and bruteForce3D) This uses the brute force methods, in which every pair of points is compared, and their distances are calculated. The functions return the smallest distance found, along with the indices of the closest pair of points.

pair2D and pair3D) implemented The divide and conquer approach, implemented in recursively divides the points into halves and finds the closest pair within each half and across the dividing line. 

stripMin2D and stripMin3D) handle the special case where the closest pair of points may be in the strip near the dividing line, using the comparison of points by limiting it to nearby points based on their y-coordinates.

--------------------------------------------------------------------------------------------------------------------------------

