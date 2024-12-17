#ifndef P2_H
#define P2_H

#include <vector>

struct Point2D {
    double x, y;
};

struct Point3D {
    double x, y, z;
};

double bruteForce2D(std::vector<Point2D>& points, int& min_i, int& min_j);
double bruteForce3D(std::vector<Point3D>& points, int& min_i, int& min_j);
double pair2D(std::vector<Point2D>& points, int& min_i, int& min_j); 
double pair3D(std::vector<Point3D>& points, int& min_i, int& min_j);  

#endif

