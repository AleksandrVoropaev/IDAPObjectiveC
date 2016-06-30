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
    
    [super dealloc];
}

- (instancetype)init {
    [super init];
    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    AVRoom *room = [AVRoom object];
    AVWashingRoom *carWashRoom = [AVWashingRoom object];
    AVBuilding *administrationBuilding = [AVBuilding object];
    AVBuilding *carWashBuilding =[AVBuilding object];
    
    NSArray *directors = [NSArray objectsWithQuantity:1];
    [room addEmployees:directors];
    
    NSArray *bookkeepers = [NSArray objectsWithQuantity:3];
    [room addEmployees:bookkeepers];
    
    NSArray *washers = [NSArray objectsWithQuantity:3];
    [carWashRoom addEmployees:washers];
    
    [administrationBuilding addRoom:room];
    [carWashBuilding addRoom:carWashRoom];

    self.administrationBuilding = administrationBuilding;
    self.carWashBuilding = carWashBuilding;
}

- (NSArray *)employees {
    NSMutableArray *employees = [NSMutableArray array];
    [employees addObjectsFromArray:[self.administrationBuilding employees]];
    [employees addObjectsFromArray:[self.carWashBuilding employees]];
    
    return [[employees copy] autorelease];
}

- (NSArray *)findFreeEmployees:(NSArray *)employees {
    NSMutableArray *freeEmployees = [NSMutableArray array];
    for (AVEmployee *employee in employees) {
        if ([employee isFree]) {
            [freeEmployees addObject:employee];
        }
    }
    
    return [[freeEmployees copy] autorelease];
}

- (void)washCar:(AVCar *)car {
//    AVWasher *washer = [[self findFreeEmployees:(AVRoom *)(self.carWashBuilding.).employees] firstObject];
    AVRoom *carWashRoom = self.carWashBuilding.rooms[0];
    AVWasher *washer = [[self findFreeEmployees:carWashRoom.employees] firstObject];
    AVRoom *room = self.administrationBuilding.rooms[0];
    AVWasher *bookkeeper = [[self findFreeEmployees:room.employees] firstObject];
    AVWasher *director = [[self findFreeEmployees:room.employees] firstObject];
    
    for (AVCar *car in self.carQueue.queue) {
        [washer processObject:car];
        [bookkeeper processObject:car];
        [director processObject:car];
    }
}

@end
