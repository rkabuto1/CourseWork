#include "B1.h"
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

    if (argc != 3 || !(IsIn_F.open(argv[1]), IsIn_F) || !(isOut_F.open(argv[2]), isOut_F)) {
        cerr << "Make sure you do: " << argv[0] << " inputFile.txt outputFile.txt or 'Make Run'. Ensure the files can be opened." << endl;
        return 1;
    }

    while (getline(IsIn_F, read_line)) {
        read_line = cut(read_line); 
        if (read_line.empty()) continue;       
        try {
            numbers.push_back(stoi(read_line));
        } catch (invalid_argument& e) {
            cerr << "Invalid input in file! Ensure the file contains only valid numbers." << endl;
            return 1;
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
   
    B1Func(numbers);

    cout.rdbuf(coutbuf);
    isOut_F.close(); 

    return 0;
}



