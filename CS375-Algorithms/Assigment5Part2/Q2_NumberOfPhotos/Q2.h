#ifndef Q2_H
#define Q2_H

#include <vector>

struct Edge {
    int a, b, score;
};

int root(std::vector<int>& grp, int i);
void merge(std::vector<int>& g, std::vector<int>& lvl, int a, int b);
void groupPics();

#endif

