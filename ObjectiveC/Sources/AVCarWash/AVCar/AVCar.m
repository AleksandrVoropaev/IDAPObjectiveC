//
//  AVCar.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVCar.h"

@implementation AVCar

@synthesize money = _money;

- (void)decreaseMoney:(NSUInteger)value {
    self.money -= value;
}

@end
