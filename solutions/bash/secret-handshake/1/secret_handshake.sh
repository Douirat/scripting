#!/usr/bin/bash

declare -A spectrum=(
    [4]="wink"
    [3]="double blink"
    [2]="close your eyes"
    [1]="jump"
    [0]="Reverse the order of the operations in the secret handshake."
)

toBinary(){
local x="$1"
local binary=""
while ((x > 0 )); do
    binary="$((x % 2))$binary"
    ((x /= 2))
done
# echo "bin: $binary"

while (( ${#binary} < 5)); do
    binary="0$binary"
done
echo "$binary"
}


main(){

local x="$1"
local combo=()
local result=""
local reverse=0



local binary=$(toBinary "$x")
# echo "$binary"

for ((i=0; i<${#binary}; i++)); do
local char=${binary:i:1}
    if (( char == 1 )); then
    case "$i" in
        0)
         reverse=1
         ;;
        1)
        combo+=("${spectrum[1]}")
        ;;
        2)
        combo+=("${spectrum[2]}")
        ;;
        3)
        combo+=("${spectrum[3]}")
        ;;
        4)
        combo+=("${spectrum[4]}")
        ;;
    esac
    fi
done

if (( reverse == 0 )); then
for((i=${#combo[@]}-1; i>=0; i--)); do
if [[ "$result" == "" ]]; then
    result="${combo[$i]}"
else
 result+=",${combo[$i]}"
fi
done
else
for ((i=0; i<${#combo[@]}; i++)); do
if [[ "$result" == "" ]]; then
    result="${combo[$i]}"
else
 result+=",${combo[$i]}"
fi
done
fi

echo "$result"
}

main "$@"