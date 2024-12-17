#include "CitiesQ1.h"
#include <iostream>
#include <algorithm>
#include <climits>
#include <chrono>
#include <vector>

int main() {
    std::vector<std::vector<int>> Q1PathData = {
        {0, 140, INT_MAX, INT_MAX, INT_MAX, 180, 100, 70, INT_MAX, INT_MAX, INT_MAX},
        {140, 0, 130, INT_MAX, 100, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX},
        {INT_MAX, 130, 0, 160, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX},
        {INT_MAX, INT_MAX, 160, 0, 65, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, 180},
        {INT_MAX, 100, INT_MAX, 65, 0, 70, INT_MAX, INT_MAX, 70, INT_MAX, INT_MAX},
        {180, INT_MAX, INT_MAX, INT_MAX, 70, 0, 60, INT_MAX, INT_MAX, INT_MAX, INT_MAX},
        {100, INT_MAX, INT_MAX, INT_MAX, INT_MAX, 60, 0, 65, INT_MAX, INT_MAX, INT_MAX},
        {70, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, 65, 0, INT_MAX, INT_MAX, INT_MAX},
        {INT_MAX, INT_MAX, INT_MAX, INT_MAX, 70, INT_MAX, INT_MAX, INT_MAX, 0, 60, INT_MAX},
        {INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, 60, 0, 100},
        {INT_MAX, INT_MAX, INT_MAX, 180, INT_MAX, INT_MAX, INT_MAX, INT_MAX, INT_MAX, 100, 0}
    };

    std::vector<std::vector<int>> pred(11, std::vector<int>(11, -1));

    for (int index = 0; index < 121; ++index) {
        int r = index / 11;
        int c = index % 11;
        if (Q1PathData[r][c] != INT_MAX && r != c) {
            pred[r][c] = r;
        }
    }

    auto startTime = std::chrono::high_resolution_clock::now();
    floydAlg(Q1PathData, pred);
    auto endTime = std::chrono::high_resolution_clock::now();

    std::chrono::duration<double> elapsedTime = endTime - startTime;
    std::cout << "Running Time: " << elapsedTime.count() << " seconds.\n";

    DTable(Q1PathData);
    PTable(pred);
    
    for (int index = 0; index < 121; ++index) {
    	int r = index / 11;
    	int c = index % 11;

    if (r == c) {
        continue;  
    	} else if (Q1PathData[r][c] != INT_MAX) {
        	std::cout << "The Shortest Path From City Edge " << r + 1 << " to City Edge " << c + 1
                  	<< " is the path: ";
        	showPath(CalcPath(r, c, pred));
        	std::cout << "With path cost " << Q1PathData[r][c] << std::endl;
    	} else {
        	std::cout << "No path available from City Edge " << r + 1 << " to City Edge " << c + 1 << std::endl;
        }
    }

    return 0;
}

