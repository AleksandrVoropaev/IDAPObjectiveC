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

- (void)washCar;

@end
