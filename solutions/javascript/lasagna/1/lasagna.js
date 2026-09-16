export const EXPECTED_MINUTES_IN_OVEN = 40


export function remainingMinutesInOven(arg){
    return EXPECTED_MINUTES_IN_OVEN - arg
}

export function preparationTimeInMinutes(layers){
    let time = layers * 2
    return time
}

// console.log(preparationTimeInMinutes(2));

export function totalTimeInMinutes(numberOfLayers, actualMinutesInOven){
    return preparationTimeInMinutes(numberOfLayers) + actualMinutesInOven
}

// console.log(totalTimeInMinutes(3, 20));
