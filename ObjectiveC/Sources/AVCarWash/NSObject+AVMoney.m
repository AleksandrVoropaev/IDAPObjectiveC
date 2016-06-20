//
//  NSObject+AVMoney.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/20/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSObject+AVMoney.h"

@implementation NSObject (AVMoney)

- (void)getMoneyFromObject:(NSObject *)object {
    object.money -= 100;
    self.money += 100;
}

@end
