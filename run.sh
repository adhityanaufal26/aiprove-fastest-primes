#!/bin/sh
# Run command for the AIProve fastest-primes grader.
# Reads N from stdin, prints pi(N) to stdout.
# Prefers the prebuilt static binary; falls back to compiling main.c.
cd "$(dirname "$0")" || exit 1
read N
if [ -x ./primes-static ]; then
    out=$(printf '%s\n' "$N" | ./primes-static 2>/dev/null)
    if [ -n "$out" ]; then printf '%s\n' "$out"; exit 0; fi
fi
if [ ! -x ./primes ]; then
    gcc -O3 -march=native -o primes main.c 2>/dev/null || gcc -O2 -o primes main.c
fi
printf '%s\n' "$N" | ./primes
