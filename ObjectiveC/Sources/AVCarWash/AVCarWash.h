//
//  AVCarWash.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVRoom.h"
#import "AVWashingRoom.h"
#import "AVBuilding.h"
#import "AVWasher.h"
#import "AVBookkeeper.h"
#import "AVDirector.h"

@interface AVCarWash : NSObject
@property (nonatomic, retain) AVRoom *room;
@property (nonatomic, retain) AVWashingRoom *carWashRoom;
@property (nonatomic, retain) AVBuilding *administrationBuilding;
@property (nonatomic, retain) AVBuilding *carWashBuilding;
@property (nonatomic, retain) AVWasher *washer;
@property (nonatomic, retain) AVBookkeeper *bookkeeper;
@property (nonatomic, retain) AVDirector *director;

- (void)initCarWash;
- (void)washCar;

@end
