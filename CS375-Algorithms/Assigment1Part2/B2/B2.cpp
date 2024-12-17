#include "B2.h"
#include <iostream>
#include <algorithm>
#include <chrono>

using namespace std;

void B2Func(vector<int>& data, int fSum) {
    auto start = chrono::high_resolution_clock::now();
      
    sort(data.begin(), data.end());
    int b_array = 0;
    int e_array = data.size() - 1;
    int count = 0;  
    
    while (b_array < e_array) {
        int cSum = data[b_array] + data[e_array];
        if (cSum > fSum) {
            e_array--;
        } else if (cSum < fSum) {
            b_array++; 
        } else {
            cout << data[b_array] << " + " << data[e_array] << " = " << fSum << endl;
            count++;
            b_array++;
            e_array--;
        }
    }

    if (count == 0) {
        cout << "No Pairs Found For " << fSum << "." << endl;
    }
     
    auto stop = chrono::high_resolution_clock::now();
    chrono::duration<double> timeTaken = stop - start;
    cout << "Running Time in Seconds:  " << timeTaken.count() << endl;
}

