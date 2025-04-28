#include "P2.h"

TState CUnit(int category) {
    return { 'L', category };
}
void StateFunc(TState &unit, char *newState = nullptr) {
    if (newState != nullptr) {
        unit.st = *newState; 
    }
}
void modify(TState &unit, int val) {
    switch (unit.ty) {
        case 0:
            if (unit.st == 'L') {
                unit.st = 'R';
            } else {
                unit.st = 'L';
            }
            break;
        case 1:
            switch (val) {
                case 0:
                    switch (unit.st) {
                        case 'L': 
                            unit.st = 'R';
                            break;
                        case 'R': 
                            unit.st = 'C';
                            break;
                        default: 
                            unit.st = 'L';
                            break;
                    }
                    break;
                case 1:
                    switch (unit.st) {
                        case 'L': 
                            unit.st = 'C';
                            break;
                        case 'C': 
                            unit.st = 'R';
                            break;
                        default: 
                            unit.st = 'L';
                            break;
                    }
                    break;
            }
            break;
    }
}

string Flow(string states, string commands, string (*outState)(TState&, TState&, TState&, TState&)) {
    vector<TState> units = { CUnit(1), CUnit(0), CUnit(0), CUnit(0) };
    vector<vector<char>> results = { {'B', 'C'}, {'C', 'D'}, {'D', 'E'} };
    vector<int> mapping = { 1, 2, 3 };  
    char fChar;

    for (size_t i = 0; i < 4; i++)
        StateFunc(units[i], &states[i]);

    string log = outState(units[0], units[1], units[2], units[3]);

    size_t step = 0;
    while (step < commands.length()) {
        log += "->";
        int num = commands[step] - '0';
        int index = 0;

        if (units[0].st == 'R') {
            index = 2;
        } else if (units[0].st == 'C') {
            index = 1;
        }
        TState &unit = units[mapping[index]];
        modify(units[0], num);
        fChar = results[index][ unit.st != 'L' ];
        modify(unit, num);
        log += outState(units[0], units[1], units[2], units[3]);
        step++;
    }
    return log + " " + fChar;
}



