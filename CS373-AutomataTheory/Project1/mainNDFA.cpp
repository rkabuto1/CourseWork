#include "Parse.h"
#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <set>
#include <vector>
#include <queue>

void explore(const std::string &str, std::size_t pos, int node, const std::unordered_map<int, std::unordered_map<char, std::vector<int>>> &paths, std::set<int> &ends) {
    std::queue<std::pair<std::size_t, int>> queue;
    std::unordered_set<std::pair<std::size_t, int>, PairHash> seen;
    queue.push({pos, node});
    seen.insert({pos, node});
    while (!queue.empty()) {
        auto [curPos, curNode] = queue.front();
        queue.pop();
        if (curPos == str.size()) {
            ends.insert(curNode);
            continue;
        }
        char mark = str[curPos];
        if (paths.count(curNode) && paths.at(curNode).count(mark)) {
            for (int next : paths.at(curNode).at(mark)) {
                auto step = std::make_pair(curPos + 1, next);
                
                if (seen.find(step) == seen.end()) {
                    queue.push(step);
                    seen.insert(step);
                }
            }
        }
    }
}
void run(const std::string &str, const std::unordered_map<int, StateInfo> &nodes, const std::vector<Trans> &links) {
    std::unordered_map<int, std::unordered_map<char, std::vector<int>>> paths;
    std::unordered_map<int, bool> goals;
    std::unordered_set<int> starts;  
    for (const auto &link : links) {
        paths[link.origin][link.type].push_back(link.goingto);
    }    
    for (const auto &[node, info] : nodes) {
        if (info.passStart) {
            starts.insert(node);
        }
        if (info.passAccept) {
            goals[node] = true;
        }
    }
    std::set<int> ends;
    for (int start : starts) {
        explore(str, 0, start, paths, ends);
    }
    bool found = false;
    for (int node : ends) {
        if (goals.count(node) && goals.at(node)) {
            found = true;
            break;
        }
    }
    if (found) {
        std::cout << "accept ";
        for (int node : ends) {
            if (goals.count(node) && goals.at(node)) {
                std::cout << node << " ";
            }
        }
    } else {
        std::cout << "reject";
        if (!ends.empty()) {
            std::cout << " ";
            for (int node : ends) {
                std::cout << node << " ";
            }
        } else {
            std::cout << " No Final State.";
        }
    }
    std::cout << std::endl;
}

int main(int argc, char *argv[]) {
   if (argc != 3) {
       std::cerr << "Incorrect Input: " << argv[0] << "[type of file name] [set of strings]" << std::endl;
       return EXIT_FAILURE;
   }
   std::string file = argv[1];
   std::string str = argv[2];
   std::unordered_map<int, StateInfo> nodes;
   std::vector<Trans> links;
   procInp(file, nodes, links);
   run(str, nodes, links);
   return 0;
}
