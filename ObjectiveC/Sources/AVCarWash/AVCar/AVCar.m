//
//  AVCar.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVCar.h"

@interface AVCar()
@property (nonatomic, assign) NSUInteger money;

@end

@implementation AVCar

- (instancetype)init {
    self = [super init];
    self.money = 100;
    
    return self;
}

- (void)decreaseMoney:(NSUInteger)value {
    self.money -= value;
}

- (void)increaseMoney:(NSUInteger)value {
    self.money += value;
}

#pragma mark -
#pragma mark Overload methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AVCarIsClean:
            return @selector(carDidBecomeClean:);
        case AVCarIsDirty:
            return @selector(carDidBecomeDirty:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
