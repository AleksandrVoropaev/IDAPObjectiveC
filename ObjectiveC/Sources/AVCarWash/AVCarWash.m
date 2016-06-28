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
@property (nonatomic, retain) AVRoom            *room;
@property (nonatomic, retain) AVWashingRoom     *carWashRoom;
@property (nonatomic, retain) AVBuilding        *administrationBuilding;
@property (nonatomic, retain) AVBuilding        *carWashBuilding;
@property (nonatomic, retain) NSMutableArray    *mutableEmployees;

@end

@implementation AVCarWash

@dynamic employees;

- (void)dealloc {
    self.room = nil;
    self.carWashRoom = nil;
    self.administrationBuilding = nil;
    self.carWashBuilding = nil;
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    [self makeCarWashInfrastructure];
    
    return self;
}

- (instancetype)makeCarWashInfrastructure {
    AVRoom *room = [AVRoom object];
    AVWashingRoom *carWashRoom = [AVWashingRoom object];
    AVBuilding *administrationBuilding = [AVBuilding object];
    AVBuilding *carWashBuilding =[AVBuilding object];
    
    NSArray *directors = [NSArray arrayOfObjectsWithClass:[AVDirector class] quantity:1];
    for (AVDirector *director in directors) {
        [room addEmployee:director];
    }
    
    NSArray *bookkeepers = [NSArray arrayOfObjectsWithClass:[AVBookkeeper class] quantity:3];
    for (AVBookkeeper *bookkeeper in bookkeepers) {
        [room addEmployee:bookkeeper];
    }
    
    NSArray *washers = [NSArray arrayOfObjectsWithClass:[AVWasher class] quantity:3];
    for (AVWasher *washer in washers) {
        [carWashRoom addEmployee:washer];
    }
    
    [administrationBuilding addRoom:room];
    [carWashBuilding addRoom:carWashRoom];
    
    self.room = room;
    self.carWashRoom = carWashRoom;
    self.administrationBuilding = administrationBuilding;
    self.carWashBuilding = carWashBuilding;
    
    return self;
}

- (NSArray *)employees {
    NSMutableArray *employees = [NSMutableArray array];
    [employees addObjectsFromArray:[self.administrationBuilding employees]];
    [employees addObjectsFromArray:[self.carWashBuilding employees]];
    self.mutableEmployees = employees;
    
    return [[self.mutableEmployees copy] autorelease];
}

- (NSArray *)findFreeEmployeeWithClass:(Class)cls {
    NSArray *employees = [self employees];
    NSMutableArray *freeEmployeesOfClass = [NSMutableArray array];
    for (AVEmployee *employee in employees) {
        if ([employee isKindOfClass:cls] && [employee isFree]) {
            [freeEmployeesOfClass addObject:employee];
        }
    }
    
    return [[freeEmployeesOfClass copy] autorelease];
}

- (void)washCar:(AVCar *)car {
    NSUInteger carWashCost = 100;
    [car increaseMoney:(carWashCost)];
    AVQueue *carQueue = [AVQueue object];
    [carQueue enqueueObject:car];
    
    AVWasher *washer = [[self findFreeEmployeeWithClass:[AVWasher class]] firstObject];
    AVWasher *bookkeeper = [[self findFreeEmployeeWithClass:[AVBookkeeper class]] firstObject];
    AVWasher *director = [[self findFreeEmployeeWithClass:[AVDirector class]] firstObject];

    [washer processObject:[carQueue getFirstObjectInQueue]];
    [bookkeeper processObject:washer];
    [director processObject:bookkeeper];
}

@end
