//
//  NSArray+AVExtensions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSArray+AVExtensions.h"

@implementation NSArray (AVExtensions)

+ (NSArray *)arrayWithCount:(NSUInteger)count factoryBlock:(id (^)(void))objectsParametersBlock {
    if (!objectsParametersBlock) {
        return nil;
    }
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    
    for (NSUInteger index = 0; index < count; index++) {
        [result addObject:objectsParametersBlock()];
    }
    
    return [self arrayWithArray:result];
}

- (NSArray *)filteredArrayUsingBlock:(AVArrayFilterBlock)block {
    if (!block) {
        return self;
    }

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }];

    return [self filteredArrayUsingPredicate:predicate];
}

<<<<<<< HEAD
- (void)performEachObjectUsingBlock:(void (^)(id object))block {
=======
- (void)performEachObjectUsingBlock:(void (^)(id object))operationBlock {
>>>>>>> feature/CarWash_with_timer
    for (id object in self) {
        block(object);
    }
}

@end
