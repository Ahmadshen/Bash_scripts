#!/bin/bash

# Function to check divisibility and print corresponding sound
rain_sounds() {
     number=$1
    divisor=$2
      sound=$3

    if ((number % divisor == 0)); then
        echo -n "$sound"
    fi
}

# Main script
rain_sounds $1 3 "Pling"
rain_sounds $1 5 "Plang"
rain_sounds $1 7 "Plong"

if ! (($1 % 3 == 0)) && ! (($1 % 5 == 0)) && ! (($1 % 7 == 0)); then
    echo "$1"
fi
