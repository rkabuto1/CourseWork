#ifndef Q1_H
#define Q1_H

#include <iostream>
#include <list>
#include <map>
#include <vector>
#include <functional>

using namespace std;

class net
{
    int size;
    vector<list<int>> links;
    map<int, function<void()>> getActions() const;
    void runAction(int id);

public:
    net(int s);
    void addLink(int from, int to);
    void BFS(int start);
};

#endif

