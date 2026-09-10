#!/usr/bin/bash

declare -A DNAtoRNA=(
    [G]="C"
    [C]="G"
    [T]="A"
    [A]="U"
)

main(){
local x="$1"
local result=""
for((i=0; i<${#x}; i++)); do
    local char=${x:i:1}
    if [[ -v "DNAtoRNA[$char]" ]]; then
    result+="${DNAtoRNA[$char]}"
    else
    echo "Invalid nucleotide detected."
    exit 1
    fi
done
echo "$result"
}

main "$@"