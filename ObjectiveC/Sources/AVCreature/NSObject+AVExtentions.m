//
//  NSObject+AVExtentions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/21/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSObject+AVExtentions.h"

@implementation NSObject (AVExtentions)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
