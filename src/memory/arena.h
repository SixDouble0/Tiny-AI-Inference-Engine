#ifndef ARENA_H
#define ARENA_H

#include <stddef.h>
#include <stdint.h>

typedef struct {
    // uint8_t is used to represent a byte of memory
    uint8_t *memory;
    // total size of the arena
    size_t   size;
    // amount of memory currently used
    size_t   used;
    // peak memory usage for single arena (for debugging/benchmarking purposes)
    size_t   peak_usage;
    // global peak usage across all arenas (for debugging/benchmarking purposes)
    size_t global_peak_usage;
} Arena;

void  arena_init(Arena *arena, size_t size);
void *arena_alloc(Arena *arena, size_t size);
void  arena_reset(Arena *arena);
void  arena_destroy(Arena *arena);

#endif