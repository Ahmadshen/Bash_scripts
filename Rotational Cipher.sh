#!/bin/bash

rot_cipher() {
    local str="$1"
    local rot="$2"
    if ((rot == 0 || rot == 26)); then
        echo "$str"
    else
        echo "$str" | tr \
            'A-Za-z' \
            "$(printf '%.*s' "$((26-rot%26))" 'NOPQRSTUVWXYZABCDEFGHIJKLM')$(printf '%.*s' "$((26-rot%26))" 'nopqrstuvwxyzabcdefghijklm')"
    fi
}

# Test the function
rot_cipher "$1" "$2"