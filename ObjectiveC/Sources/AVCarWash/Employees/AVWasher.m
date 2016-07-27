//
//  AVWasher.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVWasher.h"

@implementation AVWasher

- (void)performWorkWhithObject:(id)object {
    @synchronized (self) {
        AVCar *car = object;
        
        [self takeMoneyFromObject:car];
        
        car.clean = YES;
        NSLog(@"I've cleaned a car");
        [self performSelectorOnMainThread:@selector(finishProcessing) withObject:nil waitUntilDone:NO];
    }
}

@end
