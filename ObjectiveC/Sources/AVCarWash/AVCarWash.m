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

#import "NSObject+AVExtentions.h"

@interface AVCarWash()
@property (nonatomic, retain) AVRoom            *room;
@property (nonatomic, retain) AVWashingRoom     *carWashRoom;
@property (nonatomic, retain) AVBuilding        *administrationBuilding;
@property (nonatomic, retain) AVBuilding        *carWashBuilding;
@property (nonatomic, retain) NSMutableArray    *mutableCarsQueue;

@end

@implementation AVCarWash

@dynamic carsQueue;

- (void)dealloc {
    self.room = nil;
    self.carWashRoom = nil;
    self.administrationBuilding = nil;
    self.carWashBuilding = nil;
    
    self.mutableCarsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    AVRoom *room = [AVRoom object];
    AVWashingRoom *carWashRoom = [AVWashingRoom object];
    AVBuilding *administrationBuilding = [AVBuilding object];
    AVBuilding *carWashBuilding =[AVBuilding object];
    
    AVDirector *director = [AVDirector object];
    AVBookkeeper *firstBookkeeper = [AVBookkeeper object];
    AVBookkeeper *secondBookkeeper = [AVBookkeeper object];
    AVBookkeeper *thirdBookkeeper = [AVBookkeeper object];
    AVWasher *firstWasher = [AVWasher object];
    AVWasher *secondWasher = [AVWasher object];
    AVWasher *thirdWasher = [AVWasher object];
    
    director.free = YES;
    firstBookkeeper.free = YES;
    secondBookkeeper.free = YES;
    thirdBookkeeper.free = YES;
    firstWasher.free = YES;
    secondWasher.free = YES;
    thirdWasher.free = YES;
    
    [room addEmployee:director];
    [room addEmployee:firstBookkeeper];
    [room addEmployee:secondBookkeeper];
    [room addEmployee:thirdBookkeeper];
    [carWashRoom addEmployee:firstWasher];
    [carWashRoom addEmployee:secondWasher];
    [carWashRoom addEmployee:thirdWasher];
    
    self.room = room;
    self.carWashRoom = carWashRoom;
    self.administrationBuilding = administrationBuilding;
    self.carWashBuilding = carWashBuilding;
    
    [self.administrationBuilding addRoom:self.room];
    [self.carWashBuilding addRoom:self.carWashRoom];
    
    self.mutableCarsQueue = [NSMutableArray array];
    
    return self;
}

- (void)addCarToQueue:(AVCar *)car {
    [self.mutableCarsQueue addObject:car];
}

- (void)removeCarFromQueue:(AVCar *)car {
    [self.mutableCarsQueue removeObject:car];
}

- (NSMutableArray *)carQueue {
    return [[self.mutableCarsQueue copy] autorelease];
}

- (AVCar *)firstCarInQueue {
    return [self.mutableCarsQueue firstObject];
}

- (void)washCar:(AVCar *)car {
    NSUInteger carWashCost = 100;
    [car increaseMoney:(carWashCost * 3)];
    
//    AVWasher *washer = (AVWasher *)[self.carWashBuilding.rooms[0] findFreeEmployeeWithClass:washer.class];
//    AVBookkeeper *bookkeeper = (AVBookkeeper *)[self.administrationBuilding.rooms[0] findFreeEmployeeWithClass:bookkeeper.class];
//    AVDirector *director = (AVDirector *)[self.administrationBuilding.rooms[0] findFreeEmployeeWithClass:director.class];

    AVWasher *washer = [self.carWashRoom findFreeEmployeeWithClass:washer.class];
    AVBookkeeper *bookkeeper = (AVBookkeeper *)[self.room findFreeEmployeeWithClass:bookkeeper.class];
    AVDirector *director = (AVDirector *)[self.room findFreeEmployeeWithClass:director.class];

    [washer processObject:car withValue:carWashCost];
    [bookkeeper processObject:washer withValue:carWashCost];
    [director processObject:bookkeeper withValue:carWashCost];
}

@end
