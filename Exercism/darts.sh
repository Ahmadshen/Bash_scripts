#!/bin/bash

# Check if there are exactly two arguments
if [ "$#" -ne 2 ]; then
    echo "Error: Exactly two arguments are required"
    exit 1
fi

# Check if both arguments are numeric
if ! [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ $2 =~ ^-?[0-9]+(\.[0-9]+)?$ ]] ; then
    echo "Error: Both arguments must be numeric"
    exit 1
fi

# Calculate the distance from the origin
bc <<< "scale=4 
        x=$1 ; y=$2 ; d=sqrt(x^2 + y^2 )
        if (d <= 1) 10 else if (d <= 5) 5 else if (d <= 10) 1 else 0"
