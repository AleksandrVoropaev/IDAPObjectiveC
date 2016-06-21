//
//  AVMoney.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/21/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AVMoney <NSObject>
@property (nonatomic, assign) NSUInteger money;

@required
- (void)decreaseMoney:(NSUInteger)value;

@optional
- (void)increaseMoney:(NSUInteger)value;
- (void)takeMoneyFromObject:(id)object withValue:(NSUInteger)value;

@end