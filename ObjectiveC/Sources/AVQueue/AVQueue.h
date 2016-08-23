//
//  AVQueue.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/28/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVQueue : NSObject
@property (nonatomic, readonly) NSUInteger count;

- (void)enqueueObject:(id)object;
- (id)dequeueObject;

@end
