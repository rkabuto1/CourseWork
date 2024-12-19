#include <iostream>
#include <vector>
#include <iomanip>
#include <chrono>

using namespace std;
using namespace std::chrono;

const double EPS = 1e-9;

void show(const vector<vector<double>> &tab) {
    cout << fixed << setprecision(2);
    for (size_t r = 0; r < tab.size(); ++r) {
        for (size_t c = 0; c < tab[r].size(); ++c) {
            cout << setw(10) << tab[r][c] << " ";
        }
        cout << endl;
    }
    cout << endl;
}

void simplex(vector<vector<double>> &tab) {
    while (true) {
        int ent = -1;
        int c = 0;
        while (c < 3 && ent == -1) {
            if (tab[4][c] < -EPS) {
                ent = c;
            }
            c++;
        }
        if (ent == -1) {
            return;
        }

        int out = -1;
        double minQuot = 1e9;
        int r = 0;
        while (r < 4) {
            if (tab[r][ent] > EPS) {
                double quot = tab[r][4] / tab[r][ent];
                if (quot < minQuot) {
                    minQuot = quot;
                    out = r;
                }
            }
            r++;
        }

        double piv = tab[out][ent];
        int col = 0;
        while (col < tab[out].size()) {
            tab[out][col] /= piv;
            col++;
        }
        int row = 0;
        while (row <= 4) {
            if (row != out) {
                double scale = tab[row][ent];
                int col2 = 0;
                
                while (col2 < tab[row].size()) {
                    tab[row][col2] -= scale * tab[out][col2];
                    col2++;
                }
            }
            row++;
        }
    }
}

void solve() {
    vector<vector<double>> tab = {
        {3, 2, 5, 1, 55},
        {2, 1, 1, 1, 26},
        {1, 1, 3, 1, 30},
        {5, 2, 4, 1, 57},
        {-20, -10, -15, 0, 0}
    };

    auto start = high_resolution_clock::now();

    cout << "Starting Table:" << endl;
    show(tab);

    simplex(tab);

    cout << "Output Table" << endl;
    show(tab);

    cout << "Answer:" << endl;
    cout << "P = " << tab[4][4] << endl;
    
    for (int c = 0; c < 3; ++c) {
        bool basic = false;
        double val = 0.0;
        for (int r = 0; r < 4; ++r) {
            if (tab[r][c] == 1.0) {
                val = tab[r][4];
                basic = true;
                break;
            }
        }
        cout << "x" << c + 1 << " = " << (basic ? val : 0) << endl;
    }

    auto end = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(end - start);
    cout << "Running Time: " << duration.count() << " microseconds" << endl;
}

int main() {
    solve();
    return 0;
}
