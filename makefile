CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -Isrc -Itests

test_arena: src/memory/arena.c tests/unity/unity.c tests/test_arena.c
	$(CC) $(CFLAGS) src/memory/arena.c tests/unity/unity.c tests/test_arena.c -o test_arena.exe

clean:
	del test_arena.exe