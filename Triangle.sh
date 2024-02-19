#!/bin/bash

# Check if there are 4 arguments
if [ $# -ne 4 ]; then
    echo "Usage: $0 <type> <side1> <side2> <side3>"
    exit 1
fi

type=$1
a=$2
b=$3
c=$4

# Check if all sides are greater than 0
if [ $a -le 0 ] || [ $b -le 0 ] || [ $c -le 0 ]; then
    echo "false"
    exit 0
fi

# Check if the sum of the lengths of any two sides is greater than the length of the third side
if [ $((a + b)) -lt $c ] || [ $((b + c)) -lt $a ] || [ $((a + c)) -lt $b ]; then
    echo "false"
    exit 0
fi

# Check the type of the triangle
case $type in
    "equilateral")
        if [ $a -eq $b ] && [ $b -eq $c ]; then
            echo "true"
        else
            echo "false"
        fi
        ;;
    "isosceles")
        if [ $a -eq $b ] || [ $b -eq $c ] || [ $a -eq $c ]; then
            echo "true"
        else
            echo "false"
        fi
        ;;
    "scalene")
        if [ $a -ne $b ] && [ $b -ne $c ] && [ $a -ne $c ]; then
            echo "true"
        else
            echo "false"
        fi
        ;;
    *)
        echo "Invalid type. Valid types are equilateral, isosceles, scalene"
        exit 1
        ;;
esac
