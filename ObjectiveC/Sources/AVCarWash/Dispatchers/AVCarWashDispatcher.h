//
//  AVCarWashDispatcher.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/19/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVCarWash.h"

@interface AVCarWashDispatcher : NSObject <AVEmployeeObserver>

- (instancetype)initWithCarWash:(AVCarWash *)carWash;
- (void)run;

@end
