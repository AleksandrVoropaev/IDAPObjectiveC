//
//  AVCar.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVMoney.h"

@interface AVCar : NSObject <AVMoney>
@property (nonatomic, assign, getter=isClean) BOOL clean;

@end
