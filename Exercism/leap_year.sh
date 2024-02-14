#!/usr/bin/env bash

# Check if the number of arguments is not equal to 1
if [[ $# -ne 1 ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
fi

# Check if the argument is not a valid integer
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
fi

# Convert the argument to an integer
year=$1

# Check if the year is divisible by 4
if (( year % 4 == 0 )); then
    # Check if the year is divisible by 100
    if (( year % 100 == 0 )); then
        # Check if the year is divisible by 400
        if (( year % 400 == 0 )); then
            echo "true"
        else
            echo "false"
        fi
    else
        echo "true"
    fi
else
    echo "false"
fi
