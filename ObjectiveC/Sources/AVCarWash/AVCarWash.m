//
//  AVCarWash.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVCarWash.h"

#import "AVCar.h"
#import "AVWasher.h"
#import "AVBookkeeper.h"
#import "AVDirector.h"
#import "AVRoom.h"
#import "AVWashingRoom.h"
#import "AVBuilding.h"
#import "AVQueue.h"

#import "NSObject+AVExtensions.h"
#import "NSArray+AVExtensions.h"

NSUInteger const kMaxWashersCount = 3;

@interface AVCarWash()
@property (nonatomic, retain) AVBuilding        *administrationBuilding;
@property (nonatomic, retain) AVBuilding        *carWashBuilding;
@property (nonatomic, retain) AVQueue           *carQueue;
@property (nonatomic, retain) AVQueue           *washersQueue;

@end

@implementation AVCarWash

- (void)dealloc {
    self.administrationBuilding = nil;
    self.carWashBuilding = nil;
    self.carQueue = nil;
    self.washersQueue = nil;
    
    for (AVWasher *washer in [self employeesWithClass:[AVWasher class]]) {
        [self removeObserversForWasher:washer
              withCarWashAndBookkeeper:[self employeesWithClass:[AVEmployee class]].firstObject];
    }
    
    [self removeObserverForBookkeeper:[self employeesWithClass:[AVEmployee class]].firstObject
                         withDirector:[self employeesWithClass:[AVDirector class]].firstObject];

    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.carQueue = [AVQueue object];
    self.washersQueue = [AVQueue object];
    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    AVRoom *room = [AVRoom object];
    AVWashingRoom *carWashRoom = [AVWashingRoom object];
    AVBuilding *administrationBuilding = [AVBuilding object];
    AVBuilding *carWashBuilding =[AVBuilding object];
    
    AVDirector *director = [AVDirector object];
    AVBookkeeper *bookkeeper = [AVBookkeeper object];

    [room addEmployee:director];
    [room addEmployee:bookkeeper];
    
    [self addObserverForBookkeeper:bookkeeper withDirector:director];

    for (NSUInteger index = 0; index < kMaxWashersCount; index++) {
        AVWasher *washer = [AVWasher object];
        [self.washersQueue enqueueObject:washer];
        [self addObserversForWasher:washer withCarWashAndBookkeeper:bookkeeper];
        [carWashRoom addEmployee:washer];
    }

    [administrationBuilding addRoom:room];
    [carWashBuilding addRoom:carWashRoom];
    
    self.administrationBuilding = administrationBuilding;
    self.carWashBuilding = carWashBuilding;
}

- (AVBuilding *)buildingWithEmployeeClass:(Class)employeeClass {
    return employeeClass == [AVWasher class] ? self.carWashBuilding : self.administrationBuilding;
}

- (NSArray *)employeesWithClass:(Class)cls {
    return [[[[self buildingWithEmployeeClass:cls] employeesWithClass:cls] copy] autorelease];
}

- (AVWasher *)freeWasher {
    return [self freeEmployeeWithClass:[AVWasher class]];
}

- (AVBookkeeper *)freeBookkeeper {
    return [self freeEmployeeWithClass:[AVBookkeeper class]];
}

- (AVDirector *)freeDirector {
    return [self freeEmployeeWithClass:[AVDirector class]];
}

- (id)freeEmployeeWithClass:(Class)cls {
    return [[self freeEmployeesWithClass:cls] firstObject];
}

- (id)freeEmployeesWithClass:(Class)cls {
    return [[self employeesWithClass:cls] filteredArrayUsingBlock:^BOOL(AVEmployee *employee) { return employee.free; }];
}

- (void)washCars:(NSArray *)cars {
    for (AVCar *car in cars) {
        [self washCar:car];
    }
}

- (void)addObserversForWasher:(AVWasher *)washer withCarWashAndBookkeeper:(AVBookkeeper *)bookkeeper {
    [washer addObserver:bookkeeper];
    [washer addObserver:self];
}

- (void)removeObserversForWasher:(AVWasher *)washer withCarWashAndBookkeeper:(AVBookkeeper *)bookkeeper {
    [washer removeObserver:bookkeeper];
    [washer removeObserver:self];
}

- (void)addObserverForBookkeeper:(AVBookkeeper *)bookkeeper withDirector:(AVDirector *)director {
    [bookkeeper addObserver:director];
}

- (void)removeObserverForBookkeeper:(AVBookkeeper *)bookkeeper withDirector:(AVDirector *)director {
    [bookkeeper addObserver:director];
}

- (void)washCar:(AVCar *)car {
    [self.carQueue enqueueObject:car];
    AVWasher *washer = [self.washersQueue dequeueObject];

    if (washer) {
        [washer processObject:[self.carQueue dequeueObject]];
    } else {
        [self.carQueue enqueueObject:car];
    }
}

- (void)employeeDidBecomeFree:(AVWasher *)washer {
    @synchronized (self) {
        AVCar *car = [self.carQueue dequeueObject];
        
        if (car) {
            [washer processObject:car];
        } else {
            [self.washersQueue enqueueObject:washer];
        }
    }
}

@end

