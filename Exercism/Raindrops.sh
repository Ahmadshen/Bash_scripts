#!/bin/bash

if (($1 % 3 == 0)); then
    echo -n "Pling"
fi

if (($1 % 5 == 0)); then
    echo -n "Plang"
fi

if (($1 % 7 == 0)); then
    echo -n "Plong"
fi

if (($1 % 3 != 0)) && (($1 % 5 != 0)) && (($1 % 7 != 0)); then
    echo "$1"
fi

