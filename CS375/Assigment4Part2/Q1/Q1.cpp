#include "Q1.h"
#include <algorithm>
#include <chrono>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include <functional>

using namespace std;

net::net(int s) : size(s), links(s) {}

map<int, function<void()>> net::getActions() const {
    return {
        {1, []() { cout << "Classes For First Semester:" << endl << "CS1 "; }},
        {6, []() { cout << endl << "Classes For Second Semester:" << endl << "CS6 "; }},
        {13, []() { cout << endl << "Classes For Third Semester:" << endl << "CS13 "; }},
        {5, []() { cout << "CS5 " << endl << "Classes For Fourth Semester:" << endl << "CS8 "; }},
        {10, []() { cout << endl << "Classes For Fifth Semester:" << endl << "CS10 CS11" << endl; }},
        {14, []() {}},
        {8, []() {}},
        {11, []() {}}
    };
}

void net::runAction(int id) {
    static const auto acts = getActions();

    if (acts.count(id)) {
        acts.at(id)();
    } else if (id != 0) {
        cout << "CS" << id << " ";
    }
}

void net::addLink(int from, int to)
{
    if (find(links[from].begin(), links[from].end(), to) == links[from].end()) {
        links[from].push_back(to);
    }
}

void net::BFS(int start)
{
    vector<bool> seen(size, false);
    list<int> next;
    seen[start] = true;
    next.push_back(start);

    cout << "It will take five semesters" << endl;

    while (!next.empty())
    {
        start = next.front();

        if (start == 14 && seen[4] && seen[6]) {
            cout << "CS" << start << " ";
        } else {
            runAction(start);
        }

        next.pop_front();
        for (auto it = links[start].begin(); it != links[start].end(); ++it) {
            if (!seen[*it]) {
                seen[*it] = true;
                next.push_back(*it);
            }
        }
    }
}

int main() {
    net graph(16);

    vector<pair<int, int>> pairs = {
        {0, 1}, {0, 2}, {0, 3}, {2, 4}, {4, 7}, {7, 9}, {9, 10},
        {4, 5}, {4, 14}, {14, 15}, {5, 8}, {8, 11}, {1, 6},
        {3, 6}, {3, 12}, {6, 13}, {6, 8}, {6, 14}
    };

    for (size_t i = 0; i < pairs.size(); i++) {
        graph.addLink(pairs[i].first, pairs[i].second);
    }

    auto start = chrono::high_resolution_clock::now();
    graph.BFS(0);
    auto end = chrono::high_resolution_clock::now();

    auto duration = chrono::duration_cast<chrono::microseconds>(end - start);
    cout << "\nBFS traversal running time: " << duration.count() << " microseconds" << endl;

    return 0;
}

