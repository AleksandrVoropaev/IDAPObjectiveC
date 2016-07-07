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

@interface AVCarWash()
@property (nonatomic, retain) AVBuilding        *administrationBuilding;
@property (nonatomic, retain) AVBuilding        *carWashBuilding;
@property (nonatomic, retain) AVQueue           *carQueue;

@end

@implementation AVCarWash

- (void)dealloc {
    self.administrationBuilding = nil;
    self.carWashBuilding = nil;
    self.carQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    [self initInfrastructure];
    self.carQueue = [AVQueue object];
    
    return self;
}

- (void)initInfrastructure {
    AVRoom *room = [AVRoom object];
    AVWashingRoom *carWashRoom = [AVWashingRoom object];
    AVBuilding *administrationBuilding = [AVBuilding object];
    AVBuilding *carWashBuilding =[AVBuilding object];
    
    [room addEmployee:[AVDirector object]];
    [room addEmployees:[AVBookkeeper objectsWithCount:3]];
    [carWashRoom addEmployees:[AVWasher objectsWithCount:3]];
    
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

- (AVDirector *)freeDitrector {
    return [self freeEmployeeWithClass:[AVDirector class]];
}

- (id)freeEmployeeWithClass:(Class)cls {
    return [[self freeEmployeesWithClass:cls] firstObject];
}

- (id)freeEmployeesWithClass:(Class)cls {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(AVEmployee *employee, NSDictionary *bindings) {
        return employee.free;
    }];
    
    return [[self employeesWithClass:cls] filteredArrayUsingPredicate:predicate];
}

- (void)enqueueCars:(NSArray *)cars {
    for (AVCar *car in cars) {
        [self.carQueue enqueueObject:car];
    }
}

- (void)washCar:(AVCar *)car {
    [self.carQueue enqueueObject:car];
    
    NSUInteger count = [self.carQueue count] + 1;
    for (NSUInteger index = 0; index < count; index++) {
        AVCar *carToWash = [self.carQueue dequeueObject];

        AVWasher *washer = [self freeWasher];
        AVBookkeeper *bookkeeper = [self freeBookkeeper];
        AVDirector *director = [self freeDitrector];
        
        [washer processObject:carToWash];
        [bookkeeper processObject:washer];
        [director processObject:bookkeeper];
    }
}

@end

