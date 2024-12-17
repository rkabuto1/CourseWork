#include <iostream>
#include <chrono>
#include "Q2.h"

int main() {
    auto start = std::chrono::high_resolution_clock::now();
    groupPics();
    auto end = std::chrono::high_resolution_clock::now();

    std::chrono::duration<double> time = end - start;
    std::cout << "Running Time: " << time.count() << " seconds" << std::endl;

    return 0;
}

