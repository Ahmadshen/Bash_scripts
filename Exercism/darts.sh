#!/bin/bash

# Check if there are exactly two arguments
if [ "$#" -ne 2 ]; then
    echo "Error: Exactly two arguments are required"
    exit 1
fi

# Check if both arguments are numeric
if ! [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ $2 =~ ^-?[0-9]+(\.[0-9]+)?$ ]] ; then
    echo "Error: Both arguments must be numeric"
    exit 1
fi

x=$1
y=$2

# Calculate the distance from the origin
distance=$(echo "scale=2; sqrt($x^2 + $y^2)" | bc)

# Determine the score based on distance
if (( $(echo "$distance <= 1" | bc -l) )); then
    score=10
elif (( $(echo "$distance <= 5" | bc -l) )); then
    score=5
elif (( $(echo "$distance <= 10" | bc -l) )); then
    score=1
else
    score=0
fi

echo "$score"
