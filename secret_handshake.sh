#!/usr/bin/env bash

# Define the actions
events=("wink" "double blink" "close your eyes" "jump")

# Check if the 5th bit is set
((reverse = $1 >> 4 & 1))

# Initialize an empty string to hold the actions
result=""

# Check each bit of the number
for i in "${!events[@]}"; do
  # If the bit is set, add the corresponding action to the string
  if (($1 >> i & 1)); then
    # If the 5th bit is set, add the action to the beginning of the string
    ((reverse)) && result="${events[i]},$result" || result+="${events[i]},"
  fi
done

# Print the actions, removing the trailing comma
echo "${result%,}"