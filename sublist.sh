#!/bin/bash

# Remove brackets and replace commas with spaces
list1=$(echo "$1" | tr -d '[]' | tr ',' ' ')
list2=$(echo "$2" | tr -d '[]' | tr ',' ' ')

# Check if the lists are equal
if [[ "$list1" == "$list2" ]]; then
    echo "equal"
    exit 0
fi

# Check if list1 is a sublist of list2
if [[ "$list2" =~ (^|[[:space:]])"$list1"($|[[:space:]]) ]]; then
    echo "sublist"
    exit 0
fi

# Check if list2 is a sublist of list1
if [[ "$list1" =~ (^|[[:space:]])"$list2"($|[[:space:]]) ]]; then
    echo "superlist"
    exit 0
fi

# If none of the above conditions are met, the lists are unequal
echo "unequal"