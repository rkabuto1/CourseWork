#ifndef CITIESQ1_H
#define CITIESQ1_H
#include <vector>
#include <climits>

void initializeMatrix(std::vector<std::vector<int>>& matrix);
void floydAlg(std::vector<std::vector<int>>& dist, std::vector<std::vector<int>>& pred);
void showPath(const std::vector<int>& path);
void DTable(const std::vector<std::vector<int>>& pathVals);
void PTable(const std::vector<std::vector<int>>& p);
std::vector<int> CalcPath(int s, int e, const std::vector<std::vector<int>>& p);


#endif

