#!/bin/env bash

# Check if the number of arguments is correct
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <phone_number>"
  exit 1
fi

# Assign the argument to a variable for clarity
phone_number=$1

# Remove all non-digit characters
phone_number=${phone_number//[^0-9]/}

# If the phone number starts with 1 and its length is 11, remove it
if [[ ${phone_number:0:1} == "1" && ${#phone_number} -eq 11 ]]; then
  phone_number=${phone_number:1}
fi

# Check if the phone number is valid
if [[ ${#phone_number} -ne 10 || ${phone_number:0:1} -lt 2 || ${phone_number:3:1} -lt 2 ]]; then
  echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
  exit 1
fi

# Print the cleaned up phone number
echo "$phone_number"