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
@property (nonatomic, retain) NSMutableArray *mutableEmployees;

@end

@implementation AVBuilding

@dynamic rooms;
@dynamic employees;

- (void)dealloc {
    self.mutableRooms = nil;
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableRooms = [NSMutableArray array];
    self.mutableEmployees = [NSMutableArray array];
    
    return self;
}

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

- (void)addRoom:(NSObject *)room {
    [self.mutableRooms addObject:room];
}

- (void)removeRoom:(NSObject *)room {
    [self.mutableRooms removeObject:room];
}

- (NSArray *)employees {
    NSMutableArray *employees = [NSMutableArray array];
    for (AVRoom *room in self.rooms) {
        [employees addObjectsFromArray:[room employees]];
    }
    self.mutableEmployees = employees;
    
    return [[self.mutableEmployees copy] autorelease];
}

@end
