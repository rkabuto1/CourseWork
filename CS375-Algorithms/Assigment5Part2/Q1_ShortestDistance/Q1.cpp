#include "Q1.h"
#include <algorithm>

void edge(vector<pii> graph[], int x, int y, int z, bool undirected) {
    graph[x].push_back(make_pair(y, z));
    if (undirected) {
        graph[y].push_back(make_pair(x, z));
    }
}

vector<int> pathfind(vector<pii> graph[], int start, vector<int>& prev) {
    priority_queue<pii, vector<pii>, greater<pii>> pq;
    vector<int> dist(MAX_VERTICES, INF);
    pq.push(make_pair(0, start));
    dist[start] = 0;
    prev[start] = -1;

    while (!pq.empty()) {
        int current = pq.top().second;
        pq.pop();

        for (auto& p : graph[current]) {
            int next = p.first;
            int weight = p.second;

            if (dist[next] > dist[current] + weight) {
                dist[next] = dist[current] + weight;
                pq.push(make_pair(dist[next], next));
                prev[next] = current;
            }
        }
    }
    return dist;
}

void trace(int end, const vector<int>& prev, vector<int>& route) {
    while (end != -1) {
        route.push_back(end);
        end = prev[end];
    }
    reverse(route.begin(), route.end());
}

string routeStr(const vector<int>& route) {
    stringstream ss;
    size_t i = 0;
    
    while (i < route.size()) {
        ss << static_cast<char>('a' + route[i]);
        if (i < route.size() - 1) {
            ss << " -> ";
        }
        ++i;
    }
    
    return ss.str();
}

