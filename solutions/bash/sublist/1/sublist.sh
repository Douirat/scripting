#!/usr/bin/bash

main(){
local x="$1"
local y="$2"

local sub=""
local sup=""
local super=0

if (( ${#x} > ${#y} )); then
    sup=${x:1:-1}
    sub=${y:1:-1}
    super=1
elif (( ${#y} > ${#x} )); then
    sup=${y:1:-1}
    sub=${x:1:-1}
else
    if [[ "$x" == "$y" ]]; then
        echo "equal"
        exit 0
    fi
fi
# echo "sub: $sub -> ${#sub} ---> sup: $sup"
for (( i=0; i<${#sup}; i++)); do
    local chunk="${sup:i:${#sub}}"
    # echo "chunk ---> $chunk -> ${#chunk}"
    if [[ "$chunk" == "$sub" ]]; then
        local check="${sup:${#sub}:1}"
        # echo "check --> $check"
        if [[ "$check" == "" || "$check" == "," || "$sub" == "" || "$sup" == "" ]]; then
        if (( super == 1)); then
            echo "superlist"
        else
            echo "sublist"
        fi
        exit 0
        fi
    fi
done

echo "unequal"
}

main "$@"
