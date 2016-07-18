//
//  AVCar.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVMoney.h"
#import "AVObservableObject.h"

@class AVCar;

typedef NS_ENUM(NSUInteger, AVCarState) {
    AVCarIsClean,
    AVCarIsDirty
};

@protocol AVCarObserver <NSObject>

@optional
- (void)carDidBecomeClean:(AVCar *)car;
- (void)carDidBecomeDirty:(AVCar *)car;

@end

@interface AVCar : AVObservableObject <AVMoney>
@property (nonatomic, assign, getter=isClean) BOOL clean;

@end
