//
//  AVQueue.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/28/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVQueue.h"

@interface AVQueue()
@property (nonatomic, retain) NSMutableArray *mutableQueue;

@end

@implementation AVQueue

@dynamic queue;

- (void)dealloc
{
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableQueue = [NSMutableArray array];
    
    return self;
}

- (void)enqueueObject:(id)object {
    [self.mutableQueue addObject:object];
}

- (void)dequeueObject:(id)object {
    [self.mutableQueue removeObject:object];
}

- (NSArray *)queue {
    return [[self.mutableQueue copy] autorelease];
}

- (id)getFirstObjectInQueue {
    return [self.mutableQueue firstObject];
}

@end
