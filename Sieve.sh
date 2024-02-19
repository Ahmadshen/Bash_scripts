#!/bin/bash

# Sieve of Eratosthenes
max=$1
declare -a primes
for ((i=2; i<=max; i++)); do
    primes[i]=1
done
for ((i=2; i*i<=max; i++)); do
    if (( primes[i] == 1 )); then
        for ((j=i*i; j<=max; j+=i)); do
            primes[j]=0
        done
    fi
done
first=1
for ((i=2; i<=max; i++)); do
    if (( primes[i] == 1 )); then
        if (( first )); then
            first=0
        else
            echo -n " "
        fi
        echo -n "$i"
    fi
done