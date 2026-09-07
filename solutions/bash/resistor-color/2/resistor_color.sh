#!/usr/bin/bash

colors=(
    "black"
    "brown"
    "red"
    "orange"
    "yellow"
    "green"
    "blue"
    "violet"
    "grey"
    "white"
)

getColor(){
local x="$1"
local -A associativeColors

for (( i=0; i<${#colors[@]}; i++)); do
    associativeColors["${colors[i]}"]="$i"
done

echo "${associativeColors[$x]}"
}

main(){
local x="$1"
local y="$2"
if [[ "$x" == "colors" ]]; then

    # printf '%s\n' "${colors[@]}"
    for n in ${colors[@]}; do
        echo "$n"
    done

    exit 0
fi
local result=$(getColor "$y")
echo "$result"
}

main "$@"