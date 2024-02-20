#!/bin/env bash

# Check if the number of arguments is correct
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <series> <slice_length>"
  exit 1
fi

# Assign the arguments to variables for clarity
series=$1
slice_length=$2

# Check if the series is empty
if [[ -z $series ]]; then
  echo "series cannot be empty"
  exit 1
fi

# Check if the slice length is valid
if ((slice_length > ${#series})); then
  echo "slice length cannot be greater than series length"
  exit 1
elif ((slice_length == 0)); then
  echo "slice length cannot be zero"
  exit 1
elif ((slice_length < 0)); then
  echo "slice length cannot be negative"
  exit 1
fi

# Initialize an empty variable to hold the output
output=""

# Slice the series
for ((i=0; i<=${#series}-slice_length; i++)); do
  output+="${series:i:slice_length} "
done

# Print the output, removing the trailing space
echo "${output::-1}"