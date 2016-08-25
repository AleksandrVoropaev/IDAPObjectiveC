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
@property (nonatomic, retain)   dispatch_queue_t    dispatchQueue;
@property (nonatomic, assign)   BOOL                needToStopTimer;

- (void)startTimer;
- (void)stopTimer;

@end

@implementation AVCarWashDispatcher

- (void)dealloc {
    self.carWash = nil;
    
    [super dealloc];
}

- (instancetype)initWithCarWash:(AVCarWash *)carWash {
    if (!carWash) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        self.carWash = carWash;
        self.needToStopTimer = NO;
    }
    
    return self;
}

- (void)run {
    [self startTimer];
}

- (void)startTimer {
    self.needToStopTimer = NO;
    dispatch_queue_t dispatchQueue = dispatch_queue_create([@"dispatchQueue" cStringUsingEncoding:NSUTF8StringEncoding],
                                                           DISPATCH_QUEUE_CONCURRENT);
    self.dispatchQueue = dispatchQueue;
    dispatch_release(dispatchQueue);

    dispatch_after(DISPATCH_TIME_NOW, dispatchQueue, ^{
        [self washCars];
        sleep(kAVCarWashDispatcherTimerInterval);
        if (self.needToStopTimer) {
            return;
        }
        [self startTimer];
    });

//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:kAVCarWashDispatcherTimerInterval
//                                                     repeats:YES
//                                                       block:^{ [self washCars]; }];
//    self.timer = timer;
//    [timer fire];
}

- (void)stopTimer {
    self.needToStopTimer = YES;
//    [self.timer invalidate];
}

//- (void)washCarsInBackground {
//    [self performSelectorInBackground:@selector(washCars) withObject:nil];
//}

- (void)washCars {
    AVCarWash *carWash = self.carWash;
    for (NSUInteger index = 0; index < kAVCarWashDispatcherCarsCount; index++) {
        NSLog(@"------- number of car is - %lu", index + 1);
        
        [carWash washCar:[AVCar object]];
    }
}

@end
