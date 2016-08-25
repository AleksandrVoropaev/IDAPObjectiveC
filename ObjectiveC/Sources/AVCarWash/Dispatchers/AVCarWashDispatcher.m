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
#import "AVGrandCentralDispatch.h"

#import "NSObject+AVExtensions.h"
#import "NSTimer+AVExtensions.h"

static const NSUInteger kAVCarWashDispatcherCarsCount = 10;

@interface AVCarWashDispatcher ()
@property (nonatomic, retain)   AVCarWash           *carWash;

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
    }
    
    return self;
}

- (void)run {
    AVDispachAsyncOnGlobalQueueBackgroundPriorityWithBlock(^{
        [self washCars];
    });
//    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
//        [self washCars];
//    });
}


- (void)washCars {
    AVCarWash *carWash = self.carWash;
    for (NSUInteger index = 0; index < kAVCarWashDispatcherCarsCount; index++) {
        NSLog(@"------- number of car is - %lu", index + 1);
        
        [carWash washCar:[AVCar object]];
    }
}

@end
