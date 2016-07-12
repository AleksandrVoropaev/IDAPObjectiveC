//
//  AVQueue.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/28/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVCar.h"

#import "NSObject+AVExtensions.h"

@interface AVQueue : NSMutableArray
@property (nonatomic, assign) NSUInteger count;

- (void)enqueueObject:(id)object;
- (AVCar *)dequeueObject;
//- (NSUInteger)count;

@end
