#!/bin/bash

# Convert the first argument to lowercase
lowercase_input="${1,,}"

# Loop through each letter of the alphabet
for letter in {a..z}; do
    # Check if the lowercase input contains the current letter
    if [[ "$lowercase_input" != *"$letter"* ]]; then
        echo "false"
        exit
    fi
done

echo "true"

