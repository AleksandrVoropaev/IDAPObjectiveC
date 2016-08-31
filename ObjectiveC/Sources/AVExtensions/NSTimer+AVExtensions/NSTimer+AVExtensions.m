//
//  NSTimer+AVExtensions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/24/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSTimer+AVExtensions.h"

#import "AVTimerBlockDecorator.h"

@implementation NSTimer (AVExtensions)

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                       repeats:(BOOL)repeats
                                         block:(void (^)(void))block
{
    NSTimer *timer = [self timerWithTimeInterval:timeInterval repeats:repeats block:block];
    if (!timer) {
        return nil;
    }
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    return timer;
}

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval
                              repeats:(BOOL)repeats
                                block:(void (^)(void))block
{
    if (!block) {
        return nil;
    }
    
    id timerDecorator = [[[AVTimerBlockDecorator alloc] initWithBlock:block] autorelease];

    return [self timerWithTimeInterval:timeInterval
                                target:timerDecorator
                              selector:@selector(onTimer:)
                              userInfo:nil
                               repeats:repeats];
}

@end
