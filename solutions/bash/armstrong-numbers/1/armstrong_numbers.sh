#!/usr/bin/env bash


  main () {
    local number="$1"
    local size=${#number}
    # echo "input: $number -> size: $size"

    local arr=()
    local compass="$number"

    while [ "$number" -ne 0 ]; do
    local x=$(( number % 10 ))
    arr+=("$x")
    number=$(( number / 10 ))
    # echo "x: $x -> number: $number"
    done

    local sum=0

    for  ((i=0; i<${#arr[@]}; i++)); do
        # echo "element at index: $i is: ${arr[$i]}"
        (( sum+= ${arr[i]} ** size ))
    done

    # echo "the sum is = $sum"
    if [[ "$sum" -eq "$compass" ]]; then
      echo "true"
    else
      echo "false"
    fi

  }
#
  main "$@"
