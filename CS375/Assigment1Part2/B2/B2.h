#ifndef B2_H
#define B2_H

#include <vector>
#include <string>

inline std::string cut(const std::string& input) {
    auto beg = input.find_first_not_of(' ');
    if (beg == std::string::npos) 
        return {};
    auto end = input.find_last_not_of(' ');
    return input.substr(beg, (end - beg + 1));
}

void B2Func(std::vector<int>& numbers, int counter);

#endif



