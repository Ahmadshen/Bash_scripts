#!/bin/bash

# Check if the input string contains only digits
if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "input must only contain digits"
    exit 1
fi

# Check if the span is negative
if [[ $2 -lt 0 ]]; then
    echo "span must not be negative"
    exit 1
fi

# Check if the span is greater than the length of the string
if [[ $2 -gt ${#1} ]]; then
    echo "span must be smaller than string length"
    exit 1
fi

# Initialize the maximum product
max_product=0

# Loop over the string
for ((i=0; i<=${#1}-$2; i++)); do
    # Get the substring of length span
    substring=${1:i:$2}
    # Initialize the product of the substring
    product=1
    # Calculate the product of the substring
    for ((j=0; j<$2; j++)); do
        product=$((product * ${substring:j:1}))
    done
    # Update the maximum product
    if [[ $product -gt $max_product ]]; then
        max_product=$product
    fi
done

# Print the maximum product
echo $max_product