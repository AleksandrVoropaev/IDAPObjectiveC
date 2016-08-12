//
//  AVDirector.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVDirector.h"

#import "AVBookkeeper.h"

@implementation AVDirector

- (void)performWorkWithObject:(id)object {
    @synchronized (self) {
        [self takeMoneyFromObject:object];
        NSUInteger performedObjectsCount = ++self.performedObjectsCount;

        NSLog(@"Director %@ earned money %lu times. I's %lu now!", self, performedObjectsCount, self.money);
    }
}

- (void)finishProcessingObject:(AVEmployee *)employee {
    employee.state = AVEmployeeFree;
    self.state = AVEmployeeFree;
}

- (void)finishProcessing {
    self.state = AVEmployeeFree;
}

@end
