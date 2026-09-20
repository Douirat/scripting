#!/usr/bin/bash

container=()
filled=0

contains(){
local flag="$1"
local word="$2"

flag="${flag^^}"
word="${word^^}"

local anagram=1
# local -A container

# echo "flag: $flag"
# echo "word: $word"

if [[ "$flag" == "$word" ]]; then
	echo 0
	return
fi

if (( filled == 0 )); then

for((i=0; i<${#flag}; i++)); do

local x=${flag:i:1}

container+=("$x")

done

filled=1

fi



for((i=0; i<${#flag}; i++)); do

local x=${word:i:1}
local v=$(exists "$x")

if (( v != 1 )); then
	anagram=0
fi

done

echo "$anagram"
}

exists(){
	local char="$1"
	for((i=0; i<${#container[@]}; i++)); do
		local x="${container[$i]}"
		if [[ "$char" == "$x" ]]; then
			container[i]=0
			echo 1
			return
		fi
	done
	echo 0
}


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
	echo "---> $n --> $filled"
	echo "${container[@]}"

	filled=0
	local exist=$(contains "$x" "$n")
	if ((exist == 1)); then
		if ((${#result} > 0)); then
			result+=" $n"
			continue
		else
		result+="$n"
		fi
	fi
done
echo "$result"
}



main "$@"
