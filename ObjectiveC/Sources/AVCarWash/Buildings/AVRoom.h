//
//  AVRoom.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVEmployee.h"

@interface AVRoom : NSObject
@property (nonatomic, readonly) NSArray *employees;
@property (nonatomic, assign) NSUInteger maxEmployeesNumber;

- (void)addEmployee:(NSObject *)employee;
- (void)removeEmployee:(NSObject *)employee;
- (NSArray *)employees;
- (void)addEmployees:(NSArray *)employees;

@end
