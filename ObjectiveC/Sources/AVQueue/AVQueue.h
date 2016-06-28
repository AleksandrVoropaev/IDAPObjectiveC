//
//  AVQueue.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/28/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+AVExtensions.h"

@interface AVQueue : NSObject
@property (nonatomic, readonly) NSArray *queue;

- (void)enqueueObject:(id)object;
- (void)dequeueObject:(id)object;
- (id)getFirstObjectInQueue;

@end
