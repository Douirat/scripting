#include "leap.h"


bool leap_year(int year){
    if(year % 100 == 0 && year % 400 != 0){ 
        return false;
    }
    return year % 4 == 0;
}
