#!/usr/bin/bash

isLeap(){
local year="$1"
if (( year % 400 == 0 )); then
    echo true
elif (( year % 100 == 0 )); then
    echo false
elif (( year % 4 == 0 )); then
   echo true
else
   echo false
fi
}

main(){

    if (( "$#" != 1 )); then
        echo "Usage: leap.sh <year>"
        exit 1
    fi

    local arg="$1"

    if [[ ! "$arg" =~ ^[0-9]+$ ]]; then
        echo "Usage: leap.sh <year>"
        exit 1
    fi


    local result=$(isLeap "$arg")
    echo "$result"
}

main "$@"