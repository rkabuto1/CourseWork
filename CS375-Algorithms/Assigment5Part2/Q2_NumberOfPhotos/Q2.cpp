#include <iostream>
#include <vector>
#include <algorithm>
#include <unordered_map>
#include "Q2.h"

int root(std::vector<int>& grp, int i) {
    while (grp[i] != i) {
        grp[i] = grp[grp[i]];
        i = grp[i];
    }
    return i;
}

void merge(std::vector<int>& g, std::vector<int>& lvl, int a, int b) {
    int rootX = root(g, a);
    int rootY = root(g, b);
    int diff = (rootX != rootY);
    int attach = rootX * (lvl[rootX] >= lvl[rootY]) + rootY * (lvl[rootX] < lvl[rootY]);
    int recv = rootX * (lvl[rootX] < lvl[rootY]) + rootY * (lvl[rootX] >= lvl[rootY]);
    g[recv] = diff * attach + !diff * g[recv];
    lvl[attach] += diff * (lvl[rootX] == lvl[rootY]);
}



void groupPics() {
    int items = 20;
    int groups = 3;
    std::vector<Edge> edges = {
        {1, 2, 80}, {5, 9, 73}, {9, 13, 69}, {2, 3, 10},
        {5, 7, 20}, {5, 2, 74}, {9, 18, 15}, {13, 14, 21},
        {9, 1, 92}, {13, 2, 59}, {20, 4, 6}, {18, 17, 17},
        {11, 3, 74}, {7, 18, 83}, {7, 12, 27}, {1, 10, 16},
        {5, 15, 47}, {20, 14, 94}, {14, 18, 77}, {2, 4, 30},
        {11, 14, 62}, {3, 20, 85}, {11, 7, 62}, {6, 10, 87},
        {12, 15, 81}, {3, 19, 39}, {9, 8, 45}, {19, 4, 65},
        {8, 16, 70}, {15, 17, 64}, {1, 11, 32}, {11, 6, 43},
        {12, 6, 87}, {12, 19, 70}, {7, 16, 39}, {13, 6, 22},
        {4, 16, 68}, {17, 10, 56}, {19, 15, 71}
    };

    std::sort(edges.begin(), edges.end(), [](Edge x, Edge y) {
        return x.score > y.score;
    });

    std::vector<int> grp(items + 1);
    std::vector<int> level(items + 1, 0);

    for (int i = 1; i <= items; i++) grp[i] = i;

    int activeGroups = items;
    size_t idx = 0;

    while (idx < edges.size()) {
        const Edge& edge = edges[idx];
        int root1 = root(grp, edge.a);
        int root2 = root(grp, edge.b);
        if (root1 != root2) {
            if (activeGroups <= groups) break;
            merge(grp, level, edge.a, edge.b);
            activeGroups--;
        }
        idx++;
    }

    std::vector<std::vector<int>> sets(groups);
    std::unordered_map<int, int> mainRoot;
    int label = 0;

    for (int i = 1; i <= items; i++) {
        int rootId = root(grp, i);
        if (mainRoot.find(rootId) == mainRoot.end()) {
            mainRoot[rootId] = label++;
        }
        sets[mainRoot[rootId]].push_back(i);
    }

    for (int i = 0; i < groups; i++) {
        std::cout << "Group " << i + 1 << " has " << sets[i].size() << " items: ";
        
        size_t j = 0;
        while (j < sets[i].size()) {
            std::cout << "p" << sets[i][j] << " ";
            j++;
        }
        std::cout << std::endl;
    }
}

