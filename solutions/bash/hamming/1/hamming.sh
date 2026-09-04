#!/usr/bin/bash

main(){
if (( $# != 2 )); then
    echo "Usage: hamming.sh <string1> <string2>"
    return 1
fi


local a="$1"
local b="$2"
if (( ${#a} != ${#b} )); then
    echo "strands must be of equal length"
    return 1
fi

local count=0

for (( i=0; i<${#a}; i++)); do
    local x=${a:i:1}
     local y=${b:i:1}

    #  echo "x: $x --> y: $y"
    if [[ "$x" != "$y" ]]; then
        (( count++ ))
    fi
done

echo "$count"

}

main "$@"