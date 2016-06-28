//
//  NSObject+AVExtentions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/21/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSObject+AVExtensions.h"

@implementation NSObject (AVExtentions)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)arrayOfObjectsWithClass:(Class)cls quantity:(NSUInteger)quantity {
    NSMutableArray *arrayOfObjects = [NSMutableArray array];
    for (NSUInteger count = 0; count < quantity; count++) {
        NSObject *object = [cls object];
        [arrayOfObjects addObject:object];
    }
    
    return [[arrayOfObjects copy] autorelease];
}

@end
