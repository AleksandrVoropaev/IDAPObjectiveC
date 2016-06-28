//
//  NSMutableString+AVExtentions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSMutableString+AVExtensions.h"

@implementation NSMutableString (AVExtensions)

+ (NSString*)generateStringWithLength:(NSUInteger)length {
    NSMutableString* string = [NSMutableString stringWithCapacity:length];
    for (NSUInteger index = 0; index < length; index++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}

@end
