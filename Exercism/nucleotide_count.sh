#!/usr/bin/env bash

# Function to count nucleotides in a given sequence
count_nucleotides() {
    sequence=$1
    declare -A counts

    # Initialize counts to zero
    counts[A]=0
    counts[C]=0
    counts[G]=0
    counts[T]=0

    # Loop through the sequence and count nucleotides
    for (( i=0; i<${#sequence}; i++ )); do
        nucleotide=${sequence:i:1}
        if [[ ${counts[$nucleotide]+_} ]]; then
            (( counts[$nucleotide]++ ))
        else
            echo "Invalid nucleotide in strand"
            return 1
        fi
    done

    # Print the counts in the expected order
    for nucleotide in A C G T; do
        echo "$nucleotide: ${counts[$nucleotide]}"
    done
}

# Main function
main() {
    # Check if no argument is provided (empty strand)
    if [[ $# -eq 0 ]]; then
        for nucleotide in A C G T; do
            echo "$nucleotide: 0"
        done
    else
        # Validate the sequence and count nucleotides
        count_nucleotides "$1" || return 1
    fi
}

# Run the main function with the provided argument
main "$@"
