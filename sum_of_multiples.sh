# If no factors are provided, print 0 and exit
if [ $# -eq 0 ]; then
    echo 0
    exit 0
fi

# For each base value
for base in "$@"; do
    # If base is 0, ignore it
    if [ "$base" -eq 0 ]; then
        continue
    fi

    # If base is greater than level, continue with the next base
    if [ "$base" -gt "$level" ]; then
        continue
    fi

    # Find multiples of the base value that are less than the level
    for (( i=base; i<level; i+=base )); do
        multiples[$i]=$i
    done
done

# Calculate the sum of the unique multiples
sum=0
for multiple in "${multiples[@]}"; do
    sum=$((sum + multiple))
done

# Print the sum
echo $sum