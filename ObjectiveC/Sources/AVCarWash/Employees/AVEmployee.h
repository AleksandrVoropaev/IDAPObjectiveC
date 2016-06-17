//
//  AVEmployee.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVCarWash.h"

@interface AVEmployee : NSObject
@property (nonatomic, assign) AVCarWash *firm;
@property (nonatomic, assign) NSUInteger salary;
@property (nonatomic, assign) NSUInteger yearsOfExperience;
@property (nonatomic, readonly) NSArray *duties;

- (void)addDuty:(NSString *)duty;

@end
