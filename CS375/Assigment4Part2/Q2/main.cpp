#include "Q2.h"
#include <iostream>
#include <chrono>
#include <vector>

using namespace std;
using namespace chrono;

int main()
{
    auto start = high_resolution_clock::now();

    Simplex simp(
        {{60, 60, 1, 0, 0},
         {12, 6, 0, 1, 0},  
         {10, 30, 0, 0, 1}},
         {300, 36, 90},        
         {-0.12, -0.15, 0, 0, 0} 
    );

    simp.run();

    auto stop = high_resolution_clock::now();
    auto dur = duration_cast<microseconds>(stop - start);

    cout << "Run time: " << dur.count() << " microseconds" << endl;

    return 0;
}

