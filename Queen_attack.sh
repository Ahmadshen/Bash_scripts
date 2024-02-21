#!/usr/bin/env bash

validate_position() {
    local row=$1
    local column=$2

    if [ "$row" -lt 0 ]; then
        echo "queen row not positive"
        exit 1
    elif [ "$row" -gt 7 ]; then
        echo "queen row not on board"
        exit 1
    elif [ "$column" -lt 0 ]; then
        echo "queen column not positive"
        exit 1
    elif [ "$column" -gt 7 ]; then
        echo "queen column not on board"
        exit 1
    fi
}

# Parse input arguments
while getopts "w:b:" opt; do
    case $opt in
        w)
            IFS=',' read -ra w <<< "$OPTARG"
            validate_position "${w[0]}" "${w[1]}" "white"
            ;;
        b)
            IFS=',' read -ra b <<< "$OPTARG"
            validate_position "${b[0]}" "${b[1]}" "black"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

# Check if queens are at the same position
if [ "${w[0]}" -eq "${b[0]}" ] && [ "${w[1]}" -eq "${b[1]}" ]; then
    echo "Queens cannot be at the same position."
    exit 1
fi

# Check if queens can attack each other
if [ "${w[0]}" -eq "${b[0]}" ] || [ "${w[1]}" -eq "${b[1]}" ] || [ $((w[0]-b[0])) -eq $((w[1]-b[1])) ] || [ $((w[0]-b[0])) -eq $((-w[1]+b[1])) ]; then
    echo "true"
else
    echo "false"
fi