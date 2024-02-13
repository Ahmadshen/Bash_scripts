#!/usr/bin/env bash
cand=$(echo "$1" | sed 's/-/ /g; s/[[:punct:]]//g')
result=""
for i in $cand; do
  result+=${i:0:1}
done
echo "${result^^}"
