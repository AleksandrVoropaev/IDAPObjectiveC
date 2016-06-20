//
//  NSObject+AVAddObject.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/20/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSObject+AVAddObject.h"

@implementation NSObject (AVAddObject)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
