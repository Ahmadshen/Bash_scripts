#!/bin/bash

start=$1
end=$2

gifts=(
    "a Partridge in a Pear Tree"
    "two Turtle Doves"
    "three French Hens"
    "four Calling Birds"
    "five Gold Rings"
    "six Geese-a-Laying"
    "seven Swans-a-Swimming"
    "eight Maids-a-Milking"
    "nine Ladies Dancing"
    "ten Lords-a-Leaping"
    "eleven Pipers Piping"
    "twelve Drummers Drumming"
)

ordinals=(
    "first"
    "second"
    "third"
    "fourth"
    "fifth"
    "sixth"
    "seventh"
    "eighth"
    "ninth"
    "tenth"
    "eleventh"
    "twelfth"
)

for ((day=start; day<=end; day++)); do
    echo -n "On the ${ordinals[day-1]} day of Christmas my true love gave to me: "
    for ((i=day; i>1; i--)); do
        echo -n "${gifts[i-1]}, "
    done
    if ((day > 1)); then
        echo "and ${gifts[0]}."
    else
        echo "${gifts[0]}."
    fi
done