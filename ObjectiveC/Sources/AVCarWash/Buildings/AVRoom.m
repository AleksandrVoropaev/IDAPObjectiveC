//
//  AVRoom.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVRoom.h"

@interface AVRoom()
@property (nonatomic, retain) NSMutableArray *mutableEmployees;

@end

@implementation AVRoom
@dynamic employees;

- (instancetype)init {
    self = [super init];
    self.mutableEmployees = [NSMutableArray array];
    
    return self;
}

- (NSArray *)employees {
    return [[self.mutableEmployees copy] autorelease];
}

-(void)addEmployee:(NSObject *)employee {
    [self.mutableEmployees addObject:employee];
}

@end
