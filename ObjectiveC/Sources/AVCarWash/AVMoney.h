//
//  AVMoney.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/21/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AVMoney <NSObject>
@property (nonatomic, readonly) NSUInteger money;

- (void)decreaseMoney:(NSUInteger)value;
- (void)increaseMoney:(NSUInteger)value;

@optional
- (void)takeMoneyFromObject:(id)object withValue:(NSUInteger)value;

@end
