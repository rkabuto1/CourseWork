#include <iostream>
#include <vector>
#include <fstream>
#include <sstream>
#include "functions.h"

using namespace std;

vector<pair<unsigned, bool>> parse(const string& f) {
    ifstream in(f);
    vector<pair<unsigned, bool>> data;
    string a, b;
    while (in >> a >> b) {
        unsigned addr = std::stoul(a, nullptr, 16);
        bool t = (b == "T");
        data.emplace_back(addr, t);
    }
    return data;
}

void outputGen(const vector<pair<unsigned, bool>>& traceData) {
    int total = traceData.size();
    cout << takenA(traceData) << "," << total << ";\n";
    cout << nottakenA(traceData) << "," << total << ";\n";

    int sizes[] = { 4, 8, 32, 64, 256, 1024, 4096 };
    for (int i = 0; i < 7; ++i) {
        cout << onebit(traceData, sizes[i]) << "," << total;
        if (i < 6) cout << "; ";
    }
    cout << ";\n";

    for (int i = 0; i < 7; ++i) {
        cout << twobit(traceData, sizes[i]) << "," << total;
        if (i < 6) cout << "; ";
    }
    cout << ";\n";

    for (int i = 0; i < 7; ++i) {
        cout << threebit(traceData, sizes[i]) << "," << total;
        if (i < 6) cout << "; ";
    }
    cout << ";\n";

    for (int i = 2; i <= 12; ++i) {
        cout << gsharePred(traceData, i) << "," << total;
        if (i < 12) cout << "; ";
    }
    cout << ";\n";
    
    cout << tPredictor(traceData) << "," << total << ";\n";
}

int main() {
    auto traceData = parse("short_trace1.txt");
    outputGen(traceData);
    return 0;
}

