#!/usr/bin/env bash

# Initialize counts to zero
declare -A counts
counts[A]=0
counts[C]=0
counts[G]=0
counts[T]=0

# Check if no argument is provided (empty strand)
if [[ $# -eq 0 ]]; then
    for nucleotide in A C G T; do
        echo "$nucleotide: 0"
    done
    exit 0
fi

# Loop through the sequence and count nucleotides
sequence=$1
for (( i=0; i<${#sequence}; i++ )); do
    nucleotide=${sequence:i:1}
    if [[ ${counts[$nucleotide]+_} ]]; then
        (( counts[$nucleotide]++ ))
    else
        echo "Invalid nucleotide in strand"
        exit 1
    fi
done

# Print the counts in the expected order
for nucleotide in A C G T; do
    echo "$nucleotide: ${counts[$nucleotide]}"
done
