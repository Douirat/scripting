#!/usr/bin/bash

main(){
local arg="$1"
local result=""

if (( arg % 3 == 0 )); then
    result="Pling"
fi

if (( arg % 5 == 0 )); then
    result+="Plang"
fi

if (( arg % 7 == 0 )); then
    result+="Plong"
fi

if ((arg % 3 != 0 && arg % 5 != 0 && arg % 7 != 0  )); then
echo "$arg"
exit 0
fi

echo "$result"

}

main "$@"