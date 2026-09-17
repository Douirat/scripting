export function dayRate(days){
    return days * 8
}

/**
 * 
 * @param budget total budget
 * @param ratePerHour hourly rate
 * @returns number of days
 */

export function daysInBudget(budget, ratePerHour){
    let hourCost = budget / ratePerHour
    return Math.floor(hourCost / 8)
}

/**
 *@param ratePerHour
 *@param numDays
 *@param discount
 @returns the rounded up discount rate
 */
export function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {

    // How much is one day?
    const rate = dayRate(ratePerHour);

    // How many complete 22-day months?
    const months = Math.floor(numDays / 22);

    // How many days are left?
    const remainingDays = numDays % 22;

    // Price of the discounted months
    const monthlyPrice = 22 * rate * (1 - discount);

    // Price of leftover days at normal rate
    const remainingPrice = remainingDays * rate;

    // Total, rounded UP
    return Math.ceil(months * monthlyPrice + remainingPrice);
}

// console.log(priceWithMonthlyDiscount(89, 230, 0.42));

