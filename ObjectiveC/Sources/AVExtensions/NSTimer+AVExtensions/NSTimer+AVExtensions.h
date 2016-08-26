//
//  NSTimer+AVExtensions.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/24/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (AVExtensions)

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                       repeats:(BOOL)repeats
                                         block:(void (^)(void))block;

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval
                              repeats:(BOOL)repeats
                                block:(void (^)(void))block;

+ (instancetype)timerWithTypeBlock:(NSTimer *(^)(id timerDecorator))timerBlock processBlock:(void(^)(void))processBlock;

@end
