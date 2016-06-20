//
//  NSObject+AVMoney.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/20/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AVMoney)
@property (nonatomic, assign) NSUInteger money;

- (void)getMoneyFromObject:(NSObject *)object;

@end
