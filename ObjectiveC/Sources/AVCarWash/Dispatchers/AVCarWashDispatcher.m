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
//static const NSUInteger kAVCarWashDispatcherCarGroupsCount = 100;

@interface AVCarWashDispatcher ()
@property (nonatomic, retain)   AVCarWash   *carWash;
@property (nonatomic, assign)   NSUInteger  runCount;

@end

@implementation AVCarWashDispatcher

- (void)dealloc {
    self.carWash = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.carWash = [AVCarWash object];
    }
    
    return self;
}

- (void)performTimerOnMainThread {
    [self performSelectorOnMainThread:@selector(washCars) withObject:nil waitUntilDone:NO];
}

- (void)performTimerOnBackground {
    [self performSelectorInBackground:@selector(washCars) withObject:nil];
}

- (void)performTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:kAVCarWashDispatcherTimerInterval
                                                      target:self
                                                    selector:@selector(selectThread)
                                                    userInfo:nil
                                                     repeats:YES];
    [timer fire];
}

- (void)selectThread {
    NSUInteger count = ++self.runCount;
    if (count % 2 == 0) {
        [self performTimerOnMainThread];
    } else {
        [self performTimerOnBackground];
    }
}

- (void)start {
    [self performTimer];
}

- (void)washCars {
    AVCarWash *carWash = self.carWash;
    for (NSUInteger index = 0; index < kAVCarWashDispatcherCarsCount; index++) {
        NSLog(@"------- number of car is - %lu", index + 1);
        
        [carWash washCar:[AVCar object]];
    }
}

- (void)employeeDidBecomePending:(AVEmployee *)employee {
    NSLog(@"%@ did become free", employee);
    
    [self.carWash bookkeeperDispatcherProcessEmployee:employee];
}

@end
