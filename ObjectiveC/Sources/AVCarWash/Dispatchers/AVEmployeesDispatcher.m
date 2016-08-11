//
//  AVEmployeesDispatcher.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/11/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployeesDispatcher.h"

#import "AVQueue.h"
#import "AVCarWash.h"

#import "NSObject+AVExtensions.h"

@interface AVEmployeesDispatcher ()
@property (nonatomic, retain)   NSMutableArray  *mutableEmployees;
@property (nonatomic, retain)   AVQueue         *freeEmployees;
@property (nonatomic, retain)   AVQueue         *objects;
//@property (nonatomic, retain)   AVCarWash       *carWash;

@end

@implementation AVEmployeesDispatcher

static NSUInteger const kAVEmployeesDispatcherEmployeesCount = 5;
static NSUInteger const kAVEmployeesDispatcherObjectsCount = 50;


@dynamic employees;

- (void)dealloc {
    self.mutableEmployees = nil;
    self.freeEmployees = nil;
    self.objects = nil;
//    self.carWash = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableEmployees = [NSMutableArray array];
        self.freeEmployees = [AVQueue object];
        self.objects = [AVQueue object];
        
        [self initInfrastructure];
    }
    
    return self;
}

- (void)initInfrastructure {
    for (NSUInteger index = 0; index < kAVEmployeesDispatcherEmployeesCount; index++) {
        [self addEmployee:[AVWasher object]];
    }
    
    for (NSUInteger index = 0; index < kAVEmployeesDispatcherObjectsCount; index++) {
        [self.objects enqueueObject:[AVCar object]];
    }
}

- (void)addEmployee:(AVEmployee *)employee {
    [self.mutableEmployees addObject:employee];
    [self.freeEmployees enqueueObject:employee];
}

- (AVEmployee *)employees {
    return [[self.mutableEmployees copy] autorelease];
}

- (void)washCar {
//    AVWasher *employee = [self.freeEmployees dequeueObject];
//    id object = [self.objects dequeueObject];
//    
//    if (employee) {
//        if (object) {
//            [employee processObject:object];
//        } else {
//            [self.freeEmployees enqueueObject:employee];
//        }
//    } else {
//        if (object) {
//            [self.objects enqueueObject:object];
//        }
//    }
    id object = [self.objects dequeueObject];

    if (object) {
        AVWasher *employee = [self.freeEmployees dequeueObject];

        if (employee) {
            [employee processObject:object];
        } else {
            [self.objects enqueueObject:object];
        }
    }
}

- (void)employeeDidBecomeFree:(AVEmployee *)employee {
    @synchronized (self) {
        id object = [self.objects dequeueObject];
        
        if (object) {
            [employee processObject:object];
        } else {
            [self.objects enqueueObject:object];
        }
    }
}

@end
