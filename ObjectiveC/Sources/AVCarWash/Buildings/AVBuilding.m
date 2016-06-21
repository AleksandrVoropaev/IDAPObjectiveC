//
//  AVBuilding.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVBuilding.h"

@interface AVBuilding()
@property (nonatomic, retain) NSMutableArray *mutableRooms;

@end

@implementation AVBuilding
@dynamic rooms;

- (instancetype)init {
    self = [super init];
    self.mutableRooms = [NSMutableArray array];
    
    return self;
}

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

- (void)addRoom:(NSObject *)room {
    [self.mutableRooms addObject:room];
}

@end
