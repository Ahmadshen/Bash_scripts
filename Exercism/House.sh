#!/bin/bash

# Define the verses of the nursery rhyme
verses=(
    "This is the house that Jack built."
    "This is the malt
that lay in the house that Jack built."
    "This is the rat
that ate the malt
that lay in the house that Jack built."
    "This is the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
    "This is the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
    "This is the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
    "This is the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
    "This is the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
    "This is the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
    "This is the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
    "This is the farmer sowing his corn
that kept the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
    "This is the horse and the hound and the horn
that belonged to the farmer sowing his corn
that kept the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built."
)

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_verse> <end_verse>"
    exit 1
fi

# Extract start and end verse numbers
start_verse="$1"
end_verse="$2"

# Check if the verse numbers are valid
if [ "$start_verse" -lt 1 ] || [ "$end_verse" -gt "${#verses[@]}" ] || [ "$start_verse" -gt "$end_verse" ]; then
    echo "invalid" >&2
    exit 2
fi

# Output the requested verses
for ((i = start_verse - 1; i < end_verse; i++)); do
    echo "${verses[i]}"
    echo  # Add an empty line between verses
done
