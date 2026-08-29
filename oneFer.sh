#!/usr/bin/bash

oneFer(){
    local text="$1"
    if [[ -z "$text" ]]; then
        echo "one for you, an one for me."
    else
        echo "one for $text, and one for me.";
    fi
}

main(){
    local result=$(oneFer "$1")
    echo $result
}

main "$@"