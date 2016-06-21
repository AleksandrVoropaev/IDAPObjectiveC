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

@implementation AVCarWash

-(void)makeCarClean {
    AVRoom *room = [[[AVRoom alloc] init] autorelease];
    AVWashingRoom *carWashRoom = [[[AVWashingRoom alloc] init] autorelease];
    AVBuilding *administrationBuilding = [[[AVBuilding alloc] init] autorelease];
    AVBuilding *carWashBuilding = [[[AVBuilding alloc] init] autorelease];
    
    AVWasher *washer = [[[AVWasher alloc] init] autorelease];
    AVBookkeeper *bookkeeper = [[[AVBookkeeper alloc] init] autorelease];
    AVDirector *director = [[[AVDirector alloc] init] autorelease];
    
    AVCar *car = [[[AVCar alloc] init] autorelease];
    
    [administrationBuilding addRoom:room];
    [carWashBuilding addRoom:carWashRoom];
    
    [room addEmployee:director];
    [room addEmployee:bookkeeper];
    [carWashRoom addEmployee:washer];
    
    NSUInteger carWashCost =  100;
    car.money = carWashCost * 3;
    
    [washer takeMoneyFromObject:car withValue:carWashCost];
    [bookkeeper takeMoneyFromObject:washer withValue:carWashCost];
    [bookkeeper countMoneyWithValue:carWashCost];
    [director takeMoneyFromObject:bookkeeper withValue:carWashCost];
    [director earnProfitWithValue:carWashCost];
}

@end
