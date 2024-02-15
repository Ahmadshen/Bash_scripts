#!/usr/bin/env bash


(( $# == 1 )) || exit 1

# Define a function to calculate the factors of a number
calculate_factors() {
number=$1 

  # Loop to find the factors of the number
divisor=2
  while (( number > 1 )); do
    while (( number % divisor == 0 )); do
      result_factors+=( "$divisor" )
      (( number = number/divisor))
    done
    (( divisor == 2 && (divisor+=1) || (divisor+=2) ))  # Increment the divisor to find all factors
  done

  echo "${result_factors[@]}"
}

calculate_factors "$@"
