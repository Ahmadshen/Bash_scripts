#!/usr/bin/env bash

# Function to calculate the square of the sum
square_of_sum() {
    local n=$1
    local sum=0
    for ((i=1; i<=n; i++)); do
        ((sum+=i))
    done
    echo $((sum*sum))
}

# Function to calculate the sum of squares
sum_of_squares() {
    local n=$1
    local sum=0
    for ((i=1; i<=n; i++)); do
        ((sum+=i*i))
    done
    echo $sum
}

# Function to calculate the difference between the square of the sum and the sum of squares
difference() {
    local n=$1
    local sq_sum=$(square_of_sum $n)
    local sum_sq=$(sum_of_squares $n)
    echo $((sq_sum - sum_sq))
}

# Execute the appropriate function based on the first argument
case "$1" in
    square_of_sum)
        square_of_sum "$2"
        ;;
    sum_of_squares)
        sum_of_squares "$2"
        ;;
    difference)
        difference "$2"
        ;;
    *)
        echo "Invalid function specified"
        exit 1
        ;;
esac
