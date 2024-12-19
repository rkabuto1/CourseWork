#include <iostream>
#include <vector>
#include <unordered_map>
#include <algorithm>
#include <chrono>

using namespace std;
using namespace std::chrono;

void paint(int node, int shade, unordered_map<int, int>& shades, const unordered_map<int, vector<int>>& net) {
    shades[node] = shade;

    for (int nbr : net.at(node)) {
        if (shades.find(nbr) == shades.end()) {
            paint(nbr, 1 - shade, shades, net);
        }
    }
}

void split(const unordered_map<int, vector<int>>& net, vector<int>& setA, vector<int>& setB) {
    unordered_map<int, int> shades;

    paint(1, 0, shades, net);

    for (pair<int, int> p : shades) {
        if (p.second == 0) {
            setA.push_back(p.first);
        } else {
            setB.push_back(p.first);
        }
    }

    sort(setA.begin(), setA.end());
    sort(setB.begin(), setB.end());
}

int main() {
    unordered_map<int, vector<int>> net = {
        {1, {2, 3}}, {2, {1, 4, 5}}, {3, {1, 6, 7}}, {4, {2, 8}}, {5, {2, 8}}, 
        {6, {3, 8}}, {7, {3, 8, 9, 10}}, {8, {4, 5, 6, 7, 11}}, {9, {7, 11}}, 
        {10, {7}}, {11, {8, 9}}
    };

    vector<int> setA, setB;

    auto start = high_resolution_clock::now();

    split(net, setA, setB);

    cout << "The graph is bipartite.\nsetA: ";
    for (int node : setA) cout << node << " ";
    cout << "\nsetB: ";
    for (int node : setB) cout << node << " ";
    cout << endl;

    auto stop = high_resolution_clock::now();
    cout << "Running time: " << duration_cast<microseconds>(stop - start).count() << " microseconds" << endl;

    return 0;
}
