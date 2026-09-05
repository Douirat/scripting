#!/usr/bin/bash

main(){
local a="$1"
local b="$2"

if ((${#a} < b)); then
echo  "span must not exceed string length"
return 1
fi

if ((b < 0)); then
    echo "span must not be negative"
    return 1
fi

# echo "a: $a ---> b: $b"

local numbers=()
local sub=""

local index="$b"
for((i=0; i<=${#a}-b; i++)); do
        sub+=${a:i:b}
        # echo "sub: $sub"
        numbers+=("$sub")
        sub=""
done

local long=0;

for n in ${numbers[@]}; do
# echo "n: $n"
    local x=1

    for ((i=0; i<${#n}; i++)); do
        local char=${n:i:1}
    if [[ ! "$char" =~ ^[0-9]$ ]]; then
        echo "digits input must only contain digits"
        return 1
    fi
        ((x*=char))
    done

    if (( x>long )); then
        ((long=x))
    fi
done

if ((long == 0)); then
echo 0
return 0
fi

echo "$long"
}

main "$@"