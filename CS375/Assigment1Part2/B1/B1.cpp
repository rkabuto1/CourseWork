#include <iostream>
#include <vector>
#include <unordered_set>
#include <algorithm>
#include <chrono>

void B1Func(const std::vector<int>& array) {
    auto start_time = std::chrono::high_resolution_clock::now();
    
    int number = array.size();
    std::vector<int> sortedArray = array;   
    std::sort(sortedArray.begin(), sortedArray.end());    
    std::unordered_set<int> uniqueKeys(sortedArray.begin(), sortedArray.end());
    
    int foundFlag = 0; 
    
    for (int i = 0; i < number; ++i) {  
        for (int j = 0; j < number; ++j) {  
            if (i != j) {
                int difference = sortedArray[i] - sortedArray[j];
                if (difference != sortedArray[i] && difference != sortedArray[j]) {
                    if (uniqueKeys.find(difference) != uniqueKeys.end()) {
                        std::cout << sortedArray[i] << " - " << sortedArray[j] << " = " << difference << std::endl;
                        foundFlag = 1;
                    }
                }
            }
        }
    }
    
    if (foundFlag == 0) {
        std::cout << "No such case found" << std::endl;
    }
    
    auto end_time = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end_time - start_time;
    std::cout << "Running time: " << elapsed.count() << " seconds" << std::endl;
}



