#!/usr/bin/bash

main(){
    local arg="$1"
    local grains=0

    if [[ "$arg" -eq "total" &&  "$arg" != "0" ]]; then
        echo "18446744073709551615"
        return 0
    fi

    if  (("$arg" <= 0 || "$arg" >= 65)) ; then
        echo "Error: invalid input"
        return 1
    fi


    if [[ "$arg" -eq 64 ]]; then
        echo  "9223372036854775808"
        return 0
    fi



    for (( i=1; i<="$arg"; i++ )); do
        (( grains *= 2))
        if (( grains == 0)); then
            ((grains=1))
        fi
    done
        echo "$grains"
}

main "$@"