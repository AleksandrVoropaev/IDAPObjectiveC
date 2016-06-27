//
//  NSMutableString+AVExtentions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSMutableString+AVExtentions.h"

@implementation NSMutableString (AVExtentions)

- (instancetype)init {
    self = [super init];
    //    self.length = 20;
    for (NSUInteger index = 0; index < 20; index++) {
        [self appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
        [self appendFormat:@"%C", (unichar)('а' + arc4random_uniform(33))];
    }
         
    return self;
}
         
@end
