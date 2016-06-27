//
//  AVBookkeeper.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVBookkeeper.h"

@implementation AVBookkeeper

- (void)processObject:(id)object withValue:(NSUInteger)value {
    [object decreaseMoney:value];
    [self increaseMoney:value];
    
    NSLog(@"I've counted to %lu", value);
}

@end
