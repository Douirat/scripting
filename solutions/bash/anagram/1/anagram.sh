#!/usr/bin/bash

main(){
#anagram.sh "solemn" "lemons cherry melons"
local flag="$1"
local args="$2"

# store all the letters of the flag in an array to use them as a map.
local map=()

for((i=0; i<${#flag}; i++)); do
	local x=${flag:i:1}
	map+=("$x")
done

# echo "${map[@]}"

# extract all the words from the string and store them in the array
local words=()
local sub=""

for((i=0; i<${#args}; i++)); do
	local char=${args:i:1}
	if [[ "$char" == " " ]]; then
		if [[ "${sub^^}" != "${flag^^}" ]]; then
			if (( ${#sub} == ${#flag} )); then
				words+=("$sub")
			fi
		fi
		sub=""
		continue
	fi
	sub+="$char"
done

if [[ "$sub" != "" &&  "${sub^^}" != "${flag^^}" ]]; then
		if (( ${#sub} == ${#flag} )); then
			words+=("$sub")
		fi
fi

# echo "${words[@]}"

# colone the map to treat each word specifically:
local clone=("${map[@]}")

# echo "${clone[@]}"

local result=""

for word in ${words[@]}; do
# echo "---> $word"

	local accepted=1

	for((i=0; i<${#word}; i++)); do
		local c=${word:i:1}
		local shouldBe=0

			# echo "$c"
		for (( x=0; x<${#clone[@]}; x++)); do
			local z="${clone[$x]}"
			#  echo "$x"
			if [[ "${c^^}" == "${z^^}" ]]; then
				shouldBe=1
				clone["$x"]=""
				break
			fi
		done

		if (( shouldBe == 0 )); then
			accepted=0
			break
		fi




	done

	if (( accepted == 1)); then
		if((${#result} == 0 )); then
			result+="$word"
		else
		result+=" $word"
		fi
	fi


	clone=("${map[@]}")
	# echo "${clone[@]}"

done

echo "$result"

}

main "$@"