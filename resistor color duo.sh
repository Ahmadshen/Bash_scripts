#!/usr/bin/env bash

declare -A colors=(
    ["black"]=0
    ["brown"]=1
    ["red"]=2
    ["orange"]=3
    ["yellow"]=4
    ["green"]=5
    ["blue"]=6
    ["violet"]=7
    ["grey"]=8
    ["white"]=9
)

color1=${1,,}
color2=${2,,}

if [[ -z "${colors[${color1}]}" ]] || [[ -z "${colors[${color2}]}" ]]; then
    echo "invalid color"
    exit 1
fi

if [[ "${color1}" == "black" ]]; then
    echo "${colors[${color2}]}"
else
    echo "${colors[${color1}]}${colors[${color2}]}"
fi