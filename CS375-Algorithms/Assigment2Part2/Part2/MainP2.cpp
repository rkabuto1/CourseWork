#include "P2.h"
#include <fstream>
#include <sstream>
#include <vector>
#include <iostream>
#include <algorithm>
#include <chrono>

using namespace std;
using namespace std::chrono;

int main() {
    int n = 10000;
    ofstream inputFile("inputFile.txt");
    if (!inputFile.is_open()) {
        cerr << "Error: Could not open the input file for writing!" << endl;
        return 1;
    }

    inputFile << "2D Points:\n";
    vector<Point2D> points2D;
    for (int i = 0; i < n; ++i) {
        double x = static_cast<double>(n - i);
        double y = static_cast<double>(n - i);
        points2D.push_back({x, y});
        inputFile << x << " " << y << "\n";
    }

    inputFile << "\n3D Points:\n";
    vector<Point3D> points3D;
    for (int i = 0; i < n; ++i) {
        double x = static_cast<double>(i * i);
        double y = static_cast<double>(i * i);
        double z = static_cast<double>(i);
        points3D.push_back({x, y, z});
        inputFile << x << " " << y << " " << z << "\n";
    }
    inputFile.close();

    ofstream outFile("outputFile.txt");
    if (!outFile.is_open()) {
        cerr << "Error: Could not open the output file!" << endl;
        return 1;
    }

    int min_i, min_j;
    double minDist = 0.0;

    // Brute Force 2D
    auto start2D_brute = high_resolution_clock::now();
    minDist = bruteForce2D(points2D, min_i, min_j);
    auto stop2D_brute = high_resolution_clock::now();
    auto duration2D_brute = duration_cast<milliseconds>(stop2D_brute - start2D_brute);

    outFile << "Brute Force 2D Closest pair distance: " << minDist << endl;
    outFile << "Points: (" << points2D[min_i].x << ", " << points2D[min_i].y << ") and (" 
            << points2D[min_j].x << ", " << points2D[min_j].y << ")" << endl;
    outFile << "Time 2D: " << duration2D_brute.count() << " ms\n\n";


    auto start2D_divide = high_resolution_clock::now();
    minDist = pair2D(points2D, min_i, min_j);  
    auto stop2D_divide = high_resolution_clock::now();
    auto duration2D_divide = duration_cast<milliseconds>(stop2D_divide - start2D_divide);

    outFile << "Divide and Conquer 2D Closest pair distance: " << minDist << endl;
    outFile << "Points: (" << points2D[min_i].x << ", " << points2D[min_i].y << ") and (" 
            << points2D[min_j].x << ", " << points2D[min_j].y << ")" << endl;
    outFile << "Time 2D: " << duration2D_divide.count() << " ms\n\n";


    auto start3D_brute = high_resolution_clock::now();
    minDist = bruteForce3D(points3D, min_i, min_j);
    auto stop3D_brute = high_resolution_clock::now();
    auto duration3D_brute = duration_cast<milliseconds>(stop3D_brute - start3D_brute);

    outFile << "Brute Force 3D Closest pair distance: " << minDist << endl;
    outFile << "Points: (" << points3D[min_i].x << ", " << points3D[min_i].y << ", " << points3D[min_i].z << ") and ("
            << points3D[min_j].x << ", " << points3D[min_j].y << ", " << points3D[min_j].z << ")" << endl;
    outFile << "Time 3D: " << duration3D_brute.count() << " ms\n\n";

    
    auto start3D_divide = high_resolution_clock::now();
    minDist = pair3D(points3D, min_i, min_j);  
    auto stop3D_divide = high_resolution_clock::now();
    auto duration3D_divide = duration_cast<milliseconds>(stop3D_divide - start3D_divide);

    outFile << "Divide and Conquer 3D Closest pair distance: " << minDist << endl;
    outFile << "Points: (" << points3D[min_i].x << ", " << points3D[min_i].y << ", " << points3D[min_i].z << ") and ("
            << points3D[min_j].x << ", " << points3D[min_j].y << ", " << points3D[min_j].z << ")" << endl;
    outFile << "Time 3D: " << duration3D_divide.count() << " ms\n\n";

    outFile.close();
    return 0;
}

