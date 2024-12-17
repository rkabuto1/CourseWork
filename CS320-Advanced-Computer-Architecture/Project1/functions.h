#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include <vector>
using namespace std;

int takenA(const vector<pair<unsigned, bool>>& traceData);
int nottakenA(const vector<pair<unsigned, bool>>& traceData);
int onebit(const vector<pair<unsigned, bool>>& traceData, int tblSize);
int twobit(const vector<pair<unsigned, bool>>& traceData, int tblSize);
int threebit(const vector<pair<unsigned, bool>>& traceData, int tblSize);
int gsharePred(const vector<pair<unsigned, bool>>& traceData, int histBits);
int tPredictor(const vector<pair<unsigned, bool>>& trace);

#endif

