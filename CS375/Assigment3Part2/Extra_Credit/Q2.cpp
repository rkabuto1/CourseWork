#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

string backtrack(string& arg1, string& arg2, string& arg3, int argM, int argN, int argO, int*** L) {
    if (argM == 0 || argN == 0 || argO == 0)
        return "";
    if (arg1[argM - 1] == arg2[argN - 1] && arg1[argM - 1] == arg3[argO - 1])
        return backtrack(arg1, arg2, arg3, argM - 1, argN - 1, argO - 1, L) + arg1[argM - 1];
    if (L[argM - 1][argN][argO] >= L[argM][argN - 1][argO] && L[argM - 1][argN][argO] >= L[argM][argN][argO - 1])
        return backtrack(arg1, arg2, arg3, argM - 1, argN, argO, L);
    else if (L[argM][argN - 1][argO] >= L[argM - 1][argN][argO] && L[argM][argN - 1][argO] >= L[argM][argN][argO - 1])
        return backtrack(arg1, arg2, arg3, argM, argN - 1, argO, L);
    else
        return backtrack(arg1, arg2, arg3, argM, argN, argO - 1, L);
}

string LCSof3(string arg1, string arg2, string arg3, int argM, int argN, int argO) {
    int*** L = new int**[argM + 1];
    for (int i = 0; i <= argM; ++i) {
        L[i] = new int*[argN + 1];
        for (int j = 0; j <= argN; ++j) {
            L[i][j] = new int[argO + 1];
            for (int k = 0; k <= argO; ++k) {
                if (i == 0 || j == 0 || k == 0) {
                    L[i][j][k] = 0;
                } else if (arg1[i - 1] == arg2[j - 1] && arg1[i - 1] == arg3[k - 1]) {
                    L[i][j][k] = 1 + L[i - 1][j - 1][k - 1];
                } else {
                    int max1 = L[i - 1][j][k];
                    int max2 = L[i][j - 1][k];
                    int max3 = L[i][j][k - 1];
                    L[i][j][k] = max({max1, max2, max3});
                }
            }
        }
    }

    string result = backtrack(arg1, arg2, arg3, argM, argN, argO, L);

    cout << "Longest common subsequence is \"" << result << "\"" << endl;
    cout << "Length = " << result.size() << endl;

    for (int i = 0; i <= argM; ++i) {
        for (int j = 0; j <= argN; ++j) {
            delete[] L[i][j];
        }
        delete[] L[i];
    }
    delete[] L;

    return result;
}

int main() {
    string arg1 = "6541254939322816220209974565477289648317";
    string arg2 = "3142522751761601737419090933147067701840";
    string arg3 = "2807030561290354259513570160162463275171";
    
    //Another Simple Example
    //string arg1 = "geeks";
    //string arg2 = "geeksfor";
    //string arg3 = "geeksforgeeks";
    //Correct output "geeks" and length = 5

    int argM = arg1.size();
    int argN = arg2.size();
    int argO = arg3.size();

    LCSof3(arg1, arg2, arg3, argM, argN, argO);

    return 0;
}

