//
//  AVCar.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVCar.h"

@interface AVCar()
@property (nonatomic, assign, readwrite) NSUInteger money;

@end

@implementation AVCar

- (void)decreaseMoney:(NSUInteger)value {
    self.money -= value;
}

- (void)increaseMoney:(NSUInteger)value {
    self.money += value;
}

@end
