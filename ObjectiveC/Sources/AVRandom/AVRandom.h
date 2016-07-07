//
//  AVRandom.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/4/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#include <stdio.h>

//#define MIN(a, b) ((a < b) ? (a) : (b))
//#define MAX(a, b) ((a > b) ? (a) : (b))

uint32_t AVRandomWithRange(uint32_t firstValue, uint32_t secondValue);
uint32_t AVRandomWithValue(uint32_t value);
