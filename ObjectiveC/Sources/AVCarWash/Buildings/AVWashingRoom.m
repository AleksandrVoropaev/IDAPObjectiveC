//
//  AVWashingRoom.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/20/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVWashingRoom.h"

@interface AVWashingRoom()
@property (nonatomic, retain) NSMutableArray *mutableCars;

@end

@implementation AVWashingRoom
@dynamic cars;

- (instancetype)init {
    self = [super init];
    self.mutableCars = [NSMutableArray array];
    
    return self;
}

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

- (void)addCar:(NSObject *)car {
    [self.mutableCars addObject:car];
}

- (void)removeCar:(NSObject *)car {
    [self.mutableCars removeObject:car];
}

@end
