//
//  AVEmployee.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployee.h"

@interface AVEmployee()
@property (nonatomic, assign) NSUInteger money;

@end

@implementation AVEmployee

@synthesize money = _money;

- (void)increaseMoney:(NSUInteger)value {
    self.money += value;
}

- (void)decreaseMoney:(NSUInteger)value {
    self.money -= value;
}

- (void)takeMoneyFromObject:(id)object withValue:(NSUInteger)value {
    [object decreaseMoney:value];
    [self increaseMoney:value];
}

@end
