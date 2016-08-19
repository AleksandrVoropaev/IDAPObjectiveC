//
//  AVEmployeesDispatcher.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/11/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployee.h"

@interface AVEmployeesDispatcher : NSObject <AVEmployeeObserver>
@property (nonatomic, readonly) NSArray *employees;

- (void)addEmployee:(AVEmployee *)employee;
- (void)addEmployees:(NSArray *)employees;
- (void)removeEmployee:(AVEmployee *)employee;
- (void)removeEmployees:(NSArray *)employees;

- (void)processObject:(id)object;

@end
