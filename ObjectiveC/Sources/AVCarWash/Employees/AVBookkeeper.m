//
//  AVBookkeeper.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVBookkeeper.h"
#import "AVWasher.h"

@implementation AVBookkeeper

- (void)performWorkWithObject:(AVWasher *)washer {
    [self takeMoneyFromObject:washer];
    
    NSLog(@"Bookkeeper %@ counted money @%lu times", self, self.performedObjectsCount);
}

@end
