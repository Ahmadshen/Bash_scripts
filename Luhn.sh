#!/usr/bin/env bash

# Input
input=$1

# Remove spaces
input=${input// /}

# Check if input is valid
if [[ ! $input =~ ^[0-9]{2,}$ ]]; then
    echo "false"
    exit 0
fi

# Initialize sum
sum=0

# Loop through the digits from right to left
for (( i=1; i<=${#input}; i++ )); do
    digit=${input: -$i:1}

    # Double every second digit
    if ((i%2==0)); then
        ((digit*=2))
        ((digit>9)) && ((digit-=9))
    fi

    # Add to sum
    ((sum+=digit))
done

# Check if sum is divisible by 10
((sum%10==0)) && echo "true" || echo "false"