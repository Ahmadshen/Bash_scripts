#!/usr/bin/env bash

# Check if parameter is provided
if [ -z "$1" ]
then
    echo $0
    exit 1
fi

# Declare an associative array for codon to protein mapping
declare -A codonMap
codonMap=(["AUG"]="Methionine" ["UUU"]="Phenylalanine" ["UUC"]="Phenylalanine" ["UUA"]="Leucine" ["UUG"]="Leucine" ["UCU"]="Serine" ["UCC"]="Serine" ["UCA"]="Serine" ["UCG"]="Serine" ["UAU"]="Tyrosine" ["UAC"]="Tyrosine" ["UGU"]="Cysteine" ["UGC"]="Cysteine" ["UGG"]="Tryptophan" ["UAA"]="STOP" ["UAG"]="STOP" ["UGA"]="STOP")

# Split the input into chunks of 3 characters
input=$1
for ((i=0; i<${#input}; i+=3)); do
    codon=${input:$i:3}

    # Check if codon is valid
    if [[ ! ${codonMap[$codon]} ]]; then
        echo "Invalid codon"
        exit 1
    fi

    # Check if codon is a stop codon
    if [[ ${codonMap[$codon]} == "STOP" ]]; then
        exit 0
    fi

    # Output the protein
    echo ${codonMap[$codon]}
done