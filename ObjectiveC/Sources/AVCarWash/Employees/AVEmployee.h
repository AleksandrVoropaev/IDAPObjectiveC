//
//  AVEmployee.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVMoney.h"

@interface AVEmployee : NSObject <AVMoney>
@property (nonatomic, assign)                   NSUInteger  salary;
@property (nonatomic, assign)                   NSUInteger  yearsOfExperience;
@property (nonatomic, assign, getter=isFree)    BOOL        free;

- (void)processObject:(id)object;

@end
