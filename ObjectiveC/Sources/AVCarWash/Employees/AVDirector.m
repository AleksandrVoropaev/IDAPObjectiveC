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
    [self takeMoneyFromObject:object];

    NSLog(@"Director %@ earned money %lu times. I's %lu now!", self, self.performedObjectsCount, self.money);
}

- (void)finishProcessingObject:(AVEmployee *)employee {
    employee.state = AVEmployeeFree;
}

- (void)finishProcessing {
    self.state = AVEmployeeFree;
}

@end
