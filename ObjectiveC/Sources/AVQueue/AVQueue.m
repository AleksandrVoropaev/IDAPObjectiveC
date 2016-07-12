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

//@synthesize count;

- (void)dealloc {
//    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
//    self.mutableQueue = [NSMutableArray array];
    self = [NSMutableArray array];
    return self;
}

- (void)enqueueObject:(id)object {
//    [self.mutableQueue addObject:object];
    [self addObject:object];
}

- (id)dequeueObject {
    id object = [self firstObject];
    [self removeObject:object];
    
    return object;
}

//- (id)dequeueObject {
//    NSMutableArray *mutableQueue = self.mutableQueue;
//    id object = [mutableQueue firstObject];
//    [mutableQueue removeObject:object];
//    
//    return object;
//}

//- (NSUInteger)count {
//    return [self.mutableQueue count];
//}

@end
