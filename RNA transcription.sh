#!/usr/bin/env bash

# Check if the input contains any characters other than 'A', 'C', 'G', or 'T'
#If statement that checks if the first argument to the script (`$1`) contains any characters other than 'A', 'C', 'G', or 'T'. The `=~` operator is used for regex matching in bash, and `[^ACGT]` is a regex pattern that matches any character not in the set {'A', 'C', 'G', 'T'}.
if [[ $1 =~ [^ACGT] ]]; then
  echo "Invalid nucleotide detected."
  exit 1
fi

# Replace each DNA nucleotide with its RNA complement
#The `tr` command is used to translate or delete characters. Here, it's used to replace each DNA nucleotide in the input with its RNA complement: 'G' with 'C', 'C' with 'G', 'T' with 'A', and 'A' with 'U'. The translated string is then printed to the console.
echo "$1" | tr 'GCTA' 'CGAU'