#!/bin/bash

# Define the allergens and their corresponding scores
declare -A allergens
allergens=(
  ["eggs"]=1
  ["peanuts"]=2
  ["shellfish"]=4
  ["strawberries"]=8
  ["tomatoes"]=16
  ["chocolate"]=32
  ["pollen"]=64
  ["cats"]=128
)

# Function to determine if a person is allergic to a given item
is_allergic_to() {
  local score=$1
  local item=$2
  (( (score & ${allergens[$item]}) > 0 )) && echo "Yes" || echo "No"
}

# Function to list all allergies
list_allergies() {
  local score=$1
  for item in "${!allergens[@]}"; do
    (( (score & ${allergens[$item]}) > 0 )) && echo $item
  done
}

# Test the functions
score=34
item="peanuts"
echo "Is allergic to $item? $(is_allergic_to $score $item)"
echo "All allergies: $(list_allergies $score)"