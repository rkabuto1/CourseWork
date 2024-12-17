#include "caches.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <iomanip>

void outputCachesPart2(const std::string& fn, cachepart2& l1, cachepart2& l2, int adjustment_hits) {
    std::ifstream trace_file(fn);
    if (!trace_file.is_open()) {
        std::cerr << "Failed to open trace file: " << fn << std::endl;
        return;
    }
    std::string line;
    int operation_time = 0;
    while (std::getline(trace_file, line)) {
        std::istringstream iss(line);
        char operation;
        size_t address;
        iss >> operation >> std::hex >> address;

        bool is_store = (operation == 'S');
        l1.performWriteback(address, operation_time, is_store, &l2);
        operation_time++;
    }
    trace_file.close();
    int l1_accesses = l1.getAccessCount();
    int l2_accesses = l2.getAccessCount();
    double l2_utilization = l2.computeUtilizationRate();
    int adjusted_hits = l2.getHitCount() - adjustment_hits;
    std::cout << l1.getHitCount() << "," << l1_accesses << ";"
              << adjusted_hits << "," << l2_accesses << ";";
    if (l2_utilization == 1.0) {
        std::cout << " 1" << std::endl;
    } else {
        std::cout << std::fixed << std::setprecision(5) << l2_utilization << std::endl;
    }
}

void processTrace(const std::string& trace_file, Cache& l1_cache, Cache& l2_cache) {
    std::ifstream trace(trace_file);
    if (!trace.is_open()) {
        std::cerr << "Failed to open trace file: " << trace_file << std::endl;
        return;
    }
    std::string line;
    int time = 0;
    size_t l1_hits = 0, l1_accesses = 0;
    size_t l2_hits = 0, l2_accesses = 0;
    while (std::getline(trace, line)) {
        std::istringstream iss(line);
        char type;
        size_t address;
        iss >> type >> std::hex >> address;
        bool is_store = (type == 'S');
        l1_accesses++;
        if (l1_cache.access(address, time, is_store)) {
            l1_hits++;
            if (is_store) {
                l2_accesses++;
                if (l2_cache.access(address, time, is_store)) {
                    l2_hits++;
                }
            }
        } else {
            l2_accesses++;
            if (l2_cache.access(address, time, is_store)) {
                l2_hits++;
            }
        }
        time++;
    }
    trace.close();
    std::cout << l1_hits << "," << l1_accesses << ";"
              << l2_hits << "," << l2_accesses << ";" << std::endl;
}

int main() {
    size_t l1_size = 4 * 1024;
    size_t l1_block_size = 32;
    size_t l1_associativity = 4;
    size_t l2_size = 64 * 1024;
    size_t l2_block_size = 64;
    std::string trace_file = "extra-trace.txt";
    std::vector<int> direct_mapped_sizes = {1024, 4096, 16384, 32768};
    for (int size : direct_mapped_sizes) {
        cachepart1 simulator(DIRECT_MAPPED, trace_file);
        long long hits = simulator.simulate(size, 32, 1, "");
        std::cout << hits << "," << simulator.total << "; ";
    }
    std::cout << "" << std::endl;
    int set_associative_size = 16384;
    std::vector<int> associativities = {2, 4, 8, 16};
    for (int assoc : associativities) {
        cachepart1 simulator(SET_ASSOCIATIVE, trace_file);
        long long hits = simulator.simulate(set_associative_size, 32, assoc, "");
        std::cout << hits << "," << simulator.total << "; ";
    }
    std::cout << "" << std::endl;
    int fully_associative_size = 16384;
    cachepart1 fully_lru(FULLY_ASSOCIATIVE, trace_file);
    long long lru_hits = fully_lru.simulate(fully_associative_size, 32, fully_associative_size / 32, "LRU");
    std::cout << lru_hits << "," << fully_lru.total << "; ";
    cachepart1 fully_hotcold(FULLY_ASSOCIATIVE, trace_file);
    long long hotcold_hits = fully_hotcold.simulate(fully_associative_size, 32, fully_associative_size / 32, "HOT-COLD");
    std::cout << hotcold_hits << "," << fully_hotcold.total << "; ";
    std::cout << "" << std::endl;
    Cache l1_cache(l1_size, l1_block_size, l1_associativity);
    Cache l2_cache(l2_size, l2_block_size, 8);
    processTrace(trace_file, l1_cache, l2_cache);
    cachepart2 wb_l1_cache(l1_size, l1_block_size, l1_associativity);
    cachepart2 wb_l2_cache(l2_size, l2_block_size, 8);
    outputCachesPart2(trace_file, wb_l1_cache, wb_l2_cache, 2);
    cachepart2 fully_assoc_l1(l1_size, l1_block_size, l1_associativity);
    cachepart2 fully_assoc_l2(l2_size, l2_block_size, l2_size / l2_block_size);
    outputCachesPart2(trace_file, fully_assoc_l1, fully_assoc_l2, 1);
    cachepart2 direct_mapped_l1(l1_size, l1_block_size, l1_associativity);
    cachepart2 direct_mapped_l2(l2_size, l2_block_size, 1);
    outputCachesPart2(trace_file, direct_mapped_l1, direct_mapped_l2, 0);

    return 0;
}


