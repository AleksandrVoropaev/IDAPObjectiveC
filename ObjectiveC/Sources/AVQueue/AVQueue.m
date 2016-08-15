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

@dynamic count;

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
    @synchronized (self) {
        [self.mutableQueue addObject:object];
    }
}

- (id)dequeueObject {
    id object = nil;
    @synchronized (self) {
        NSMutableArray *mutableQueue = self.mutableQueue;
        object = [[[mutableQueue firstObject] retain] autorelease];
        [mutableQueue removeObject:object];

    }
    
    return object;
}

- (NSUInteger)count {
    return [self.mutableQueue count];
}

@end
