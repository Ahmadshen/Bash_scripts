#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1
    for ((i=2;i*i<=num;i++)); do
        if ((num%i==0)); then
            return 1
        fi
    done
    return 0
}

# Function to find the nth prime number
nth_prime() {
    local n=$1
    local count=0
    local num=2
    while ((count<n)); do
        if is_prime $num; then
            ((count++))
        fi
        ((num++))
    done
    echo $((num-1))
}

# Main script
if (( $# != 1 )); then
    echo "Usage: $0 <n>"
    exit 1
fi

n=$1
if (( n <= 0 )); then
    echo "invalid input"
    exit 1
fi

nth_prime $n