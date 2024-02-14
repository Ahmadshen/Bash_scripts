#!/bin/bash

# Define the scoring table
# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

# Initialize the scoring table
declare -A scoring_table=(
    [A]=1 [E]=1 [I]=1 [O]=1 [U]=1 [L]=1 [N]=1 [R]=1 [S]=1 [T]=1
    [D]=2 [G]=2
    [B]=3 [C]=3 [M]=3 [P]=3
    [F]=4 [H]=4 [V]=4 [W]=4 [Y]=4
    [K]=5
    [J]=8 [X]=8
    [Q]=10 [Z]=10
)

# Initialize variables
argument=$(echo "$1" | tr -d ' ')  # Remove spacing
len=${#argument}
total_points=0
declare -A letter_counts

# Loop through each character of the argument
for (( i=0; i<len; i++ )); do
    # Get the current character
    char="${argument:i:1}"

    # Convert the character to uppercase for case-insensitive comparison
    char_upper="${char^^}"

    # Check if the character is a letter and exists in the scoring table
    if [[ "$char_upper" =~ [A-Z] ]] && [[ -n "${scoring_table[$char_upper]}" ]]; then
        # Increment the count of the current letter
        letter_counts[$char_upper]=$(( ${letter_counts[$char_upper]} + 1 ))
    fi
done

# Calculate total points based on the counts in letter_counts array
for letter in "${!letter_counts[@]}"; do
    count="${letter_counts[$letter]}"
    # If the letter comes twice, count its value twice
    if (( count > 1 )); then
        total_points=$(( total_points + scoring_table[$letter] * count ))
    else
        total_points=$(( total_points + scoring_table[$letter] ))
    fi
done

# Print the total points
echo "$total_points"
