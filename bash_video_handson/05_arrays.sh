#!/bin/bash

#Array
myArray=( 1 20 30.5 Hello "Hey Buddy!")

echo "Value in 3rd index  ${myArray[1]}"

echo "Value in all values ${myArray[*]}"

echo "the length of all values is ${#myArray[*]}"

echo "The value of Array from index 2-3 is ${myArray[*]:2:2}"

myArray+=( New 30 40 )

echo "Values of new array are ${myArray[*]}"
