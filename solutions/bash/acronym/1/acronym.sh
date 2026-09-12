#!/usr/bin/bash

alphabets=({A..Z})

isAlfa(){
local char="$1"

for n in "${alphabets[@]}"; do
	# echo "$n"
	if [[ "$n" == "$char" ]]; then
		echo 1
		exit 0
	fi
done

echo 0
}


main(){
local arg="$1"
local sub=""

local result=""

for ((i=0; i<${#arg}; i++)); do

local char="${arg:i:1}"
char=${char^^}

local is=$(isAlfa "$char")
# echo "---> $is"
if (( is == 0 )); then

if [[ "$char" == "," || "$char" == "'" ]]; then
	continue
fi
# echo "sub: $sub"
result+="${sub:0:1}"
sub=""
continue
fi

sub+="$char"
done

if [[ "$sub" != ""  ]]; then
result+="${sub:0:1}"
sub=""
fi


echo "$result"
}

main "$@"
