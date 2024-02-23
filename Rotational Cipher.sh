#!/bin/bash

rot_cipher() {
    local str="$1"
    local rot="$2"
    local lower=$(echo {a..z} | tr -d ' ')
    local upper=$(echo {A..Z} | tr -d ' ')
    local rotated_lower=$(echo "$lower$lower" | cut -c$((rot%26+1))-$((rot%26+26)))
    local rotated_upper=$(echo "$upper$upper" | cut -c$((rot%26+1))-$((rot%26+26)))
    echo "$str" | tr 'a-zA-Z' "$rotated_lower$rotated_upper"
}

# Test the function
rot_cipher "$1" "$2"