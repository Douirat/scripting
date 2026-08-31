#!/usr/bin/bash

declare -A allergies=(
    [128]=cats
    [64]=pollen
    [32]=chocolate
    [16]=tomatoes
    [8]=strawberries
    [4]=shellfish
    [2]=peanuts
    [1]=eggs
)

allergyScore=(128 64 32 16 8 4 2 1)

  main () {

    local v1="$1"
    local v2="$2"
    local v3="$3"

    if [[ "$v2" == "allergic_to" ]]; then
        for key in "${allergyScore[@]}"; do
                # echo "key: $key"
            if (( "$v1" & "$key" )); then
                if [[ "${allergies["$key"]}" == "$v3" ]]; then
                    echo "true"
                    return
                fi
                v1=$(( "$v1" - "$key" ))
                # echo "update: $v1"
            fi
        done
        echo "false"

    elif [[ "$v2" == "list" ]]; then
        local result=""
        for key in ${allergyScore[@]}; do
            if (( "$v1" & "$key" )); then
                if [[ "$result" == "" ]]; then
                    result="${allergies["$key"]}"
                else
                    result="${allergies["$key"]} $result"
                fi
                v1=$(( "$v1" - "$key" ))
            fi
        done
        echo "$result"
    fi
    }


  main "$@"
