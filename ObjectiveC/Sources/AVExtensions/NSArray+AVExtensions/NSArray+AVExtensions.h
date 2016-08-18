//
//  NSArray+AVExtensions.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^AVArrayFilterBlock)(id object);

@interface NSArray (AVExtensions)

+ (NSArray *)arrayWithCount:(NSUInteger)count usingBlock:(id(^)(void))objectsParameters;

- (NSArray *)filteredArrayUsingBlock:(AVArrayFilterBlock)block;

@end
