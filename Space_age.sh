#!/usr/bin/env bash

# Declare associative array to store values of Planets
declare -A planets

# Store orbital periods in Earth years
planets["Mercury"]=0.2408467
planets["Venus"]=0.61519726
planets["Earth"]=1.0
planets["Mars"]=1.8808158
planets["Jupiter"]=11.862615
planets["Saturn"]=29.447498
planets["Uranus"]=84.016846
planets["Neptune"]=164.79132

# Earth seconds in a year
earth_seconds=31557600

# Check if the planet exists in the array
if [[ -z "${planets[$1]}" ]]; then
    echo "not a planet"
    exit 1
else
    # Calculate the age
    age=$(bc <<< "scale=5; $2 / (${planets[$1]} * $earth_seconds)")
    # Use printf to round the output to two decimal places and output only the age
    printf "%.2f\n" "$age"
fi