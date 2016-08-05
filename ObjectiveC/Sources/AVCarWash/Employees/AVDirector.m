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
        
        NSLog(@"I've earned money");
    }
}

- (void)finishProcessing {
    self.state = AVEmployeeFree;
}

@end
