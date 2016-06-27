//
//  AVWasher.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVWasher.h"

@implementation AVWasher

- (void)processObject:(id)object withValue:(NSUInteger)value {
    AVCar *car = object;
    
    [car decreaseMoney:value];
    [self increaseMoney:value];
    
    car.clean = YES;
    NSLog(@"I've cleaned a car for %lu$", value);
}

@end
