#ifndef CACHES_H
#define CACHES_H
#include <vector>
#include <string>
#include <chrono>
enum cache_policy {
    DIRECT_MAPPED,
    SET_ASSOCIATIVE,
    FULLY_ASSOCIATIVE
};
struct MemoryBlockDescriptor {
    double last_access_timestamp; 
    std::vector<long long> memory_addresses; 
};
struct CacheBlock {
    bool valid;
    size_t tag;
    int last_used;
    bool dirty;
};
class Cache {
public:
    Cache(size_t total_cache_size, size_t single_block_size, size_t set_associativity);
    bool access(size_t address, int current_time, bool is_store);

private:
    size_t num_sets;
    size_t block_size;
    size_t associativity;
    std::vector<std::vector<CacheBlock>> cache;

    std::pair<size_t, size_t> tagindex(size_t mem_address) const;
};
struct CacheBlock_Unique {
    bool valid_flag;
    bool dirty_flag;
    unsigned long tag_value;
    int last_used_time;
};
class cachepart2 {
public:
    cachepart2(size_t total_cache_bytes, size_t block_size_bytes_param, size_t associativity_level);
    bool performWriteback(size_t address_value, int time_current, bool store_flag, cachepart2* secondary_cache = nullptr);
    int getHitCount() const { return hit_count; }
    int getAccessCount() const { return access_count; }
    double computeUtilizationRate() const;
private:
    size_t block_size_bytes;
    size_t cache_associativity;
    size_t num_cache_sets;
    std::vector<std::vector<CacheBlock_Unique>> cache_storage;
    int hit_count = 0;
    int access_count = 0;

    std::pair<size_t, size_t> tagindex(size_t addr_value) const;
};
class cachepart1 {
private:
    cache_policy memory_allocation_mode;
    std::string file_resource_name;
    std::chrono::time_point<std::chrono::high_resolution_clock> start_time;
    long long direct_mapped(int cache_size, int cache_line_size);
    long long set_associative(int cache_size, int cache_line_size, int associativity);
    long long fully_associative(int cache_size, int cache_line_size, std::string policy);
    long long simulate_hot_cold(int entries, int line_size);
    void update_hot_cold_tree(std::vector<int>& hot_cold_tree, int entries, int hit_index);
    void handle_hot_cold_miss(std::vector<MemoryBlockDescriptor>& cache, std::vector<int>& hot_cold_tree, int entries, long long base, int line_size);

public:
    long long total;
    cachepart1(cache_policy policy_mode, std::string file_path);
    long long simulate(int cache_size, int cache_line_size, int associativity, std::string policy = "");
};

void outputcachespart2(const std::string& fn, cachepart2& l1, cachepart2& l2, int adjustment_hits);

#endif

