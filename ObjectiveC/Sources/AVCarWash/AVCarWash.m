//
//  AVCarWash.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVCarWash.h"

#import "AVWasher.h"
#import "AVBookkeeper.h"
#import "AVDirector.h"
#import "AVQueue.h"

#import "NSObject+AVExtensions.h"
#import "NSArray+AVExtensions.h"

static NSUInteger const kMaxWashersCount = 3;

@interface AVCarWash()
@property (nonatomic, retain)   AVQueue         *carQueue;
@property (nonatomic, retain)   AVQueue         *washersQueue;
@property (nonatomic, retain)   NSMutableArray  *mutableWashers;
@property (nonatomic, retain)   AVBookkeeper    *bookkeeper;
@property (nonatomic, retain)   AVDirector      *director;

@end

@implementation AVCarWash

- (void)dealloc {
    self.carQueue = nil;
    self.washersQueue = nil;
    
    for (AVWasher *washer in self.mutableWashers) {
        [washer removeObservers:@[self.bookkeeper,self]];
    }
    
    [self.bookkeeper removeObserver:self.director];
    
    self.mutableWashers = nil;
    self.bookkeeper = nil;
    self.director = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.carQueue = [AVQueue object];
    self.washersQueue = [AVQueue object];
    self.mutableWashers = [NSMutableArray array];
    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    AVDirector *director = [AVDirector object];
    AVBookkeeper *bookkeeper = [AVBookkeeper object];
    
    [bookkeeper addObserver:director];
    
    for (NSUInteger index = 0; index < kMaxWashersCount; index++) {
        AVWasher *washer = [AVWasher object];
        [washer addObservers:@[bookkeeper,self]];
        [self.mutableWashers addObject:washer];
        [self.washersQueue enqueueObject:washer];
    }
    
    self.director = director;
    self.bookkeeper = bookkeeper;
}

- (void)washCar:(AVCar *)car {
    [self.carQueue enqueueObject:car];
    
    AVWasher *washer = [self.washersQueue dequeueObject];
    car = [self.carQueue dequeueObject];
    
    if (car) {
        if (washer) {
            [washer processObject:car];
        } else {
            [self.carQueue enqueueObject:car];
        }
    } else {
        [self.washersQueue enqueueObject:washer];
    }

}

- (void)employeeDidBecomeFree:(AVWasher *)washer {
    AVCar *car = [self.carQueue dequeueObject];
    
    if (car) {
        [washer processObject:car];
    } else {
        [self.washersQueue enqueueObject:washer];
    }
}

@end

