//
//  AVWasher.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVWasher.h"

@implementation AVWasher

- (void)performWorkWithObject:(id)object {
    AVCar *car = object;        
    [self takeMoneyFromObject:car];
}

- (void)finishProcessingObject:(AVCar *)car {
    car.clean = YES;
    NSLog(@"Washer %@ cleaned a car %@", self, car);
}

@end
