//
//  AVRoom.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVRoom.h"

#import "AVEmployee.h"

@interface AVRoom()
@property (nonatomic, retain) NSMutableArray *mutableEmployees;

@end

@implementation AVRoom

@dynamic employees;

- (void)dealloc {
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableEmployees = [NSMutableArray array];
    
    return self;
}

- (NSArray *)employees {
    return [[self.mutableEmployees copy] autorelease];
}

- (NSArray *)employeesWithClass:(Class)cls {
    NSMutableArray *result = [NSMutableArray array];
    for (AVEmployee *employee in self.mutableEmployees) {
        if ([employee isMemberOfClass:cls]) {
            [result addObject:employee];
        }
    }
    
    return [[result copy] autorelease];
}

- (void)addEmployee:(NSObject *)employee {
    [self.mutableEmployees addObject:employee];
}

- (void)removeEmployee:(NSObject *)employee {
    [self.mutableEmployees removeObject:employee];
}

- (void)addEmployees:(NSArray *)employees {
    [self.mutableEmployees addObjectsFromArray:employees];
}

@end
