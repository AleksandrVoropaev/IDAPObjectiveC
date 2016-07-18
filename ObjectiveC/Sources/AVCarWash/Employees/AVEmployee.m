//
//  AVEmployee.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployee.h"

@interface AVEmployee()
@property (nonatomic, assign) NSUInteger money;

@end

@implementation AVEmployee

- (instancetype)init {
    self = [super init];
    self.free = YES;
    
    return self;
}

- (void)increaseMoney:(NSUInteger)value {
    self.money += value;
}

- (void)decreaseMoney:(NSUInteger)value {
    self.money -= value;
}

- (void)takeMoneyFromObject:(AVEmployee *)object {
    NSUInteger cost = object.money;
    [object decreaseMoney:cost];
    [self increaseMoney:cost];
}

- (void)processObject:(id)object {

}

#pragma mark -
#pragma mark Overload methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AVEmployeeIsBusy:
            return @selector(employeeDidBecomeBusy:);
        case AVEmployeeIsFree:
            return @selector(employeeDidBecomeFree:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark Overload methods for AVEmployeeObserver protocol

- (void)employeeDidBecomeFree:(AVEmployee *)emplloyee {
    NSLog(@"Employee %@ did become free", emplloyee);
}

- (void)employeeDidBecomeBusy:(AVEmployee *)emplloyee {
    NSLog(@"Employee %@ did become busy", emplloyee);
}

@end
