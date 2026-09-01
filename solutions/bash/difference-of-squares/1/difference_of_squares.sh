#!/usr/bin/bash

main(){

local choice="$1"
local N="$2"

local sum=0
local sum_squares=0

for (( i=1; i<="$N"; i++ )); do
    ((sum+=i))
    (( sum_squares += i ** 2 ))
done

local square_sum=$(( sum ** 2 ))

# echo "sum of squares: $sum_squares --> square of sums: $square_sum"

if [[ "$choice" == "square_of_sum" ]]; then
    echo "$square_sum"
fi

if [[ "$choice" == "sum_of_squares" ]]; then
    echo "$sum_squares"
fi

if [[ "$choice" == "difference" ]]; then
    local d=$(( square_sum - sum_squares ))
    echo "$d"
fi


}

main "$@"