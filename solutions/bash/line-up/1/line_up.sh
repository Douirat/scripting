#!/usr/bin/bash

lineUp(){
local x="$1"
if (( x != 12 && x % 100 != 12 && x % 10 == 2)); then

    echo "${x}nd"
elif (( x != 13 && x % 10 == 3)); then
    echo "${x}rd"

elif ((x != 11 && x % 10 == 1 )); then
echo "${x}st"
else
echo "${x}th"
fi
}

main(){
    if (( "$#" != 2)); then
        exit 1
    fi

    local name="$1"
    local number="$2"
    local order=$(lineUp "$2")
 echo "$name, you are the $order customer we serve today. Thank you!"
}

main "$@"