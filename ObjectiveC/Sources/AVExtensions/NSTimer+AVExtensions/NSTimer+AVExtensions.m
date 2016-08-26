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
    return [self timerWithTypeBlock:^NSTimer *(id timerDecorator) {
        return [self scheduledTimerWithTimeInterval:timeInterval
                                             target:timerDecorator
                                           selector:@selector(onTimer:)
                                           userInfo:nil
                                            repeats:repeats];

    } processBlock:block];
}

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval
                              repeats:(BOOL)repeats
                                block:(void (^)(void))block
{
    return [self timerWithTypeBlock:^NSTimer *(id timerDecorator) {
        return [self timerWithTimeInterval:timeInterval
                                    target:timerDecorator
                                  selector:@selector(onTimer:)
                                  userInfo:nil
                                   repeats:repeats];
    } processBlock:block];
}

+ (instancetype)timerWithTypeBlock:(NSTimer *(^)(id timerDecorator))timerBlock processBlock:(void(^)(void))processBlock {
    if (!timerBlock || !processBlock) {
        return nil;
    }
    
    id timerDecorator = [[[AVTimerBlockDecorator alloc] initWithBlock:processBlock] autorelease];
    __block NSTimer *timer = nil;
    timerBlock(timerDecorator);
    
    return timer;
}

@end
