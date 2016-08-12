//
//  AVCarWash.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVCar.h"
#import "AVEmployee.h"

@interface AVCarWash : NSObject <AVEmployeeObserver>

- (void)washCar:(AVCar *)car;

@end
