//
//  AVEmployee.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployee.h"

@interface AVEmployee()
@property (nonatomic, copy) NSMutableArray *mutableDuties;

@end

@implementation AVEmployee

@dynamic duties;

- (instancetype)init {
    self = [super init];
    self.mutableDuties = [[NSMutableArray new] autorelease];
    
    return self;
}

- (NSArray *)duties {
    return [[self.mutableDuties copy] autorelease];
}

- (void)addDuty:(NSString *)duty {
    NSMutableArray *array = self.mutableDuties;
    if (![array containsObject:duty]) {
        [array addObject:duty];
    }
}

@end
