#!/bin/bash

myVar="Hey My name is Ahmad"

myVarLength=${#myVar}

echo "Length of the myVar is $myVarLength"

echo "Upper case of the myVay is ${myVar^^} "

echo "Upper case of the myVay is ${myVar,,} "

newVar=${myVar/Ahmad/Bilal}

echo "newVar is ------ $newVar"
 

echo " newVar is ------ $newVar "

echo "After slice is ${myVar:4:2} "
