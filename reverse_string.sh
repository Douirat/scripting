#!/usr/bin/bash

reverse_string(){
    local text="$1"
    local result=""
    for((i=${#text}-1; i>=0; i--)); do
    local char="${text:i:1}"
    result+="$char"
    done
    echo "$result"
}
main(){
local result=$(reverse_string "$1")
echo "$result"
}

main "$@"