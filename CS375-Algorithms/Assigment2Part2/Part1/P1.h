#ifndef P1_H
#define P1_H

#include <vector>

struct Point2D {
    double x, y;
}; 
struct Point3D {
    double x, y, z;
};

double pair2D(std::vector<Point2D>& pts, int& i_min, int& j_min);
double pair3D(std::vector<Point3D>& pts, int& i_min, int& j_min);

#endif

