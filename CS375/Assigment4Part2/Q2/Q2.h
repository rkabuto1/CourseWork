#ifndef Q2_H
#define Q2_H
#include <vector>
#include <cstddef>  

class Simplex
{
private:
    size_t r, c;
    bool unbound;
    float maxVal;
    std::vector<std::vector<float>> mat;
    std::vector<float> bVals;
    std::vector<float> cVals;
public:
    Simplex(std::vector<std::vector<float>> matInit, std::vector<float> bInit, std::vector<float> cInit);
    bool calc();
    bool isOptimal();
    void pivot(size_t rIdx, size_t cIdx);
    size_t minCol();
    size_t minRow(size_t colIdx);
    void run();
};

#endif

