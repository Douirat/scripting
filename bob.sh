#!/usr/bin/bash

declare -A map=(
[1]="Sure."
[2]="Whoa, chill out!"
[3]="Calm down, I know what I'm doing!"
[4]="Fine. Be that way!"
[5]="Whatever."
)

main(){
    local arg="$1"

if [[ "$arg" == ${arg^^} ]]; then
    echo 
else
    echo "no upper case"
fi

}

main "$@"