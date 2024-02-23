#!/bin/bash

# Convert the input number to binary
binary=$(echo "obase=2;$1" | bc)

# Initialize a counter for the number of 1s
count=0

# Loop through each digit in the binary number
for (( i=0; i<${#binary}; i++ )); do
  # If the digit is 1, increment the counter
  if [ "${binary:$i:1}" -eq "1" ]; then
    ((count++))
  fi
done

# Display the count of 1s
echo $count