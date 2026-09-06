#!/usr/bin/bash

main(){

    local x="$1"
    x=${x,,}
    # x=${x^^} if i want upper case

    local -A alphabet=(
        [a]=0
        [b]=0
        [c]=0
        [d]=0
        [e]=0
        [f]=0
        [g]=0
        [h]=0
        [i]=0
        [j]=0
        [k]=0
        [l]=0
        [m]=0
        [n]=0
        [o]=0
        [p]=0
        [q]=0
        [r]=0
        [s]=0
        [t]=0
        [u]=0
        [v]=0
        [w]=0
        [x]=0
        [y]=0
        [z]=0
    )

    for (( i=0; i<${#x}; i++)); do
        alphabet["${x:i:1}"]=1
    done

    # for key in "${!alphabet[@]}"; do
    #     echo "key: $key --> value: ${alphabet[$key]}"
    # done

    for key in ${!alphabet[@]}; do
        if (( alphabet[$key] == 0 )); then
            echo false
            exit 0
        fi
    done
    echo true
}

main "$@"