#ifndef P2_H
#define P2_H
#include <iostream>
#include <vector>
#include <string>
using namespace std;

struct TState {
    char st;
    int ty;
};
void modify(TState &unit, int val);
string Flow(string states, string commands, string (*outState)(TState&, TState&, TState&, TState&));

#endif 
