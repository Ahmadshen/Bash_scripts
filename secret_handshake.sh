#!/usr/bin/env bash

# Define the actions
actions=("wink" "double blink" "close your eyes" "jump")

# Convert the input number to binary
binary=$(echo "obase=2;$1" | bc)

# Initialize an empty array to hold the handshake actions
handshake=()

# Loop over the digits of the binary number
for (( i=0; i<${#binary}; i++ )); do
  # Get the i-th digit from the right
  digit=${binary: -1 - $i:1}

  # If the digit is 1 and it's not the leftmost digit, add the corresponding action to the handshake
  if (( digit == 1 && i < 4 )); then
    handshake+=(${actions[$i]})
  fi

  # If the digit is 1 and it's the leftmost digit, reverse the order of the handshake
  if (( digit == 1 && i == 4 )); then
    handshake=( "${handshake[@]}" )
  fi
done

# Print the handshake
echo ${handshake[@]}