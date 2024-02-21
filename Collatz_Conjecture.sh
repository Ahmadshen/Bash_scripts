#!/bin/bash

# Check if the input is a positive integer
if [[ $1 -le 0 || ! $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Only positive numbers are allowed"
    exit 1
fi

n=$1
steps=0

# Implement the Collatz Conjecture
while [[ $n -ne 1 ]]; do
    if (( n % 2 == 0 )); then
        n=$((n/2))
    else
        n=$((3*n+1))
    fi
    ((steps++))
done

echo $steps
