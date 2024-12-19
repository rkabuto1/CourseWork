#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <algorithm>
#include <stack>
#include <ctime>

using namespace std;

class Graph {
public:
    unordered_map<string, vector<string>> links;

    void join(const string& a, const string& b) {
        links[a].push_back(b);
        links[b].push_back(a);
    }

    bool loopCheck(vector<string>& path) const {
        unordered_set<string> seen;
        unordered_map<string, string> par;
        stack<string> stack;

        auto it = links.begin();
        while (it != links.end()) {
            const string& start = it->first;

            if (!seen.count(start)) {
                stack.push(start);
                par[start] = "";

                while (!stack.empty()) {
                    string node = stack.top();
                    stack.pop();

                    if (!seen.count(node)) {
                        seen.insert(node);
                        path.push_back(node);
                    }

                    auto neighborIt = links.at(node).begin();
                    while (neighborIt != links.at(node).end()) {
                        const string& next = *neighborIt;

                        if (!seen.count(next)) {
                            stack.push(next);
                            par[next] = node;
                        } else if (next != par[node]) {
                            path.push_back(next);
                            auto it = find(path.begin(), path.end(), next);
                            path = vector<string>(it, path.end());
                            return true;
                        }

                        ++neighborIt;
                    }
                }

                path.clear();
            }

            ++it;
        }

        return false;
    }
};

int main() {
    vector<pair<string, string>> E1 = {
        {"x1", "y1"}, {"x1", "y2"}, {"y1", "x3"},
        {"y1", "x2"}, {"x3", "y3"}, {"y3", "x2"}, {"x2", "y2"}
    };

    vector<pair<string, string>> E2 = {
        {"a", "b"}, {"a", "c"}, {"a", "d"},
        {"b", "c"}, {"b", "d"}, {"c", "d"}
    };

    Graph graph1, graph2;
    auto it1 = E1.begin();
    while (it1 != E1.end()) {
        graph1.join(it1->first, it1->second);
        ++it1;
    }

    auto it2 = E2.begin();
    while (it2 != E2.end()) {
        graph2.join(it2->first, it2->second);
        ++it2;
    }

    vector<pair<string, Graph>> graphs = {{"Graph I", graph1}, {"Graph II", graph2}};

    for (size_t i = 0; i < graphs.size(); ++i) {
        const auto& title = graphs[i].first;
        const auto& graph = graphs[i].second;

        vector<string> path;
        clock_t start_time = clock();

        if (graph.loopCheck(path)) {
            cout << "There is a loop in " << title << ":
Path = ";
            for (size_t j = 0; j < path.size(); ++j) {
                cout << path[j];
                if (j < path.size() - 1) cout << " -> ";
            }
            cout << "\n";
        } else {
            cout << "No loop found in " << title << ".\n";
        }

        clock_t end_time = clock();
        double elapsed = double(end_time - start_time) / CLOCKS_PER_SEC;
        cout << "Time taken: " << elapsed << " seconds\n\n";
    }

    return 0;
}
