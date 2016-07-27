//
//  AVEmployee.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployee.h"

@interface AVEmployee()
@property (nonatomic, assign)   NSUInteger  money;
@property (nonatomic, retain)   AVQueue     *processingQueue;

@end

@implementation AVEmployee

- (void)dealloc {
    self.processingQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.processingQueue = [AVQueue object];
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
    @synchronized (self) {
        NSUInteger cost = object.money;
        [object decreaseMoney:cost];
        [self increaseMoney:cost];
    }
}

- (void)processObject:(id)object {
    @synchronized (self) {
        self.state = AVEmployeeIsBusy;
        
        [self.processingQueue enqueueObject:object];
        
        id processingObject = nil;
        while ((processingObject = [self.processingQueue dequeueObject])) {
            [self performWorkOnBackgroundWhithObject:processingObject];
        }
    }
}

- (void)performWorkWhithObject:(id)object {
    
}

- (void)performWorkOnBackgroundWhithObject:(id)object {
    @synchronized (self) {
        [self performSelectorInBackground:@selector(performWorkWhithObject:) withObject:object];
    }
}

- (void)finishProcessing {
    @synchronized (self) {
        self.state = AVEmployeeIsPending;
    }
}

#pragma mark -
#pragma mark Overload methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AVEmployeeIsBusy:
            return @selector(employeeDidBecomeBusy:);
        case AVEmployeeIsFree:
            return @selector(employeeDidBecomeFree:);
        case AVEmployeeIsPending:
            return @selector(employeeDidBecomePending:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark Overload methods for AVEmployeeObserver protocol

- (void)employeeDidBecomeFree:(AVEmployee *)employee {
    NSLog(@"Employee %@ did become free", employee);
}

- (void)employeeDidBecomeBusy:(AVEmployee *)employee {
    NSLog(@"Employee %@ did become busy", employee);
}

- (void)employeeDidBecomePending:(AVEmployee *)employee {
    @synchronized (employee) {
        for (AVEmployee *observer in employee.observerSet) {
            [observer processObject:employee];
        }
        
        self.state = AVEmployeeIsFree;
    }
}

@end
