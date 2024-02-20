#!/bin/bash

# Check if the input is a natural number
if (( $1 <= 0 )); then
    echo "Classification is only possible for natural numbers."
    exit 1
fi

# Calculate the sum of the factors
sum_of_factors=1
sqrt=$(echo "sqrt($1)" | bc)
for (( i=2; i<=sqrt; i++ )); do
    if (( $1 % i == 0 )); then
        sum_of_factors=$((sum_of_factors + i))
        if (( i != $1 / i )); then
            sum_of_factors=$((sum_of_factors + $1 / i))
        fi
    fi
done

# Classify the number
if (( sum_of_factors == $1 && $1 != 1 )); then
    echo "perfect"
elif (( sum_of_factors > $1 )); then
    echo "abundant"
else
    echo "deficient"
fi