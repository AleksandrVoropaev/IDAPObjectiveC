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
#import "AVCarWashDispatcher.h"
#import "AVRandom.h"

#import "NSObject+AVExtensions.h"
#import "NSArray+AVExtensions.h"

typedef void(^AVRemoveObserversBlock)(NSMutableArray *employees, NSArray *observers);
typedef id(^AVEmployeesFactoryBlock)(NSUInteger count, Class employeeClass, NSArray *observers);

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
    AVRemoveObserversBlock removeObservers = ^void(NSMutableArray *employees, NSArray *observers) {
        [employees performEachObjectUsingBlock:^(id object) {
            [object removeObservers:observers];
        }];
    };
    
    removeObservers(self.mutableWashers, @[self.bookkeepersDispatcher]);
    removeObservers(self.mutableBookkeepers, @[self.directorsDispatcher]);
    
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

    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    AVEmployeesFactoryBlock employees= ^id(NSUInteger count, Class employeeClass, NSArray *observers) {
        return [NSMutableArray arrayWithCount:count factoryBlock:^ {
            AVEmployee *employee = [employeeClass object];
            [employee addObservers:observers];
            
            return employee;
        }];
    };
    
    AVEmployeesDispatcher *directorsDispatcher = [AVEmployeesDispatcher object];
    AVEmployeesDispatcher *bookkeepersDispatcher = [AVEmployeesDispatcher object];
    AVEmployeesDispatcher *washersDispatcher = [AVEmployeesDispatcher object];
    
    NSMutableArray *directors = employees(kAVCarWashDirectorsCount, [AVDirector class], nil);
    NSMutableArray *bookkeepers = employees(kAVCarWashBookkeepersCount, [AVBookkeeper class], @[directorsDispatcher]);
    NSMutableArray *washers = employees(kAVCarWashWashersCount, [AVWasher class], @[bookkeepersDispatcher]);
    
    [directorsDispatcher addEmployees:directors];
    [bookkeepersDispatcher addEmployees:bookkeepers];
    [washersDispatcher addEmployees:washers];
    
    self.mutableDirectors = directors;
    self.mutableBookkeepers = bookkeepers;
    self.mutableWashers = washers;
    
    self.directorsDispatcher = directorsDispatcher;
    self.bookkeepersDispatcher = bookkeepersDispatcher;
    self.washersDispatcher = washersDispatcher;
}

- (void)washCar:(AVCar *)car {
    [self.washersDispatcher processObject:car];
}

@end

