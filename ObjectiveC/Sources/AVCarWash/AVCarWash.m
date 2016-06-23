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

@implementation AVCarWash

- (void)initCarWash {
    self.room = [AVRoom object];
    self.carWashRoom = [AVWashingRoom object];
    self.administrationBuilding = [AVBuilding object];
    self.carWashBuilding =[AVBuilding object];
    
    self.washer = [AVWasher object];
    self.bookkeeper = [AVBookkeeper object];
    self.director = [AVDirector object];
    
    [self.administrationBuilding addRoom:self.room];
    [self.carWashBuilding addRoom:self.carWashRoom];
    
    [self.room addEmployee:self.director];
    [self.room addEmployee:self.bookkeeper];
    [self.carWashRoom addEmployee:self.washer];
}

- (void)washCar {
    AVCar *car = [AVCar object];
    
    NSUInteger carWashCost = 100;
    car.money = carWashCost * 3;
//    [car increaseMoney:carWashCost * 3];
    
    [self.washer washCar:car];
    [self.washer takeMoneyFromObject:car withValue:carWashCost];
    
    [self.bookkeeper takeMoneyFromObject:self.washer withValue:carWashCost];
    [self.bookkeeper countMoneyWithValue:carWashCost];
    
    [self.director takeMoneyFromObject:self.bookkeeper withValue:carWashCost];
    [self.director earnProfitWithValue:carWashCost];
}

@end
