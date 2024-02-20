#!/bin/env bash
# Calculate the square root
sqrt=$(echo "sqrt($1)" | bc ) && echo "$sqrt"