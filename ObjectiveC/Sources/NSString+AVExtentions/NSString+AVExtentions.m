//
//  NSString+AVExtentions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSString+AVExtentions.h"

@implementation NSString (AVExtentions)

- (instancetype)init {
    self = [super init];
//    self.length = 20;
    for (NSUInteger index = 0; index < 20; index++) {
        [self appendformat (char *)('а' + arc4random() * 33);
    }
    
    return self;
}

@end
