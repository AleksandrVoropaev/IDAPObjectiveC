//
//  AVWasher.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVWasher.h"

#import "AVCar.h"

@implementation AVWasher

- (void)performWorkWithObject:(AVCar *)car {
    [self takeMoneyFromObject:car];
}

- (void)finishProcessingObject:(AVCar *)car {
    @synchronized (self) {
        car.clean = YES;
        NSUInteger performedObjectsCount = ++self.performedObjectsCount;
        
        NSLog(@"Washer %@ cleaned a car %@. I's %lu", self, car, performedObjectsCount);
    }
}

@end
