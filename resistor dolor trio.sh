declare -A colors=( ["black"]=0 ["brown"]=1 ["red"]=2 ["orange"]=3 ["yellow"]=4 ["green"]=5 ["blue"]=6 ["violet"]=7 ["grey"]=8 ["white"]=9 )

color1=$1
color2=$2
color3=$3

if [[ -z "${colors[$color1]}" || -z "${colors[$color2]}" || -z "${colors[$color3]}" ]]; then
    echo "Invalid color"
    exit 1
fi

resistor_value=$(( (${colors[$color1]} * 10 + ${colors[$color2]}) * (10 ** ${colors[$color3]}) ))

if (( resistor_value >= 1000000000 )); then
    echo "$((resistor_value / 1000000000)) gigaohms"
elif (( resistor_value >= 1000000 )); then
    echo "$((resistor_value / 1000000)) megaohms"
elif (( resistor_value >= 2000 )); then
    echo "$((resistor_value / 1000)) kiloohms"
else
    echo "${resistor_value} ohms"
fi