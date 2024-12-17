#include "B2.h"
#include <fstream>
#include <sstream>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

int main(int argc, char* argv[]) {
    string In_F;
    string Out_F;
    string read_line;
    ifstream IsIn_F;
    ofstream isOut_F;
    vector<int> numbers;
    int counter = 0;
    int foundS = 0; 

    if (argc != 3 || !(IsIn_F.open(argv[1]), IsIn_F) || !(isOut_F.open(argv[2]), isOut_F)) {
        cerr << "Make sure you do: " << argv[0] << " inputFile.txt outputFile.txt or 'Make Run'. Ensure the files can be opened." << endl;
        return 1;
    }

    while (getline(IsIn_F, read_line)) {
        read_line = cut(read_line);
        
        if (read_line.empty()) continue;
           size_t pos = read_line.find("S=");
        	if (pos != string::npos) {
            try {
                counter = stoi(read_line.substr(pos + 2));
                foundS++; 
                break;
            } catch (invalid_argument& e) {
                cerr << "Invalid S value. Ensure you use capital S for S=." << endl;
                return 1;
            }
        }
        if (foundS == 0) {  
            try {
                numbers.push_back(stoi(read_line));
            } catch (invalid_argument& e) {
                cerr << "Invalid input in file! Ensure you use capital S for S=." << endl;
                return 1;
            }
        }
    }

    IsIn_F.close();

    if (numbers.empty()) {
        cerr << "Error: No valid numbers found in the input file!" << endl;
        return 1;
    }

    ofstream::sync_with_stdio(false);
    streambuf* coutbuf = cout.rdbuf();
    cout.rdbuf(isOut_F.rdbuf());

    B2Func(numbers, counter);

    cout.rdbuf(coutbuf);
    isOut_F.close();

    return 0;
}



