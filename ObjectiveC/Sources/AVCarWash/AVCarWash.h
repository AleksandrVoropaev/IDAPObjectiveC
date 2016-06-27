//
//  AVCarWash.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVCar.h"
#import "AVRoom.h"
#import "AVWashingRoom.h"
#import "AVBuilding.h"
#import "AVWasher.h"
#import "AVBookkeeper.h"
#import "AVDirector.h"

@interface AVCarWash : NSObject
@property (nonatomic, readonly) NSArray *carsQueue;

- (void)washCar:(AVCar *)car;
- (void)addCarToQueue:(AVCar *)car;
- (void)removeCarFromQueue:(AVCar *)car;
- (AVCar *)firstCarInQueue;
- (NSMutableArray *)carQueue;

@end
