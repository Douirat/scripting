#!/usr/bin/bash

main(){
local arg="$1"
local n="$2"

if [[ "$arg" == ""  ]]; then
    echo "series cannot be empty"
    exit 1
fi

if (( n > ${#arg})); then
    echo "slice length cannot be greater than series length"
    exit 1
fi

if (( n == 0 )); then
    echo "slice length cannot be zero"
    exit 1
fi

if (( n < 0 )); then
    echo "slice length cannot be negative"
    exit 1
fi



result=""
for(( i=0; i<=${#arg}-n; i++ )); do
    local sub=${arg:i:n}
    if [[ "$result" == "" ]]; then
        result="$sub"
    else
        result="$result $sub"
    fi
done

echo "$result"
}

main "$@"