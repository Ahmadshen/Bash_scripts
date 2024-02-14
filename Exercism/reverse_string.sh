#!/usr/bin/env bash
# Function to reverse a string
reverse_string() {
    local input="$1"
    local reversed=""

    # Loop through each character in the input string starting from the end
    for (( i=${#input}-1; i>=0; i-- )); do
        reversed="${reversed}${input:i:1}"
    done

    echo "$reversed"
}

# Get the argument
input="$1"

# Check if the input is empty
if [ -z "$input" ]; then
    echo ""
else
    # Call the function to reverse the string
    reversed_string=$(reverse_string "$input")
    echo "$reversed_string"
fi
