#!/bin/bash

# Define the plain and cipher alphabets
plain="abcdefghijklmnopqrstuvwxyz"
cipher="zyxwvutsrqponmlkjihgfedcba"

# Function to encode or decode
atbash() {
    local input="$1"
    local output=""
    local index

    # Remove spaces, commas, and convert to lowercase
    input=$(echo "$input" | tr -d " . , " | tr '[:upper:]' '[:lower:]')

    # Iterate over each character in the input
    for (( i=0; i<${#input}; i++ )); do
        char="${input:$i:1}"
        index=$(expr index "$plain" "$char")
        if [ "$index" -gt 0 ]; then
            output+="${cipher:$index-1:1}"
        else
            output+="$char"
        fi
    done

    echo "$output"
}

# Check the command line arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 {encode|decode} string"
    exit 1
fi

command="$1"
string="$2"

# Call the appropriate function
if [ "$command" = "encode" ]; then
    atbash "$string" | fold -w 5 | tr '\n' ' ' | sed 's/ *$//'
elif [ "$command" = "decode" ]; then
    atbash "$string"
else
    echo "Invalid command: $command"
    exit 1
fi