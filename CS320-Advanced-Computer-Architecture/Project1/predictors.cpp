#include <vector>
using namespace std;

int takenA(const vector<pair<unsigned, bool>>& traceData) {
    int count = 0;
    for (const auto& branch : traceData) {
        if (branch.second) 
           count++;
    }
    return count;
}

int nottakenA(const vector<pair<unsigned, bool>>& traceData) {
    int count = 0;
    for (const auto& branch : traceData) {
        if (!branch.second) 
	   count++;
    }
    return count;
}

int onebit(const vector<pair<unsigned, bool>>& data, int size) {
    vector<int> table(size, 0);
    int count = 0;
    for (const auto& entry : data) {
        unsigned index = entry.first % size;
        bool prediction = table[index];
        if (prediction == entry.second) {
            count++;
        }
        if (entry.second) {
            table[index] = 1;
        } else {
            table[index] = 0;
        }
    }
    return count;
}

int twobit(const vector<pair<unsigned, bool>>& traceData, int tblSize) {
    vector<int> predTable(tblSize, 0);
    int count = 0;
    for (const auto& branch : traceData) {
        unsigned idx = branch.first % tblSize;
        int counter = predTable[idx];
        bool pred = counter >= 2;
        if (pred == branch.second) count++;
        if (branch.second) {
            if (counter < 3) predTable[idx]++;
        } else {
            if (counter > 0) predTable[idx]--;
        }
    }
    return count;
}

int threebit(const vector<pair<unsigned, bool>>& traceData, int tblSize) {
    vector<int> predTable(tblSize, 1);
    int count = 0;
    auto predict = [](int state) {
        return state <= 3;  
    };
    auto updateTaken = [](int state) {
        if (state == 2) 
		return 1;
        if (state == 3) 
		return 2;
        if (state == 4) 
        	return 3;
        if (state == 5) 
        	return 4;
        if (state == 6) 
        	return 5;
        return state;
    };
    auto updateNotTaken = [](int state) {
        if (state == 1) 
        	return 2;
        if (state == 2) 
        	return 4;
        if (state == 3) 
        	return 4;
        if (state == 4) 
        	return 5;
        if (state == 5) 
        	return 6;
        return state;
    };
    for (const auto& branch : traceData) {
        unsigned idx = branch.first % tblSize;
        int state = predTable[idx];
        bool pred = predict(state);
        if (pred == branch.second) count++;

        if (branch.second) {
            predTable[idx] = updateTaken(state);
        } else {
            predTable[idx] = updateNotTaken(state);
        }
    }
    return count;
}

