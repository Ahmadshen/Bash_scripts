#!/usr/bin/env bash

# Check if the number of arguments is less than 2 or more than 4
if (( $# < 2 || $# > 4 )); then
    echo "invalid arguments"
    exit 1
fi

# Check if the first two arguments are numeric
for arg in "${@:1:2}"; do
    if ! [[ $arg =~ ^-?[0-9]+$ ]]; then
        echo "invalid arguments"
        exit 1
    fi
done

# Check if the fourth argument is numeric if it exists
if (( $# == 4 )); then
    if ! [[ $4 =~ ^-?[0-9]+$ ]]; then
        echo "invalid arguments"
        exit 1
    fi
elif (( $# == 3 )); then
    echo "invalid arguments"
    exit 1
fi

# Calculate total minutes
total_minutes=$(( $1 * 60 + $2 ))

# Apply delta if provided
if (( $# == 4 )); then
    if [[ $3 == "+" ]]; then
        total_minutes=$(( total_minutes + $4 ))
    elif [[ $3 == "-" ]]; then
        total_minutes=$(( total_minutes - $4 ))
    else
        echo "invalid arguments"
        exit 1
    fi
fi

# Normalize total minutes to the range [0, 1440)
total_minutes=$(( (total_minutes % 1440 + 1440) % 1440 ))

# Calculate hours and minutes
hours=$(( total_minutes / 60 ))
minutes=$(( total_minutes % 60 ))

# Print the time in %H:%M format
printf "%02d:%02d\n" $hours $minutes