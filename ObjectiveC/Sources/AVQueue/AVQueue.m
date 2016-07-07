//
//  AVQueue.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/28/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVQueue.h"

#import "AVCar.h"

@interface AVQueue ()
@property (nonatomic, retain) NSMutableArray *mutableQueue;

@end

@implementation AVQueue

- (void)dealloc {
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

- (AVCar *)dequeueObject {
    NSMutableArray *mutableQueue = self.mutableQueue;
    id firstObject = [mutableQueue firstObject];
    [mutableQueue removeObject:firstObject];
    
    return firstObject;
}

- (NSUInteger)count {
    return [self.mutableQueue count];
}

@end
