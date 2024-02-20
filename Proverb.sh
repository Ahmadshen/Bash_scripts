#!/bin/bash

# Check if there are no arguments
if [ $# -eq 0 ]; then
    exit 0
fi

# Store the arguments in an array
args=("$@")

# Iterate over the arguments
for ((i=0; i<$#-1; i++)); do
    echo "For want of a ${args[$i]} the ${args[$i+1]} was lost."
done

# Print the final line of the proverb
echo "And all for the want of a ${args[0]}."