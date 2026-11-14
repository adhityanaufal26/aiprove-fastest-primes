CC = gcc
CFLAGS = -O3 -march=native -Wall -Wextra

all: primes

primes: main.c
	$(CC) $(CFLAGS) -o primes main.c

primes-static: main.c
	$(CC) $(CFLAGS) -static -o primes-static main.c

test: primes
	@for n in 0 1 2 3 10 100 1000 100000 1000000 5000000; do \
		printf '%s -> ' "$$n"; echo "$$n" | ./primes; done

clean:
	rm -f primes primes-static

.PHONY: all test clean
