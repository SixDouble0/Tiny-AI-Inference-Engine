CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -O2 -Isrc -Itests 

test_arena: src/memory/arena.c tests/unity/unity.c tests/test_arena.c
	$(CC) $(CFLAGS) src/memory/arena.c tests/unity/unity.c tests/test_arena.c -o test_arena.exe

test_gemm: src/operations/gemm.c tests/unity/unity.c tests/test_gemm.c
	$(CC) $(CFLAGS) src/operations/gemm.c tests/unity/unity.c tests/test_gemm.c -o test_gemm.exe

test_conv2d: src/operations/conv2d.c tests/unity/unity.c tests/test_conv2d.c
	$(CC) $(CFLAGS) src/operations/conv2d.c tests/unity/unity.c tests/test_conv2d.c -o test_conv2d.exe

test_im2col: src/operations/im2col.c src/operations/conv2d.c src/operations/gemm.c tests/unity/unity.c tests/test_im2col.c
	$(CC) $(CFLAGS) src/operations/im2col.c src/operations/conv2d.c src/operations/gemm.c tests/unity/unity.c tests/test_im2col.c -o test_im2col.exe

test_relu: src/operations/relu.c tests/unity/unity.c tests/test_relu.c
	$(CC) $(CFLAGS) src/operations/relu.c tests/unity/unity.c tests/test_relu.c -o test_relu.exe

test_requantize: src/operations/requantize.c tests/unity/unity.c tests/test_requantize.c
	$(CC) $(CFLAGS) src/operations/requantize.c tests/unity/unity.c tests/test_requantize.c -o test_requantize.exe

test_softmax: src/operations/softmax.c tests/unity/unity.c tests/test_softmax.c
	$(CC) $(CFLAGS) src/operations/softmax.c tests/unity/unity.c tests/test_softmax.c -o test_softmax.exe

main: src/main.c src/memory/arena.c src/operations/gemm.c src/operations/conv2d.c src/operations/im2col.c src/operations/relu.c src/operations/requantize.c src/operations/softmax.c src/model/loader.c
	$(CC) $(CFLAGS) -o main.exe $^
clean:
	del test_arena.exe
	del test_gemm.exe
	del test_conv2d.exe
	del test_im2col.exe
	del test_relu.exe
	del test_requantize.exe
	del test_softmax.exe