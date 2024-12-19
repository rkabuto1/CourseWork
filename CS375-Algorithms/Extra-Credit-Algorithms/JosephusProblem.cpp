#include <iostream>
#include <chrono>  
using namespace std;

class Extra_CreditQ8 {
public:
    int LastBall(int n, int k, int p){
        int dp[n + 1];
        dp[1] = 0;
        for (int i = 2; i <= n; i++) {
            dp[i] = (dp[i - 1] + k) % i;
        }
        return (dp[n] + p) % n;
    }
};

int main() {
    Extra_CreditQ8 s;
    int n = 100; int k = 7; int p = 0;

    auto start = chrono::high_resolution_clock::now();
    int last = s.LastBall(n, k, p);
    auto end = chrono::high_resolution_clock::now();
    chrono::duration<double> runtime = end - start;

    cout << "The last ball is: " << last << endl;
    cout << "Running time: " << runtime.count() << " seconds" << endl;

    return 0;
}
