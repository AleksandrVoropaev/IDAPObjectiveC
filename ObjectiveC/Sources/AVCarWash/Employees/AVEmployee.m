//
//  AVEmployee.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployee.h"

#import "AVQueue.h"
#import "AVGrandCentralDispatch.h"

#import "NSObject+AVExtensions.h"

@interface AVEmployee()
@property (nonatomic, assign)   NSUInteger  money;

@end

@implementation AVEmployee

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
        self.state = AVEmployeeBusy;
        AVDispatchAsyncBlockOnBackgroundPriorityQueue(^{
            ++self.performedObjectsCount;
            [self performWorkWithObject:object];
        });
        AVDispatchAsyncBlockOnMainQueue(^{
            [self finishProcessingObject:object];
            [self finishProcessing];
        });
//        [self performSelectorInBackground:@selector(performWorkOnBackgroundWithObject:)
//                               withObject:object];
    }
}

//- (void)performWorkOnBackgroundWithObject:(id)object {
//    @synchronized (self) {
//        ++self.performedObjectsCount;
//        [self performWorkWithObject:object];
//        [self performSelectorOnMainThread:@selector(performWorkOnMainThreadWithObject:)
//                               withObject:object
//                            waitUntilDone:NO];
//    }
//}

- (void)performWorkWithObject:(id)object {
    //rewrote in all employees
}

//- (void)performWorkOnMainThreadWithObject:(id)object {
//    [self finishProcessingObject:object];
//    [self finishProcessing];
//}

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
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark Overload methods for AVEmployeeObserver protocol

@end
