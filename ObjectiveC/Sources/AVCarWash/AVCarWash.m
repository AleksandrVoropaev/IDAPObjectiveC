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
#import "AVRandom.h"

#import "NSObject+AVExtensions.h"
#import "NSArray+AVExtensions.h"

static NSUInteger const kAVCarWashWashersCount      = 3;
static NSUInteger const kAVCarWashBookkeepersCount  = 2;
static NSUInteger const kAVCarWashDirectorsCount    = 1;

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
    id washersObservers = @[self.bookkeepersDispatcher];
    id bookkeepersObservers = @[self.directorsDispatcher];
    id directorsObservers = @[];
    
    [self removeObserversForWashers:washersObservers
                        bookkeepers:bookkeepersObservers
                          directors:directorsObservers];
    
    [self.washersDispatcher removeEmployees:self.mutableWashers];
    [self.bookkeepersDispatcher removeEmployees:self.mutableBookkeepers];
    [self.directorsDispatcher removeEmployees:self.mutableDirectors];
    
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

    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    AVEmployeesDispatcher *directorsDispatcher = [AVEmployeesDispatcher object];
    AVEmployeesDispatcher *bookkeepersDispatcher = [AVEmployeesDispatcher object];
    AVEmployeesDispatcher *washersDispatcher = [AVEmployeesDispatcher object];

    [self createEmployeesWithClass:[AVDirector class]
                             count:kAVCarWashDirectorsCount
                         observers:@[]];
    [self createEmployeesWithClass:[AVBookkeeper class]
                             count:kAVCarWashBookkeepersCount
                         observers:@[directorsDispatcher]];
    [self createEmployeesWithClass:[AVWasher class]
                             count:kAVCarWashWashersCount
                         observers:@[bookkeepersDispatcher]];
    
    [washersDispatcher addEmployees:self.mutableWashers];
    [bookkeepersDispatcher addEmployees:self.mutableBookkeepers];
    [directorsDispatcher addEmployees:self.mutableDirectors];
    
    directorsDispatcher = self.directorsDispatcher;
    bookkeepersDispatcher = self.bookkeepersDispatcher;
    washersDispatcher = self.washersDispatcher;
}

- (void)createEmployeesWithClass:(Class)cls count:(NSUInteger)count observers:(NSArray *)observers {
    for (NSUInteger index = 0; index < count; index++) {
        id employee = [cls object];
        [employee addObservers:observers];
        if (cls == [AVBookkeeper class]) {
            [self.mutableBookkeepers addObject:employee];
        } else if (cls == [AVWasher class]) {
            [self.mutableWashers addObject:employee];
        } else if (cls == [AVDirector class]) {
            [self.mutableDirectors addObject:employee];
        }
    }
}

- (void)removeObserversForWashers:(NSArray *)observers {
    for (AVWasher *washer in self.mutableWashers) {
        [washer removeObservers:observers];
    }
}

- (void)removeObserversForBookkeepers:(NSArray *)observers {
    for (AVBookkeeper *bookkeeper in self.mutableBookkeepers) {
        [bookkeeper removeObservers:observers];
    }
}

- (void)removeObserversForDirectors:(NSArray *)observers {
    for (AVDirector *director in self.mutableDirectors) {
        [director removeObservers:observers];
    }
}

- (void)removeObserversForWashers:(NSArray *)washersObservers
                      bookkeepers:(NSArray *)bookkeepersObservers
                        directors:(NSArray *)directorsObservers
{
    [self removeObserversForWashers:washersObservers];
    [self removeObserversForBookkeepers:bookkeepersObservers];
    [self removeObserversForDirectors:directorsObservers];
}

//- (NSArray *)employees {
//    NSMutableArray *employees = [NSMutableArray array];
//    
//    @synchronized (self) {
//        [employees addObjectsFromArray:self.mutableWashers];
//        [employees addObjectsFromArray:self.mutableBookkeepers];
//        [employees addObject:self.director];
//    }
//    
//    return [[employees copy] autorelease];
//}

- (void)washCar:(AVCar *)car {
    [self.washersDispatcher processObject:car];
}

@end

