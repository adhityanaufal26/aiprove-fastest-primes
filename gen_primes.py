import struct
N = 5_000_000
# odd-only sieve
size = (N + 1) // 2
is_comp = bytearray(size)
import math
for i in range(3, int(N**0.5) + 1, 2):
    if not is_comp[i // 2]:
        step = i
        start = i * i // 2
        is_comp[start:size:step] = b'\x01' * ((size - 1 - start) // step + 1)
primes = [2] + [2*i+1 for i in range(1, size) if not is_comp[i]]
assert len(primes) == 348513, len(primes)
assert primes[-1] == 4999999
with open('primes.bin', 'wb') as f:
    f.write(struct.pack('<%dI' % len(primes), *primes))
print("primes:", len(primes), "last:", primes[-1])
# verify samples
import bisect
for n, c in [(10,4),(100,25),(1000,168),(100000,9592),(1000000,78498),(5000000,348513)]:
    assert bisect.bisect_right(primes, n) == c, (n, c)
print("samples OK")
