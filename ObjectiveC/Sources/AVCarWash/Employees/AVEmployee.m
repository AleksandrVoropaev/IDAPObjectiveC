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
//@property (nonatomic, retain)   AVQueue     *processingQueue;

@end

@implementation AVEmployee

- (void)dealloc {
//    self.processingQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
//    self.processingQueue = [AVQueue object];
    
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
    NSUInteger cost = 0;
    
    @synchronized (object) {
        cost = object.money;
        [object decreaseMoney:cost];
    }
    
    [self increaseMoney:cost];
}

- (void)processObject:(id)object {
    @synchronized (self) {
//        [self.processingQueue enqueueObject:object];
        
//        if (self.state == AVEmployeeFree) {
//            self.state = AVEmployeeBusy;
            [self performSelectorInBackground:@selector(performWorkOnBackgroundWithObject:)
                                   withObject:object];
//        }
    }
}

- (void)performWorkOnBackgroundWithObject:(id)object {
    @synchronized (self) {
        ++self.performedObjectsCount;
        [self performWorkWithObject:object];
        [self performSelectorOnMainThread:@selector(performWorkOnMainThreadWithObject:)
                               withObject:object
                            waitUntilDone:NO];
    }
}

- (void)performWorkWithObject:(id)object {
    //rewrote in all employees
}

- (void)performWorkOnMainThreadWithObject:(id)object {
    [self finishProcessingObject:object];
    
//    @synchronized (self) {
//        if ([self.processingQueue count]) {
//            [self performWorkOnBackgroundWithObject:[self.processingQueue dequeueObject]];
//        } else {
//            [self finishProcessing];
//        }
//    }
}

- (void)finishProcessingObject:(AVEmployee *)employee {
    employee.state = AVEmployeeFree;
    // This method for bookkeeper&washers. For washer&car rewrote in washer, for director - in director
}

- (void)finishProcessing {
    self.state = AVEmployeePending;
}

- (void)removeObservers {
    @synchronized (self) {
        for (id observer in self.observerSet) {
            [self removeObserver:observer];
        }
    }
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
        case AVEmployeeReadyForProcessing:
            return @selector(objectDidBecomeReadyForProcessing:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark Overload methods for AVEmployeeObserver protocol

//- (void)employeeDidBecomeFree:(AVEmployee *)employee {
//    NSLog(@"%@ did become free", employee);
//    
//    @synchronized (employee) {
//        if ([employee.processingQueue count]) {
//            [employee processObject:[employee.processingQueue dequeueObject]];
//        }
//    }
//}

//- (void)employeeDidBecomeBusy:(AVEmployee *)employee {
//    NSLog(@"%@ did become busy", employee);
//}
//
//- (void)employeeDidBecomePending:(AVEmployee *)employee {
//    NSLog(@"%@ did become pending", employee);
//
//    [self processObject:employee];
//}

@end
