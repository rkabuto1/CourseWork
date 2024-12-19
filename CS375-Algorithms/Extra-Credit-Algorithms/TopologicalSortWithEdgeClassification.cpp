#include <bits/stdc++.h>
#include <chrono>
using namespace std;
using namespace std::chrono;

enum EdgeType { T, B, F, C };

EdgeType edgeType(int a, int b, const vector<int>& d, const vector<int>& f) {
    if (d[b] == -1) {
        return T;
    } else if (d[b] < d[a] && f[b] == -1) {
        return B;
    } else if (d[a] < d[b] && f[b] != -1) {
        return F;
    } else {
        return C;
    }
}

void topoSort(vector<vector<int>>& graph, int n) {
    stack<int> stk;
    vector<bool> seen(n, false);
    vector<int> d(n, -1), f(n, -1);
    int t = 0;

    for (int i = 1; i < n; i++) {
        if (!seen[i]) {
            stack<int> dfsStack;
            dfsStack.push(i);

            while (!dfsStack.empty()) {
                int node = dfsStack.top();

                if (!seen[node]) {
                    seen[node] = true;
                    d[node] = ++t;
                }

                bool hasUnvisitedNeighbor = false;
                for (int neighbor : graph[node]) {
                    if (!seen[neighbor]) {
                        cout << "Edge " << node << " -> " << neighbor << " is a TREE edge.\n";
                        dfsStack.push(neighbor);
                        hasUnvisitedNeighbor = true;
                        break;
                    } else {
                        EdgeType type = edgeType(node, neighbor, d, f);
                        cout << "Edge " << node << " -> " << neighbor << " is a ";
                        if (type == T) cout << "TREE";
                        else if (type == B) cout << "BACKWARD";
                        else if (type == F) cout << "FORWARD";
                        else if (type == C) cout << "CROSS";
                        cout << " edge.\n";
                    }
                }

                if (!hasUnvisitedNeighbor) {
                    dfsStack.pop();
                    if (f[node] == -1) {
                        f[node] = ++t;
                        stk.push(node);
                    }
                }
            }
        }
    }

    cout << "\nSort: ";
    while (!stk.empty()) {
        cout << stk.top() << " ";
        stk.pop();
    }
    cout << endl;
}

int main() {
    auto start = high_resolution_clock::now();
    int n = 9;
    vector<vector<int>> graph(n);
    graph[1] = {2, 4, 7};
    graph[2] = {4, 7, 3};
    graph[3] = {};
    graph[4] = {8};
    graph[5] = {2, 3};
    graph[6] = {2, 4, 5};
    graph[7] = {3};
    graph[8] = {};
    cout << "Type of Edges:\n";
    topoSort(graph, n);
    auto end = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(end - start);
    cout << "\nRunning time: " << duration.count() << " microseconds\n";
    return 0;
}
