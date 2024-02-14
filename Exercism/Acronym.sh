#!/usr/bin/env bash
cand=$(echo "$1" | sed 's/-/ /g; s/[[:punct:]]//g')
result=""
for word in $cand; do
  result+=${word:0:1}
done
echo "${result^^}"

