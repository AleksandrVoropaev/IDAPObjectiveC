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
#import "NSTimer+AVExtensions.h"

static const NSUInteger kAVCarWashDispatcherCarsCount = 10;
static const NSUInteger kAVCarWashDispatcherTimerInterval = 2; /* in seconds */

@interface AVCarWashDispatcher ()
@property (nonatomic, retain)   AVCarWash           *carWash;
@property (nonatomic, assign)   NSTimer             *timer;
@property (nonatomic, assign)   BOOL                needToStopTimer;

- (void)washCarsInBackground:(NSTimer *)timer;
- (void)startTimer;
- (void)stopTimer;

@end

@implementation AVCarWashDispatcher

- (void)dealloc {
    self.carWash = nil;
    [self stopTimer];
    
    [super dealloc];
}

- (instancetype)initWithCarWash:(AVCarWash *)carWash {
    if (!carWash) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        self.carWash = carWash;
    }
    
    return self;
}

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [_timer invalidate];
        
        _timer = timer;
    }
}

- (void)run {
    [self startTimer];
}

- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kAVCarWashDispatcherTimerInterval
                                                 repeats:YES
                                                   block:^{
                                                       [self washCarsInBackground:nil];
                                                   }];
}

- (void)stopTimer {
    self.timer = nil;
}

- (void)washCarsInBackground:(NSTimer *)timer {
    [self performSelectorInBackground:@selector(washCars) withObject:nil];
}

- (void)washCars {
    AVCarWash *carWash = self.carWash;
    for (NSUInteger index = 0; index < kAVCarWashDispatcherCarsCount; index++) {
        NSLog(@"------- number of car is - %lu", index + 1);
        
        [carWash washCar:[AVCar object]];
    }
}

@end
