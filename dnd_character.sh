#!/bin/bash

# Simulate rolling three 6-sided dice
roll() {
    echo $((RANDOM % 16 + 3))
}

# Calculate the ability modifier
mod() {
    score=$(($1 - 10))
    # If score is negative and odd, decrement it to round down when divided by 2
    if ((score % 2 != 0 && score < 0)); then
        ((--score))
    fi
    echo $((score / 2))
}

# Generate a character
gen() {
    for ability in strength dexterity constitution intelligence wisdom charisma; do
        rollResult=$(roll)
        echo "$ability $rollResult"
        if [ "$ability" = "constitution" ]; then
            constitution=$rollResult
        fi
    done
    echo "hitpoints $((10 + $(mod $constitution)))"
}

# Main function
main() {
    if [ "$1" = "modifier" ]; then
        mod $2
    elif [ "$1" = "generate" ]; then
        gen
    fi
}

main "$@"