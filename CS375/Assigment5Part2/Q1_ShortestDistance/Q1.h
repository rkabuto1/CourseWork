#ifndef Q1_H
#define Q1_H

#include <iostream>
#include <vector>
#include <queue>
#include <climits>
#include <sstream>

using namespace std;
typedef pair<int, int> pii;

const int MAX_VERTICES = 11;
const int INF = INT_MAX;

void edge(vector<pii> graph[], int x, int y, int z, bool undirected = true);
void trace(int end, const vector<int>& prev, vector<int>& route);
vector<int> pathfind(vector<pii> graph[], int start, vector<int>& prev);
string routeStr(const vector<int>& route);

#endif

