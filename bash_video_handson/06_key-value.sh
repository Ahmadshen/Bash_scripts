#!/bin/bash

declare -A myArray

myArray=( [name]=Ahmad [age]=20 [city]=Paris )

echo "My name is ${myArray[name]}, age is ${myArray[age]}, and city is ${myArray[city]}"

