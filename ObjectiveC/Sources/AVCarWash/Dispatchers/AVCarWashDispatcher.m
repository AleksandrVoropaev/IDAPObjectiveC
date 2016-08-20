//
//  AVCarWashDispatcher.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/19/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVCarWashDispatcher.h"

#import "AVCarWash.h"
#import "AVCar.h"

#import "NSObject+AVExtensions.h"

static const NSUInteger kAVCarWashDispatcherCarsCount = 10;
static const NSUInteger kAVCarWashDispatcherTimerInterval = 1; /* in seconds */

@interface AVCarWashDispatcher ()
@property (nonatomic, retain)   AVCarWash   *carWash;

@end

@implementation AVCarWashDispatcher

- (void)dealloc {
    self.carWash = nil;
    
    [super dealloc];
}

- (instancetype)initWithCarWash:(AVCarWash *)carWash {
    self = [super init];
    
    if (self) {
        self.carWash = carWash;
    }
    
    return self;
}

- (void)start {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:kAVCarWashDispatcherTimerInterval
                                                      target:self
                                                    selector:@selector(washCars)
                                                    userInfo:nil
                                                     repeats:YES];
    [timer fire];
}

- (void)washCars {
    AVCarWash *carWash = self.carWash;
    for (NSUInteger index = 0; index < kAVCarWashDispatcherCarsCount; index++) {
        NSLog(@"------- number of car is - %lu", index + 1);
        
        [carWash.washersDispatcher processObject:[AVCar object]];
    }
}

- (void)employeeDidBecomePending:(AVEmployee *)employee {
    NSLog(@"%@ did become free", employee);
    
    [self.carWash.bookkeepersDispatcher processObject:employee];
}

@end
