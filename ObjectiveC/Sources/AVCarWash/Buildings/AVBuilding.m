//
//  AVBuilding.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVBuilding.h"

#import "AVEmployee.h"

@interface AVBuilding()
@property (nonatomic, retain) NSMutableArray *mutableRooms;

@end

@implementation AVBuilding

@dynamic rooms;

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableRooms = [NSMutableArray array];
    
    return self;
}

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

- (void)addRoom:(AVRoom *)room {
    [self.mutableRooms addObject:room];
}

- (void)removeRoom:(AVRoom *)room {
    [self.mutableRooms removeObject:room];
}

//- (NSArray *)employees {
//    self.mutableEmployees = [[[self employeesWithClass:[AVEmployee class]] mutableCopy] autorelease];
//    
//    return [[self.mutableEmployees copy] autorelease];
//}

- (NSArray *)employeesWithClass:(Class)cls {
    NSMutableArray *result = [NSMutableArray array];
    for (AVRoom *room in self.rooms) {
        [result addObjectsFromArray:[room employeesWithClass:cls]];
    }
    
    return [[result copy] autorelease];
}

@end
