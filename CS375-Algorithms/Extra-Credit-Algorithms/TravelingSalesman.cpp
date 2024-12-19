#include <iostream>
#include <vector>
#include <queue>
#include <climits>
#include <algorithm>

using namespace std;

struct Node {
    vector<int> p;
    int c;
    int b;

    bool operator<(const Node &other) const {
        return b > other.b;
    }
};

int calcBound(const vector<vector<int>> &g, const Node &n, int size) {
    int b = n.c;
    vector<bool> v(size, false);

    for (int city : n.p)
        v[city] = true;

    for (int i = 0; i < size; ++i) {
        if (!v[i]) {
            int minEdge = INT_MAX;
            for (int j = 0; j < size; ++j) {
                if (!v[j] && g[i][j] != 0) {
                    minEdge = min(minEdge, g[i][j]);
                }
            }
            b += (minEdge == INT_MAX ? 0 : minEdge);
        }
    }

    return b;
}

pair<vector<int>, int> tsp(const vector<vector<int>> &g, int start) {
    int size = g.size();
    priority_queue<Node> q;
    int bestC = INT_MAX;
    vector<int> bestP;

    q.push(Node{{start}, 0, calcBound(g, Node{{start}, 0, 0}, size)});

    for (; !q.empty(); ) {
        Node curr = q.top();
        q.pop();

        if (curr.p.size() == size && g[curr.p.back()][start] != 0) {
            int tourC = curr.c + g[curr.p.back()][start];
            if (tourC < bestC) {
                bestC = tourC;
                bestP = curr.p;
                bestP.push_back(start);
            }
            continue;
        }

        vector<int> unvisited;
        for (int i = 0; i < size; ++i) {
            if (find(curr.p.begin(), curr.p.end(), i) == curr.p.end() && g[curr.p.back()][i] != 0) {
                unvisited.push_back(i);
            }
        }

        for (int city : unvisited) {
            Node child;
            child.p = curr.p;
            child.p.push_back(city);
            child.c = curr.c + g[curr.p.back()][city];
            child.b = calcBound(g, child, size);

            if (child.b < bestC) {
                q.push(child);
            }
        }
    }
    return {bestP, bestC};
}

int main() {
    vector<vector<int>> g = {
        {0, 4, 3, 2},
        {4, 0, 1, 2},
        {3, 1, 0, 5},
        {2, 2, 5, 0}
    };

    int start = 0;
    auto [tour, cost] = tsp(g, start);

    cout << "Optimal Tour: ";
    for (int city : tour) {
        cout << char('A' + city) << " ";
    }
    cout << "\nOptimal Cost: " << cost << endl;

    return 0;
}
