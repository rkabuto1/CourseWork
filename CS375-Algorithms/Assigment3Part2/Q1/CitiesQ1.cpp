#include "CitiesQ1.h"
#include <iostream>
#include <algorithm>
#include <climits>
void floydAlg(std::vector<std::vector<int>>& dist, std::vector<std::vector<int>>& pred) {
    for (int k = 0; k < 11; ++k) {
        for (int i = 0; i < 11; ++i) {
            for (int j = 0; j < 11; ++j) {
                if (dist[i][k] != INT_MAX && dist[k][j] != INT_MAX && dist[i][j] > dist[i][k] + dist[k][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                    pred[i][j] = pred[k][j];
                }
            }
        }
    }
}
std::vector<int> CalcPath(int s, int e, const std::vector<std::vector<int>>& p) {
    std::vector<int> r;
    if (p[s][e] == -1) 
    	return r; 
    do {
        r.push_back(e);
        e = p[s][e];
    } while (s != e);

    r.push_back(s);
    std::reverse(r.begin(), r.end());
    return r;
}
void showPath(const std::vector<int>& path) {
    for (size_t index = 0; index < path.size(); ++index) {
        std::cout << path[index] + 1;
        if (index != path.size() - 1) std::cout << " -> ";
    }
    std::cout << std::endl;
}
void DTable(const std::vector<std::vector<int>>& pathVals) {
    std::cout << "\nD Table:\n";
    for (const auto& row : pathVals) {
        for (const auto& element : row) {
            if (element != INT_MAX) {
                std::cout << element << "\t";
            } else {
                std::cout << "INF\t";
            }
        }
        std::cout << "\n";
    }
}
void PTable(const std::vector<std::vector<int>>& p) {
    std::cout << "\nP Table:\n";
    for (const auto& row : p) {
        for (const auto& element : row) {
            if (element != -1) {
                std::cout << element + 1 << "\t";
            } else {
                std::cout << "0\t";
            }
        }
        std::cout << "\n";
    }
}


