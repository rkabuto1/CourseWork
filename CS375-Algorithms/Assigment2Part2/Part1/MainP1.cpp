#include <iostream>
#include "P1.h"

using namespace std;

int main() {
    int n = 10000; 
    vector<Point2D> pts2D(n);
    for (int i = 0; i < n; ++i) {
        pts2D[i].x = n - i;
        pts2D[i].y = n - i;
    }

    int i_min, j_min;
    double minD2D = pair2D(pts2D, i_min, j_min);
    cout << "Closest Pair Distance For 2D: " << minD2D << endl;
    cout << "Points: (" << pts2D[i_min].x << ", " << pts2D[i_min].y << ") and ("
         << pts2D[j_min].x << ", " << pts2D[j_min].y << ")" << endl;

   
    vector<Point3D> pts3D(n);
    for (int i = 0; i < n; ++i) {
        pts3D[i].x = n - i;
        pts3D[i].y = n - i;
        pts3D[i].z = i;
    }

    double minD3D = pair3D(pts3D, i_min, j_min);
    cout << "Closest Pair Distance For 3D: " << minD3D << endl;
    cout << "Points: (" << pts3D[i_min].x << ", " << pts3D[i_min].y << ", " << pts3D[i_min].z << ") and ("
         << pts3D[j_min].x << ", " << pts3D[j_min].y << ", " << pts3D[j_min].z << ")" << endl;

    return 0;
}

