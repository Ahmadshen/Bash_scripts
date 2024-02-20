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

# Check if the command is "allergic_to"
if [[ $2 == "allergic_to" ]]; then
  (( ($1 & ${allergens[$3]}) > 0 )) && echo "true" || echo "false"
fi

# Check if the command is "list"
if [[ $2 == "list" ]]; then
  output=""
  for item in "eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats"; do
    (( ($1 & ${allergens[$item]}) > 0 )) && output+="$item "
  done
  # Remove trailing space if output is not empty
  #Removing the trailing space**: Initially, the script had an issue where it was outputting an extra space at the end of the list of allergies. To fix this, we added a line to remove the last character from the `output` variable, which is the trailing space. However, this caused another issue where the script would fail if the `output` variable was empty (i.e., if the person had no allergies). To fix this, we added a condition to only remove the last character if the `output` variable is not empty
  [[ -n $output ]] && output=${output::-1}
  echo $output
fi