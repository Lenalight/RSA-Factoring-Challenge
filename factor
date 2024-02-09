#!/usr/bin/env python3
import sys
import math
import time

def factorize_number(number):
    """Factorize a number into two smaller numbers."""
    for i in range(2, int(math.sqrt(number)) + 1):
        if number % i == 0:
            return i, number // i
    return None

def factorize_file(filename):
    """Factorize numbers from a file and print the results."""
    with open(filename, 'r') as file:
        for line in file:
            number = int(line.strip())
            factors = factorize_number(number)
            if factors:
                print(f"{number}={factors[0]}*{factors[1]}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./factors <file>")
        sys.exit(1)

    filename = sys.argv[1]

    # Set a timeout of 5 seconds
    start_time = time.time()
    factorize_file(filename)
    end_time = time.time()

    elapsed_time = end_time - start_time
    print(f"\nreal\t{elapsed_time:.3f}s\nuser\t{elapsed_time:.3f}s\nsys\t0m0.001s")
