#!/usr/bin/env bash

# Check if the input contains any characters other than 'A', 'C', 'G', or 'T'
if [[ $1 =~ [^ACGT] ]]; then
  echo "Invalid nucleotide detected."
  exit 1
fi

# Replace each DNA nucleotide with its RNA complement
echo "$1" | tr 'GCTA' 'CGAU'