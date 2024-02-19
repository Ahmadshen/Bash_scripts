#!/bin/bash

# Check if the input string is empty
if [ -z "$1" ]; then
    echo "true"
    exit 0
fi

# Convert input to lowercase and remove spaces and hyphens
input=$(echo "$1" | tr '[:upper:]' '[:lower:]' | tr -d ' -')

# Check for repetition
repeated=false
for ((i = 1; i < ${#input}; i++)); do
    current_char="${input:i:1}"
    previous_chars="${input:0:i}"
    if [[ $previous_chars == *"$current_char"* ]]; then
        repeated=true
        break
    fi
done

# Check if any alphabet is repeated
if $repeated; then
    echo "false"
else
    echo "true"
fi