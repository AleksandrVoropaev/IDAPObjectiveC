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
#import "AVEmployeesDispatcher.h"

#import "NSObject+AVExtensions.h"
#import "NSArray+AVExtensions.h"

static NSUInteger const kAVCarWashWashersCount      = 3;
static NSUInteger const kAVCarWashBookkeepersCount  = 3;
static NSUInteger const kAVCarWashDirectorsCount    = 3;

@interface AVCarWash()
@property (nonatomic, retain)   NSMutableArray          *mutableWashers;
@property (nonatomic, retain)   NSMutableArray          *mutableBookkeepers;
@property (nonatomic, retain)   NSMutableArray          *mutableDirectors;
@property (nonatomic, retain)   AVEmployeesDispatcher   *washersDispatcher;
@property (nonatomic, retain)   AVEmployeesDispatcher   *bookkeepersDispatcher;
@property (nonatomic, retain)   AVEmployeesDispatcher   *directorsDispatcher;

@end

@implementation AVCarWash

- (void)dealloc {
    for (AVEmployee *employee in [self employees]) {
        [employee removeObservers];
    }
    
    self.mutableWashers = nil;
    self.mutableBookkeepers = nil;
    self.mutableDirectors = nil;
    self.washersDispatcher = nil;
    self.bookkeepersDispatcher = nil;
    self.directorsDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.mutableWashers = [NSMutableArray array];
    self.mutableBookkeepers = [NSMutableArray array];
    self.mutableDirectors = [NSMutableArray array];

    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    for (NSUInteger index = 0; index < kAVCarWashWashersCount; index++) {
        AVWasher *washer = [AVWasher object];
        [washer addObserver:self.mutableBookkeepers[index % kAVCarWashBookkeepersCount]];
        [washer addObserver:self];
        [self.mutableWashers addObject:washer];
    }
    
    for (NSUInteger index = 0; index < kAVCarWashBookkeepersCount; index++) {
        AVBookkeeper *bookkeeper = [AVBookkeeper object];
        [bookkeeper addObserver:self.mutableDirectors[index % kAVCarWashDirectorsCount]];
        [self.mutableBookkeepers addObject:bookkeeper];
    }
    
    for (NSUInteger index = 0; index < kAVCarWashDirectorsCount; index++) {
        AVDirector *director = [AVDirector object];
        [self.mutableDirectors addObject:director];
    }
    
    AVEmployeesDispatcher *washersDispatcher = [AVEmployeesDispatcher object];
    [washersDispatcher addEmployees:self.mutableWashers];
    self.washersDispatcher = washersDispatcher;
    
    AVEmployeesDispatcher *bookkeepersDispatcher = [AVEmployeesDispatcher object];
    [bookkeepersDispatcher addEmployees:self.mutableBookkeepers];
    self.bookkeepersDispatcher = bookkeepersDispatcher;
    
    AVEmployeesDispatcher *directorsDispatcher = [AVEmployeesDispatcher object];
    [directorsDispatcher addEmployees:self.mutableDirectors];
    self.directorsDispatcher = directorsDispatcher;
}

- (NSArray *)employees {
    NSMutableArray *employees = [NSMutableArray array];
    
    @synchronized (self) {
        [employees addObjectsFromArray:self.mutableWashers];
        [employees addObjectsFromArray:self.mutableBookkeepers];
        [employees addObjectsFromArray:self.mutableDirectors];
    }
    
    return [[employees copy] autorelease];
}

- (void)washCar:(AVCar *)car {
    [self.washersDispatcher processObject:car];
}

@end

