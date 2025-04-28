#ifndef PARSE_H
#define PARSE_H
#include <string>
#include <vector>
#include <unordered_map>

struct Trans {
    int origin;
    char type;
    int goingto;
};

struct StateInfo {
    bool passStart = false;
    bool passAccept = false;
};

struct PairHash {
    std::size_t operator()(const std::pair<std::size_t, int> &p) const {
        return std::hash<std::size_t>()(p.first) ^ (std::hash<int>()(p.second) << 1);
    }
};

void procInp(const std::string &fPath, std::unordered_map<int, StateInfo> &gNds, std::vector<Trans> &edg);
#endif
