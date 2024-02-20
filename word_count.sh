#!/usr/bin/env bash

# Convert to lowercase, replace newline characters with spaces, extract words, sort them, count unique occurrences, and format the output
echo "${1,,}" | sed 's/\\n/ /g' | grep -o "\<[a-z0-9']\{0,\}\>" | sort | uniq -c | awk '{print $2": "$1}'