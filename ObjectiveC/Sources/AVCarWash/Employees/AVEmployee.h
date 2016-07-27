//
//  AVEmployee.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVMoney.h"
#import "AVObservableObject.h"
#import "AVQueue.h"

#import "NSObject+AVExtensions.h"

@class AVEmployee;

typedef NS_ENUM(NSInteger, AVEmployeeState) {
    AVEmployeeIsFree,
    AVEmployeeIsBusy,
    AVEmployeeIsPending
};

@protocol AVEmployeeObserver <NSObject>

@optional
- (void)employeeDidBecomeFree:(AVEmployee *)emplloyee;
- (void)employeeDidBecomeBusy:(AVEmployee *)emplloyee;

@end

@interface AVEmployee : AVObservableObject <AVMoney, AVEmployeeObserver>
@property (nonatomic, assign)                   NSUInteger  salary;
@property (nonatomic, assign)                   NSUInteger  yearsOfExperience;
@property (nonatomic, assign, getter=isFree)    BOOL        free;

- (void)performWorkWhithObject:(id)object;
- (void)processObject:(id)object;
- (void)finishProcessing;

@end
