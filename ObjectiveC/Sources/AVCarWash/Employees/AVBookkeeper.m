//
//  AVBookkeeper.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVBookkeeper.h"

@implementation AVBookkeeper

- (void)processObject:(id)object {
    self.state = AVEmployeeIsBusy;

    [self takeMoneyFromObject:object];
    
    NSLog(@"I've counted money");

    self.state = AVEmployeeIsFree;
}

@end
