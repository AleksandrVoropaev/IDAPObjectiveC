//
//  NSMutableString+AVExtentions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSMutableString+AVExtensions.h"

#import "AVRandom.h"

static const NSUInteger kNSStringRandomStringDefaultLength = 30;

@implementation NSMutableString (AVExtensions)

//+ (id)stringWithLength:(NSUInteger)length {
//    NSMutableString *string = [NSMutableString stringWithCapacity:length];
//    for (NSUInteger index = 0; index < length; index++) {
//        [string appendFormat:@"%C", (unichar)(AVRandomWithRange('a', 'z'))];
//    }
//    
//    return [self stringWithString:string];
//}


+ (id)alphanumericAlphabet {
    NSMutableString *alphanumericAlphabet = [NSMutableString stringWithString:[self letterAlphabet]];
    [alphanumericAlphabet appendString:[self numericAlphabet]];
    
    return alphanumericAlphabet;
 }

+ (id)numericAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('0', 10)];
}

+ (id)lowercaseAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('a', 'z' - 'a')];
}

+ (id)uppercaseAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('A', 'Z' - 'A')];
}

+ (id)letterAlphabet {
    NSMutableString *letterAlphabet = [NSMutableString stringWithString:[self lowercaseAlphabet]];
    [letterAlphabet appendString:[self uppercaseAlphabet]];
    
    return letterAlphabet;
}


+ (id)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger count = range.location; count < range.location + range.length; count++) {
        [string appendFormat:@"%c", (unichar)(count)];
    }
    
    return [self stringWithString:string];
}


+ (id)randomString {
    return [self randomStringWithLength:arc4random_uniform(kNSStringRandomStringDefaultLength)];
}

+ (id)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    for (NSUInteger index = 0; index < length; index++) {
        [string appendFormat:@"%C", [alphabet characterAtIndex:(AVRandomWithValue((uint32_t)[alphabet length]))]];
    }

    return [self stringWithString:string];
}

@end
