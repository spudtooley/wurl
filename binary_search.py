import os

# Create a function that finds a target number in a list of prime numbers.
# Implement a binary search algorithm in your function.
# The target number will be from 2 through 97. If the target is prime then return "yes" else
# return "no".

# is_prime takes a list of sequential prime numbers from 2 through 97.
# is_prime assumes the primes are ordered by increasing value.

# binary search involves successively splitting a search range into halves and eliminating
# a half with each split so that all values do not need to be checked.

def is_prime(primes_list, number):

    # we will look between low_limit and high_limit repeatedly until we narrow down
    # to a specific value.
    low_limit = 0
    high_limit = len(primes_list) - 1
    mid_value = 0

    while low_limit <= high_limit:

        # find the mid-point of our range so we can determine which half we're in.
        # use rounded-down integer division.
        mid_value = (high_limit + low_limit) // 2

        # If number is greater than our mid_value, we know we're in the upper half so we
        # reset the low_limit.
        if primes_list[mid_value] < number:
            low_limit = mid_value + 1

        # If number is less than our mid_value, we know we're in the lower half so we
        # reset the high_limit.
        elif primes_list[mid_value] > number:
            high_limit = mid_value - 1

        # if we get here, we've pegged our value, and we can return yes
        else:
            return "yes"

    # If we get here after cycling through the while loop, we didn't find our value
    return "no"

# test cases
primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

print(is_prime(primes, 3))
print(is_prime(primes, 4))
print(is_prime(primes, 67))
print(is_prime(primes, 36))
