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
- (void)enqueueObject:(id)object;
- (AVCar *)dequeueObject;

@end
