//
//  AVRandom.c
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/4/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#include <stdlib.h>
#include <time.h>

#include "AVRandom.h"

uint64_t randomInRange(uint64_t firstValue, uint64_t secondValue) {
    if (firstValue > secondValue) {
        uint64_t temp = firstValue;
        firstValue = secondValue;
        secondValue = temp;
    }
    
    return rand() % (secondValue - firstValue) + firstValue;
}

uint64_t randomWithValue(uint64_t value) {
    return randomInRange(0, value);
}
