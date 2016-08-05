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

@interface AVCarWash()
@property (nonatomic, retain) AVBuilding        *administrationBuilding;
@property (nonatomic, retain) AVBuilding        *carWashBuilding;
@property (nonatomic, retain) AVQueue           *carQueue;
@property (nonatomic, retain) NSMutableArray    *washers;

@end

@implementation AVCarWash

- (void)dealloc {
    self.administrationBuilding = nil;
    self.carWashBuilding = nil;
    self.carQueue = nil;
    self.washers = nil;
    
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
    self.washers = [NSMutableArray array];
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
    NSArray *washers = [NSArray arrayWithArray:[AVWasher objectsWithCount:3]];
    [room addEmployee:director];
    [room addEmployee:bookkeeper];
    [carWashRoom addEmployees:washers];
    
    for (AVWasher *washer in washers) {
        [self addObserversForWasher:washer withCarWashAndBookkeeper:bookkeeper];
    }
    
    [self addObserverForBookkeeper:bookkeeper withDirector:director];
    [administrationBuilding addRoom:room];
    [carWashBuilding addRoom:carWashRoom];
    
    [self.washers addObjectsFromArray:washers];

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

//- (void)addObserversForWasher:(AVWasher *)washer
//                andBookkeeper:(AVBookkeeper *)bookkeeper
//                 withDirector:(AVDirector *)director
//{
//    [washer addObserver:bookkeeper];
//    [bookkeeper addObserver:director];
//}
//
//- (void)removeObserversForWasher:(AVWasher *)washer
//                   andBookkeeper:(AVBookkeeper *)bookkeeper
//                    withDirector:(AVDirector *)director
//{
//    [washer removeObserver:bookkeeper];
//    [bookkeeper removeObserver:director];
//}

- (AVWasher *)reservedFreeWasher {
    AVWasher *washer = [self freeWasher];
    washer.state = AVEmployeeBusy;
    
    return washer;
}

- (void)washCar:(AVCar *)car {
    @synchronized (self.washers) {
        [self.carQueue enqueueObject:car];
        AVWasher *washer = [self.washers firstObject];
//        AVWasher *washer = [self freeWasher];
//        AVWasher *washer = [self reservedFreeWasher];
        
        if (washer) {
            [washer processObject:[self.carQueue dequeueObject]];
        } else {
            [self.carQueue enqueueObject:car];
        }
    }
}

- (void)employeeDidBecomeFree:(AVWasher *)washer {
//    @synchronized (washer) {
        AVCar *car = [self.carQueue dequeueObject];
        
        if (car) {
            [washer processObject:car];
        }
//    }
}

@end

