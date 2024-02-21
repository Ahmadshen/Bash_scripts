#!/usr/bin/env bash

# function to prepare the string
prep() {
   echo "$1" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]' | fold -w1 | sort | tr -d '\n'
}

# function to check if given arguments are anagrams
isAnagram() {
   word=$(prep "$1")
   original_word=$(echo "$1" | tr '[:upper:]' '[:lower:]')
   shift
   potential_anagrams="$@"
   result=""

   for potential in $potential_anagrams; do
       if [[ $(prep "$potential") == "$word" ]]; then
           # Exclude the original word from the list of potential anagrams
           if [[ $(echo "$potential" | tr '[:upper:]' '[:lower:]') != "$original_word" ]]; then
               result+="$potential "
           fi
       fi
   done

   # Trim trailing space and echo without trailing newline
   result=$(echo "$result" | sed 's/ *$//')
   echo -n "$result"
}

# call the function with all arguments
isAnagram "$@"