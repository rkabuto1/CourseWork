#include "caches.h"
#include <fstream>
#include <iostream>
#include <sstream>
#include <iomanip>
#include <cmath>
#include <algorithm>
#include <numeric>
Cache::Cache(size_t total_cache_size, size_t single_block_size, size_t set_associativity)
    : block_size(single_block_size), associativity(set_associativity) {
    if (set_associativity == 0 || single_block_size == 0) {
        throw std::invalid_argument("Error.");
    }
    num_sets = total_cache_size / (single_block_size * set_associativity);
    cache = std::vector<std::vector<CacheBlock>>(
        num_sets, std::vector<CacheBlock>(
            set_associativity, CacheBlock{false, 0, -1, false}));
}
cachepart2::cachepart2(size_t total_cache_bytes, size_t block_size_bytes_param, size_t associativity_level)
    : block_size_bytes(block_size_bytes_param), cache_associativity(associativity_level), hit_count(0), access_count(0) {
    if (associativity_level == 0 || block_size_bytes_param == 0) {
        throw std::invalid_argument("Error.");
    }
    num_cache_sets = total_cache_bytes / (block_size_bytes_param * associativity_level);
    cache_storage = std::vector<std::vector<CacheBlock_Unique>>(
        num_cache_sets, std::vector<CacheBlock_Unique>(
            cache_associativity, CacheBlock_Unique{false, false, static_cast<unsigned long>(-1), -1}));
}
std::pair<size_t, size_t> Cache::tagindex(size_t mem_address) const {
    size_t cache_index = (mem_address / block_size) % num_sets;
    size_t block_tag = (mem_address / block_size) / num_sets;
    return {cache_index, block_tag};
}

std::pair<size_t, size_t> cachepart2::tagindex(size_t addr_value) const {
    size_t set_index = (addr_value / block_size_bytes) % num_cache_sets;
    size_t unique_tag = (addr_value / block_size_bytes) / num_cache_sets;
    return {set_index, unique_tag};
}

bool Cache::access(size_t addr, int t, bool s) {
    auto [set_idx, block_tag] = tagindex(addr); 
    auto& cache_set = cache[set_idx];
    auto hit_block = std::find_if(cache_set.begin(), cache_set.end(), [block_tag](const CacheBlock& block) {
        return block.valid && block.tag == block_tag;
    });
    if (hit_block != cache_set.end()) {
        hit_block->last_used = t;
        if (s) hit_block->dirty = true;
        return true;
    }
    auto lru_block = std::min_element(cache_set.begin(), cache_set.end(), [](const CacheBlock& a, const CacheBlock& b) {
        if (!a.valid) return true;
        if (!b.valid) return false;
        return a.last_used < b.last_used;
    });
    *lru_block = {true, block_tag, t, s};
    return false;
}

bool cachepart2::performWriteback(size_t addr, int t, bool sf, cachepart2* sc) {
    auto [set_idx, block_tag] = tagindex(addr); 
    auto& cache_set = cache_storage[set_idx];
    auto hit_block = std::find_if(cache_set.begin(), cache_set.end(), [block_tag](const CacheBlock_Unique& block) {
        return block.valid_flag && block.tag_value == block_tag;
    });
    if (hit_block != cache_set.end()) {
        hit_block->last_used_time = t;
        if (sf) hit_block->dirty_flag = true;
        ++hit_count;
        ++access_count;
        return true;
    }

    auto lru_block = std::min_element(cache_set.begin(), cache_set.end(), [](const CacheBlock_Unique& a, const CacheBlock_Unique& b) {
        if (!a.valid_flag) return true;
        if (!b.valid_flag) return false;
        return a.last_used_time < b.last_used_time;
    });

    if (lru_block->valid_flag && lru_block->dirty_flag) {
        size_t evicted_address = (lru_block->tag_value * num_cache_sets + set_idx) * block_size_bytes;
        if (sc) {
            sc->performWriteback(evicted_address, t, true);
        }
    }
    if (sc) {
        sc->performWriteback(addr, t, false);
    }
    *lru_block = {true, sf, block_tag, t};
    ++access_count;
    return false;
}

double cachepart2::computeUtilizationRate() const {
    int used_block_count = std::accumulate(cache_storage.begin(), cache_storage.end(), 0, [](int sum, const std::vector<CacheBlock_Unique>& cache_set) {
        return sum + std::count_if(cache_set.begin(), cache_set.end(), [](const CacheBlock_Unique& block) {
            return block.valid_flag;
        });
    });

    int total_block_count = num_cache_sets * cache_associativity;
    return static_cast<double>(used_block_count) / total_block_count;
}

