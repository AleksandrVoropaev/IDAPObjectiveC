//
//  AVEmployeesDispatcher.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/11/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployeesDispatcher.h"

#import "AVWasher.h"
#import "AVQueue.h"
#import "AVCarWash.h"

#import "NSObject+AVExtensions.h"

@interface AVEmployeesDispatcher ()
@property (nonatomic, retain)   NSMutableArray  *mutableEmployees;
@property (nonatomic, retain)   AVQueue         *freeEmployees;
@property (nonatomic, retain)   AVQueue         *objects;

@end

@implementation AVEmployeesDispatcher

@dynamic employees;

- (void)dealloc {
    self.mutableEmployees = nil;
    self.freeEmployees = nil;
    self.objects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableEmployees = [NSMutableArray array];
        self.freeEmployees = [AVQueue object];
        self.objects = [AVQueue object];
    }
    
    return self;
}

- (void)addEmployee:(AVEmployee *)employee {
    @synchronized (self) {
        [self.mutableEmployees addObject:employee];
        [self.freeEmployees enqueueObject:employee];
//        [employee addObserver:self];
    }
}

- (void)addEmployees:(NSArray *)employees {
    for (AVEmployee *employee in employees) {
        [self addEmployee:employee];
    }
}

- (void)removeEmployee:(AVEmployee *)employee {
    @synchronized (self) {
        [self.mutableEmployees removeObject:employee];
//        [employee removeObserver:self];
    }
}

- (void)removeEmployees:(NSArray *)employees {
    for (AVEmployee *employee in employees) {
        [self removeEmployee:employee];
    }
}

- (AVEmployee *)employees {
    @synchronized (self) {
        return [[self.mutableEmployees copy] autorelease];
    }
}

- (void)processObject:(id)object {
    AVEmployee *employee = [self.freeEmployees dequeueObject];
    
    if (employee) {
        [employee processObject:object];
    } else {
        [self.objects enqueueObject:object];
    }
}

- (void)objectDidBecomeReadyForProcessing:(id)object {
    [self processObject:object];
}

- (void)employeeDidBecomeFree:(AVEmployee *)employee {
    id object = [self.objects dequeueObject];
    
    if (object) {
        [employee processObject:object];
    } else {
        [self.freeEmployees enqueueObject:employee];
    }
}

@end
