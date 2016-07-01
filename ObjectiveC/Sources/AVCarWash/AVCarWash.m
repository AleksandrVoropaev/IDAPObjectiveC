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
    
    [room addEmployee:[AVDirector object]];
    [room addEmployees:[AVBookkeeper objectsWithCount:3]];
    [carWashRoom addEmployees:[AVWasher objectsWithCount:3]];
    
    [administrationBuilding addRoom:room];
    [carWashBuilding addRoom:carWashRoom];

    self.administrationBuilding = administrationBuilding;
    self.carWashBuilding = carWashBuilding;
}

- (NSArray *)employees {
    return [[[self employeesWithClass:[AVEmployee class]] copy] autorelease];
}

- (NSArray *)employeesWithClass:(Class)cls {
    NSMutableArray *result = [NSMutableArray array];
    [result addObjectsFromArray:[self.administrationBuilding employeesWithClass:cls]];
    [result addObjectsFromArray:[self.carWashBuilding employeesWithClass:cls]];
    
    return [[result copy] autorelease];
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
    AVWasher *washer = [[self findFreeEmployees:[self employeesWithClass:[AVWasher class]]] firstObject];
    AVBookkeeper *bookkeeper = [[self findFreeEmployees:[self employeesWithClass:[AVBookkeeper class]]] firstObject];
    AVDirector *director = [[self findFreeEmployees:[self employeesWithClass:[AVDirector class]]] firstObject];
    
    [[self carQueue] enqueueObject:car];
    
    for (AVCar *car in self.carQueue.queue) {
        [washer processObject:car];
        [bookkeeper processObject:washer];
        [director processObject:bookkeeper];
    }
    
    [[self carQueue] dequeueObject:car];
}

@end
