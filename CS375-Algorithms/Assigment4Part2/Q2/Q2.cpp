#include "Q2.h"
#include <iostream>
#include <cmath>
#include <algorithm>
#include <limits>

Simplex::Simplex(std::vector<std::vector<float>> matInit, std::vector<float> bInit, std::vector<float> cInit)
{
    maxVal = 0;
    unbound = false;
    r = matInit.size();
    c = matInit[0].size();
    mat = matInit;
    bVals = bInit;
    cVals = cInit;
}

bool Simplex::isOptimal()
{
    size_t posCount = std::count_if(cVals.begin(), cVals.end(), [](float v) { return v >= 0; });
    return posCount == cVals.size();
}

size_t Simplex::minCol()
{
    return std::distance(cVals.begin(), std::min_element(cVals.begin(), cVals.end()));
}

bool Simplex::calc()
{
    if (isOptimal())
        return true;
    size_t pCol = minCol();
    if (unbound)
    {
        std::cout << "Error: unbounded solution" << std::endl;
        return true;
    }
    size_t pRow = minRow(pCol);
    pivot(pRow, pCol);
    return false;
}

void Simplex::pivot(size_t rIdx, size_t cIdx)
{
    float pVal = mat[rIdx][cIdx];
    std::vector<float> newRow(c);

    maxVal -= cVals[cIdx] * (bVals[rIdx] / pVal);

    for (size_t i = 0; i < c; i++) {
        newRow[i] = mat[rIdx][i] / pVal;
        mat[rIdx][i] = newRow[i];
    }
    bVals[rIdx] /= pVal;

    for (size_t i = 0; i < r; i++) {
        if (i != rIdx) {
            float mult = mat[i][cIdx];
            for (size_t j = 0; j < c; j++) {
                mat[i][j] -= mult * newRow[j];
            }
            bVals[i] -= mult * bVals[rIdx];
        }
    }

    float cMult = cVals[cIdx];
    for (size_t i = 0; i < c; i++) {
        cVals[i] -= cMult * newRow[i];
    }
}

size_t Simplex::minRow(size_t colIdx)
{
    unbound = true;
    float minRatio = std::numeric_limits<float>::max();
    size_t loc = 0;

    for (size_t i = 0; i < r; i++) {
        float val = mat[i][colIdx];
        if (val > 0) {
            unbound = false;
            float ratio = bVals[i] / val;
            if (ratio < minRatio) {
                minRatio = ratio;
                loc = i;
            }
        }
    }

    return loc;
}

void Simplex::run()
{
    bool done = false;
    float xPrecise, yPrecise;
    int xRound, yRound;
    float minCost;

    while (!done)
        done = calc();

    xPrecise = bVals[1];
    yPrecise = bVals[2];

    xRound = ceil(xPrecise);
    yRound = ceil(yPrecise);
    minCost = xRound * 0.15 + yRound * 0.12;

    
    std::cout << "Amount of CupX: " << xRound << std::endl;
    std::cout << "Amount of CupY: " << yRound << std::endl;
    std::cout << "Min cost: " << minCost << " dollars" << std::endl;
}

