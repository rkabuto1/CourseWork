#include "caches.h"
#include <iostream>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <cmath>
#include <limits>
#include <map>
#include <algorithm>

cachepart1::cachepart1(cache_policy policy_mode, std::string file_path) {
    total = 0;
    file_resource_name = std::move(file_path);
    memory_allocation_mode = policy_mode;
}

long long cachepart1::simulate(int c_size, int l_size, int assoc, std::string pol) {
    long long hits = -1;
    int ct = 0;
    while (true) {
        switch (ct) {
            case 0:
                if (ct == 0 && memory_allocation_mode == DIRECT_MAPPED) {
                    hits = direct_mapped(c_size, l_size);
                    return hits;
                }
                break;
            case 1:
                if (ct == 1 && memory_allocation_mode == SET_ASSOCIATIVE) {
                    hits = set_associative(c_size, l_size, assoc);
                    return hits;
                }
                break;
            case 2:
                if (ct == 2 && memory_allocation_mode == FULLY_ASSOCIATIVE) {
                    hits = fully_associative(c_size, l_size, pol);
                    return hits;
                }
                break;
            default:
                std::cerr << "Error" << std::endl;
                exit(1);
        }
        ct++;
    }
}

long long cachepart1::direct_mapped(int sz, int ln) {
    std::ifstream file(file_resource_name);
    if (!file) {
        std::cerr << "Error." << file_resource_name << std::endl;
        exit(1);
    }
    int num_cache_blocks = sz / ln;
    std::vector<std::vector<long long>> cache(num_cache_blocks, std::vector<long long>(ln, -1));
    long long hits = 0;
    total = 0;
    std::string line;
    while (std::getline(file, line)) {
        total++;
        std::stringstream ss(line);
        char operation;
        long long address, block_base, block_index;
        ss >> operation >> std::hex >> address;
        block_base = address / ln;
        block_index = block_base % num_cache_blocks;
        if (std::find(cache[block_index].begin(), cache[block_index].end(), address) != cache[block_index].end()) {
            hits++;
        } else {
            std::generate(cache[block_index].begin(), cache[block_index].end(),
                          [base = block_base * ln, step = 0]() mutable { return base + step++; });
        }
    }
    file.close();
    return hits;
}

long long cachepart1::set_associative(int sz, int ln, int assoc) {
    int entries_per_set = sz / ln / assoc;
    MemoryBlockDescriptor temp;
    temp.last_access_timestamp = -1;
    temp.memory_addresses.resize(ln, -1);
    std::vector<std::vector<MemoryBlockDescriptor>> cache(assoc, std::vector<MemoryBlockDescriptor>(entries_per_set, temp));
    std::ifstream file(file_resource_name);
    if (!file) {
        std::cerr << "Error. " << file_resource_name << std::endl;
        exit(1);
    }
    long long hits = 0;
    total = 0;
    std::string line;
    while (std::getline(file, line)) {
        total++;
        std::stringstream ss(line);
        char operation;
        long long address, block, index, offset;
        ss >> operation >> std::hex >> address;
        block = address / ln;
        index = block % entries_per_set;
        offset = address % ln;
        auto hit_iter = std::find_if(cache.begin(), cache.end(), [&](const std::vector<MemoryBlockDescriptor>& set) {
            return set[index].memory_addresses[offset] == address;
        });
        if (hit_iter != cache.end()) {
            hits++;
            hit_iter->at(index).last_access_timestamp = std::chrono::duration<double, std::milli>(
                std::chrono::high_resolution_clock::now() - start_time).count();
        } else {
            auto victim_iter = std::min_element(cache.begin(), cache.end(), [&](const std::vector<MemoryBlockDescriptor>& a, const std::vector<MemoryBlockDescriptor>& b) {
                return a[index].last_access_timestamp < b[index].last_access_timestamp;
            });
            victim_iter->at(index).last_access_timestamp = std::chrono::duration<double, std::milli>(
                std::chrono::high_resolution_clock::now() - start_time).count();
            std::generate(victim_iter->at(index).memory_addresses.begin(), victim_iter->at(index).memory_addresses.end(),
                          [base = block * ln, step = 0]() mutable { return base + step++; });
        }
    }
    file.close();
    return hits;
}

