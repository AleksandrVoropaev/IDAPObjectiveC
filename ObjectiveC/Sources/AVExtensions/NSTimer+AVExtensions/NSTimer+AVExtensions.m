//
//  NSTimer+AVExtensions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/24/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSTimer+AVExtensions.h"

#import "AVObjectWithBlock.h"

@implementation NSTimer (AVExtensions)

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                       repeats:(BOOL)repeats
                                         block:(void (^)(void))block
{
    if (!block) {
        return nil;
    }
    
    id objectWithBlock = [[[AVObjectWithBlock alloc] initWithBlock:block] autorelease];
    
    return [self scheduledTimerWithTimeInterval:timeInterval
                                         target:objectWithBlock
                                       selector:@selector(execute)
                                       userInfo:nil
                                        repeats:repeats];
}

@end
