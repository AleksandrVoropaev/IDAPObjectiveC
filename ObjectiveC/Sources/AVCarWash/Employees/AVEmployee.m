//
//  AVEmployee.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployee.h"
#import "AVQueue.h"

#import "NSObject+AVExtensions.h"

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
    @synchronized (self) {
        self.money += value;
    }
}

- (void)decreaseMoney:(NSUInteger)value {
    @synchronized (self) {
        self.money -= value;
    }
}

- (void)takeMoneyFromObject:(AVEmployee *)object {
    NSUInteger cost = object.money;
    [object decreaseMoney:cost];
    [self increaseMoney:cost];
}

- (void)processObject:(id)object {
    @synchronized (self) {
        [self.processingQueue enqueueObject:object];
        
        if (self.state == AVEmployeeFree) {
            self.state = AVEmployeeBusy;
            [self performSelectorInBackground:@selector(performWorkOnBackgroundWithObject:)
                                   withObject:[self.processingQueue dequeueObject]];
        } else {
            [self.processingQueue enqueueObject:object];
        }
    }
}

- (void)performWorkOnBackgroundWithObject:(id)object {
    @synchronized (self) {
        [self performWorkWithObject:object];
        [self performSelectorOnMainThread:@selector(performWorkOnMainThreadWithObject:)
                               withObject:object waitUntilDone:NO];
    }
}

- (void)performWorkWithObject:(id)object {
    //переписываю у всех
}

- (void)performWorkOnMainThreadWithObject:(id)object {
    [self finishProcessingObject:object];
    
    @synchronized (self) {
        if ([self.processingQueue count]) {
            [self performWorkOnBackgroundWithObject:[self.processingQueue dequeueObject]];
        } else {
            [self finishProcessing];
        }
    }
}

- (void)finishProcessingObject:(AVEmployee *)employee {
    employee.state = AVEmployeeFree; // для машины переписываю метод в Вошере, для директора - у директора
}

- (void)finishProcessing {
    self.state = AVEmployeePending;
}

#pragma mark -
#pragma mark Overload methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AVEmployeeBusy:
            return @selector(employeeDidBecomeBusy:);
        case AVEmployeeFree:
            return @selector(employeeDidBecomeFree:);
        case AVEmployeePending:
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
    [self processObject:employee];
}

@end
