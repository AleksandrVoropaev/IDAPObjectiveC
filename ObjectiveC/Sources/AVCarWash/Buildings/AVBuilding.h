//
//  AVBuilding.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVRoom.h"

@interface AVBuilding : NSObject
@property (nonatomic, readonly) NSArray *rooms;

- (void)addRoom:(NSObject *)room;

@end
