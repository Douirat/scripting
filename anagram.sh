#!/usr/bin/bash

main(){
local x="$1"
local y="$2"

local all=()
local result=""

# anagram.sh "solemn" "lemons cherry melons"


# echo "x: $x --> y: $y"

local chars=()

for((i=0; i<${#x}; i++)); do

chars["$i"]="${x:i:1}"

done

# echo "${chars[@]}"

local sub=""

for((j=0; j<${#y}; j++)); do

local c=${y:j:1}

if [[ "$c" == " " ]]; then
	if [[ "$sub" != "$x" && ${#sub} == ${#x} ]]; then
		all+=("$sub")
	fi
	sub=""
	continue
fi



sub+="$c"
done


if [[ "$sub" != ""  ]]; then
	if [[ "$sub" != "$x" && ${#sub} == ${#x}  ]]; then
		all+=("$sub")
	fi
	sub=""
fi

for n in "${all[@]}"; do
	local exist=$(contains "$x" "$n")
	if ((exist == 1)); then
		if [[ result != "" ]]; then
			result+=" $n"
			continue
		fi
		result+="$n"
	fi
done
echo "$result"
}

contains(){
local flag="$1"
local word="$2"

local anagram=1
local -A container

# echo "flag: $flag"
# echo "word: $word"

for((i=0; i<${#flag}; i++)); do

local x=${flag:i:1}

container["$x"]=1

done


for((i=0; i<${#flag}; i++)); do

local x=${word:i:1}
local v=container[$x]

if (( v != 1 )); then
	anagram=0
fi
done

echo "$anagram"
}
main "$@"
