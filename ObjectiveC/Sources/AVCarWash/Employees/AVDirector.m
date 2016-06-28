//
//  AVDirector.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVDirector.h"

@implementation AVDirector

- (void)processObject:(id)object {
    [self takeMoneyFromObject:object];
    
    NSLog(@"I've earned money");
}

@end
