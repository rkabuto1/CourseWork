#include "P1.h"
#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>
#include <float.h>

using namespace std;

double d2(const Point2D& pA, const Point2D& pB) {
    double diffX = pA.x - pB.x;
    double diffY = pA.y - pB.y;
    double xSquared = diffX * diffX;
    double ySquared = diffY * diffY;
    double sum = xSquared + ySquared;
    return sqrt(sum);
}
double d3(const Point3D& pA, const Point3D& pB) {
    double dx = pA.x - pB.x;
    double dy = pA.y - pB.y;
    double dz = pA.z - pB.z;
    double dx2 = dx * dx;
    double dy2 = dy * dy;
    double dz2 = dz * dz;   
    double distSquared = dx2 + dy2 + dz2;
    return sqrt(distSquared);
}
double minVal(double a, double b) {
    if (a < b) {
        return a;
    } else {
        return b;
    }
}


double stripMin2D(vector<Point2D>& vec, double dist, int& i_min, int& j_min) {
    double minD = dist;
    sort(vec.begin(), vec.end(), [](const Point2D& a, const Point2D& b) 
    { return a.y < b.y; });

    for (size_t x = 0; x < vec.size(); ++x) {
        for (size_t y = x + 1; y < vec.size() && (vec[y].y - vec[x].y) < minD; ++y) {
            double newDist = d2(vec[x], vec[y]);
            if (newDist < minD) {
                minD = newDist;
                i_min = x;
                j_min = y;
            }
        }
    }
    return minD;
}

double util2D(vector<Point2D>& pts, vector<Point2D>& tmp, int l, int r, int& i_min, int& j_min) {
    if (r - l > 1) {
        int m = (l + r) / 2;
        int il_min, jl_min, ir_min, jr_min;       
        double leftDist = util2D(pts, tmp, l, m, il_min, jl_min);
        double rightDist = util2D(pts, tmp, m, r, ir_min, jr_min);
        i_min = il_min;
        j_min = jl_min;

        double minDist = leftDist;
        if (rightDist < leftDist) {
            i_min = ir_min;
            j_min = jr_min;
            minDist = rightDist;
        }
        Point2D midPt = pts[m];        
        merge(pts.begin() + l, pts.begin() + m, pts.begin() + m, pts.begin() + r, tmp.begin() + l,
              [](const Point2D& a, const Point2D& b) { return a.y < b.y; });
        for (int i = l; i < r; ++i) {
            pts[i] = tmp[i];
        }
        vector<Point2D> stripPts;
        for (int i = l; i < r; ++i) {
            if (fabs(pts[i].x - midPt.x) < minDist) {
                stripPts.push_back(pts[i]);
            }
        }
        double stripMinDist = stripMin2D(stripPts, minDist, i_min, j_min);
        return minVal(minDist, stripMinDist);
    }
    return DBL_MAX;
}


double stripMin3D(vector<Point3D>& vec, double dist, int& i_min, int& j_min) {
    double minD = dist;
    sort(vec.begin(), vec.end(), [](const Point3D& a, const Point3D& b) { return a.y < b.y; });

    for (size_t x = 0; x < vec.size(); ++x) {
        for (size_t y = x + 1; y < vec.size() && (vec[y].y - vec[x].y) < minD; ++y) {
            double newDist = d3(vec[x], vec[y]);
            if (newDist < minD) {
                minD = newDist;
                i_min = x;
                j_min = y;
            }
        }
    }
    return minD;
}


double util3D(vector<Point3D>& pts, vector<Point3D>& tmp, int l, int r, int& i_min, int& j_min) {
    if (r - l > 1) {
        int m = (l + r) / 2;
        int il_min, jl_min, ir_min, jr_min;        
        double leftDist = util3D(pts, tmp, l, m, il_min, jl_min);
        double rightDist = util3D(pts, tmp, m, r, ir_min, jr_min);
        i_min = il_min;
        j_min = jl_min;

        double minDist = leftDist;
        if (rightDist < leftDist) {
            i_min = ir_min;
            j_min = jr_min;
            minDist = rightDist;
        }
        Point3D midPt = pts[m];       
        merge(pts.begin() + l, pts.begin() + m, pts.begin() + m, pts.begin() + r, tmp.begin() + l,
              [](const Point3D& a, const Point3D& b) { return a.y < b.y; });
        for (int i = l; i < r; ++i) {
            pts[i] = tmp[i];
        }
        vector<Point3D> stripPts;
        for (int i = l; i < r; ++i) {
            if (fabs(pts[i].x - midPt.x) < minDist) {
                stripPts.push_back(pts[i]);
            }
        }

        double stripMinDist = stripMin3D(stripPts, minDist, i_min, j_min);
        return minVal(minDist, stripMinDist);
    }
    return DBL_MAX;
}


double pair2D(vector<Point2D>& pts, int& i_min, int& j_min) {
    vector<Point2D> tmp(pts.size());
    return util2D(pts, tmp, 0, pts.size(), i_min, j_min);
}

double pair3D(vector<Point3D>& pts, int& i_min, int& j_min) {
    vector<Point3D> tmp(pts.size());
    return util3D(pts, tmp, 0, pts.size(), i_min, j_min);
}

