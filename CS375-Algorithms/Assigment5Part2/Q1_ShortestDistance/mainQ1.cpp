#include "Q1.h"

int main() {
    vector<pii> graph[MAX_VERTICES];
    edge(graph, 0, 1, 5);
    edge(graph, 0, 6, 21);
    edge(graph, 0, 9, 1);
    edge(graph, 0, 8, 15);
    edge(graph, 0, 4, 12);
    edge(graph, 1, 9, 20);
    edge(graph, 1, 6, 18);
    edge(graph, 1, 2, 9);
    edge(graph, 2, 6, 17);
    edge(graph, 2, 3, 16);
    edge(graph, 2, 10, 8);
    edge(graph, 3, 7, 14);
    edge(graph, 3, 5, 7);
    edge(graph, 4, 5, 6);
    edge(graph, 4, 6, 2);
    edge(graph, 5, 7, 4);
    edge(graph, 5, 10, 13);
    edge(graph, 5, 9, 19);
    edge(graph, 6, 7, 3);
    edge(graph, 8, 4, 10);
    edge(graph, 9, 5, 19);
    edge(graph, 10, 2, 4);
    edge(graph, 10, 5, 13);

    vector<int> prevFromD(MAX_VERTICES, -1);
    vector<int> distFromD = pathfind(graph, 3, prevFromD);

    vector<int> prevFromA(MAX_VERTICES, -1);
    vector<int> distFromA = pathfind(graph, 0, prevFromA);

    int shortestPath_d_to_i_via_a = distFromD[0] + distFromA[8];
    vector<int> route;
    trace(0, prevFromD, route);

    vector<int> routeToI;
    trace(8, prevFromA, routeToI);
    route.insert(route.end(), routeToI.begin() + 1, routeToI.end());

    cout << "Shortest Path from D -> I while passing through the capital A: ";
    cout << routeStr(route) << endl;
    cout << "Shortest Distance: " << shortestPath_d_to_i_via_a << endl;

    return 0;
}

