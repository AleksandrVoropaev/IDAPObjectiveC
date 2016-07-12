//
//  NSArray+AVExtensions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSArray+AVExtensions.h"

@implementation NSArray (AVExtensions)

- (NSArray *)filteredArrayUsingBlock:(AVArrayFilterBlock)block {
    if (!block) {
        return self;
    }

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }];

    return [self filteredArrayUsingPredicate:predicate];
}

@end