long long cachepart1::fully_associative(int sz, int ln, std::string pol) {
    long long result = -1;
    int entries = sz / ln;
    if (entries <= 0) {
        std::cerr << "Error: Invalid cache size or line size." << std::endl;
        exit(1);
    }
    int policy_code = -1;
    if (pol == "HOT-COLD") {
        policy_code = 1;
    } else if (pol == "LRU") {
        policy_code = 2;
    }
    switch (policy_code) {
        case 1:  
            result = simulate_hot_cold(entries, ln);
            break;
        case 2:  
            result = set_associative(sz, ln, sz / ln);
            break;

        default:
            std::cerr << "Error'" << pol << "'." << std::endl;
            exit(1);
    }

    return result;
}

long long cachepart1::simulate_hot_cold(int entries, int ln) {
    std::vector<int> hot_cold_tree(entries - 1, 0);
    MemoryBlockDescriptor temp;
    temp.last_access_timestamp = -1;
    temp.memory_addresses.resize(ln, -1);
    std::vector<MemoryBlockDescriptor> cache(entries, temp);
    std::ifstream file(file_resource_name);
    if (!file) {
        std::cerr << "Error" << file_resource_name << std::endl;
        exit(1);
    }

    std::vector<std::string> lines;
    std::string line;
    while (std::getline(file, line)) {
        lines.push_back(line);
    }
    file.close();
    long long hits = 0;
    total = 0;
    size_t index = 0;
    while (index < lines.size()) {
        const std::string& entry = lines[index];
        total++;
        std::stringstream ss(entry);
        char operation;
        long long address;
        if (!(ss >> operation >> std::hex >> address)) {
            std::cerr << "Error" << entry << "'." << std::endl;
            index++;
            continue;
        }
        long long base = (address / ln) * ln;
        int offset = address % ln;
        auto hit_iter = std::find_if(cache.begin(), cache.end(),
                                     [&](const MemoryBlockDescriptor& block) { return block.memory_addresses[offset] == address; });

        if (hit_iter != cache.end()) {
            hits++;
            update_hot_cold_tree(hot_cold_tree, entries, std::distance(cache.begin(), hit_iter));
        } else {
            handle_hot_cold_miss(cache, hot_cold_tree, entries, base, ln);
        }

        index++;
    }

    return hits;
}

void cachepart1::update_hot_cold_tree(std::vector<int>& hot_cold_tree, int entries, int hit_idx) {
    int hc_idx = hit_idx + entries - 1;
    while (hc_idx > 0) {
        if (hc_idx % 2 == 0) {
            hc_idx = (hc_idx - 2) / 2;
            hot_cold_tree[hc_idx] = 0;
        } else {
            hc_idx = (hc_idx - 1) / 2;
            hot_cold_tree[hc_idx] = 1;
        }
    }
}

void cachepart1::handle_hot_cold_miss(std::vector<MemoryBlockDescriptor>& cache, std::vector<int>& hot_cold_tree, int entries, long long base, int ln) {
    int hc_idx = 0;
    for (int depth = 0; depth < static_cast<int>(std::log2(entries)); ++depth) {
        if (hc_idx >= static_cast<int>(hot_cold_tree.size())) {
            std::cerr << "Error" << std::endl;
            exit(1);
        }
        if (hot_cold_tree[hc_idx] == 0) {
            hot_cold_tree[hc_idx] = 1;
            hc_idx = 2 * hc_idx + 1;
        } else {
            hot_cold_tree[hc_idx] = 0;
            hc_idx = 2 * hc_idx + 2;
        }
    }
    int victim_idx = hc_idx - (entries - 1);
    if (victim_idx < 0 || victim_idx >= static_cast<int>(cache.size())) {
        std::cerr << "Error" << victim_idx << "." << std::endl;
        exit(1);
    }
    std::generate(cache[victim_idx].memory_addresses.begin(), cache[victim_idx].memory_addresses.end(),
                  [base, step = 0]() mutable { return base + step++; });
    update_hot_cold_tree(hot_cold_tree, entries, victim_idx);
}

