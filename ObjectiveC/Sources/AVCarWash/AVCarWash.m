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
static NSUInteger const kAVCarWashBookkeepersCount  = 3;

@interface AVCarWash()
@property (nonatomic, retain)   NSMutableArray          *mutableWashers;
@property (nonatomic, retain)   NSMutableArray          *mutableBookkeepers;
@property (nonatomic, retain)   AVDirector              *director;
@property (nonatomic, retain)   AVEmployeesDispatcher   *washersDispatcher;
@property (nonatomic, retain)   AVEmployeesDispatcher   *bookkeepersDispatcher;
@property (nonatomic, retain)   AVEmployeesDispatcher   *directorsDispatcher;

@end

@implementation AVCarWash

- (void)dealloc {
    for (AVWasher *washer in self.mutableWashers) {
        [washer removeObservers:@[self.washersDispatcher,self.bookkeepersDispatcher]];
    }
    
    for (AVBookkeeper *bookkeeper in self.mutableBookkeepers) {
        [bookkeeper removeObservers:@[self.bookkeepersDispatcher, self.directorsDispatcher]];
    }
    
    [self.director removeObserver:self.directorsDispatcher];
    
    self.mutableWashers = nil;
    self.mutableBookkeepers = nil;
    self.director = nil;
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
    AVEmployeesDispatcher *directorsDispatcher      = self.directorsDispatcher      = [AVEmployeesDispatcher object];
    AVEmployeesDispatcher *bookkeepersDispatcher    = self.bookkeepersDispatcher    = [AVEmployeesDispatcher object];
    AVEmployeesDispatcher *washersDispatcher        = self.washersDispatcher        = [AVEmployeesDispatcher object];

    AVDirector *director = self.director = [AVDirector object];
    [director addObserver:directorsDispatcher];
    
    [self createEmployeesWithClass:[AVBookkeeper class]
                             count:kAVCarWashBookkeepersCount
                         observers:@[bookkeepersDispatcher,directorsDispatcher]];
    [self createEmployeesWithClass:[AVWasher class]
                             count:kAVCarWashWashersCount
                         observers:@[washersDispatcher,bookkeepersDispatcher]];
    
    [washersDispatcher addEmployees:self.mutableWashers];
    [bookkeepersDispatcher addEmployees:self.mutableBookkeepers];
    [directorsDispatcher addEmployee:director];
}

- (void)createEmployeesWithClass:(Class)cls count:(NSUInteger)count observers:(NSArray *)observers {
    for (NSUInteger index = 0; index < count; index++) {
        id employee = [cls object];
        [employee addObservers:observers];
        if (cls == [AVBookkeeper class]) {
            [self.mutableBookkeepers addObject:employee];
        } else if (cls == [AVWasher class]) {
            [self.mutableWashers addObject:employee];
        }
    }
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

