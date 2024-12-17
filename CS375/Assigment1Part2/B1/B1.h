#ifndef B1_H
#define B1_H

#include <vector>
#include <string>

inline std::string cut(const std::string& input) {
    auto beg = input.find_first_not_of(' ');
    if (beg == std::string::npos) 
        return {};
    auto end = input.find_last_not_of(' ');
    return input.substr(beg, (end - beg + 1));
}

void B1Func(const std::vector<int>& arr);

#endif 

