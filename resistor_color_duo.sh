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



main(){
local x="$1"
local y="$2"

local -A associativeColors

for (( i=0; i<${#colors[@]}; i++)); do
    associativeColors["${colors[i]}"]="$i"
done

if [[ -v "associativeColors[$x]" && -v "associativeColors[$y]" ]]; then
if (( associativeColors[$x] == 0)); then
    echo "${associativeColors[$y]}"
    exit 0
fi
echo "${associativeColors[$x]}${associativeColors[$y]}"
exit 0
else
echo "invalid color"
return 1
fi
}

main "$@"