#!/bin/bash

square=$1
total=0

# Check if the input is "total"
if [[ $square == "total" ]]; then
    for (( i=1; i<=64; i++ )); do
        grains=$(bc <<< "2^($i - 1)")
        total=$(bc <<< "$total + $grains")
    done
    echo "$total"
    exit 0
fi

# Check if the input is a valid integer between 1 and 64
if ! [[ $square =~ ^[0-9]+$ ]]; then
    echo "Error: invalid input"
    exit 1
fi

if (( square < 1 || square > 64 )); then
    echo "Error: invalid input"
    exit 1
fi

# Calculate the grains on the given square
grains=$(bc <<< "2^($square - 1)")

echo "$grains"
