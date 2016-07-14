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

+ (instancetype)alphanumericAlphabet {
    NSMutableString *alphanumericAlphabet = [NSMutableString stringWithString:[self letterAlphabet]];
    [alphanumericAlphabet appendString:[self numericAlphabet]];
    
    return [self stringWithString: alphanumericAlphabet];
 }

+ (instancetype)numericAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('0', 10)];
}

+ (instancetype)lowercaseAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('a', 'z' - 'a')];
}

+ (instancetype)uppercaseAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('A', 'Z' - 'A')];
}

+ (instancetype)letterAlphabet {
    NSMutableString *letterAlphabet = [NSMutableString stringWithString:[self lowercaseAlphabet]];
    [letterAlphabet appendString:[self uppercaseAlphabet]];
    
    return [self stringWithString: letterAlphabet];
}


+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger count = range.location; count < range.location + range.length; count++) {
        [string appendFormat:@"%c", (unichar)(count)];
    }
    
    return [self stringWithString:string];
}


+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(kNSStringRandomStringDefaultLength)];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    for (NSUInteger index = 0; index < length; index++) {
        [string appendFormat:@"%C", [alphabet characterAtIndex:(AVRandomWithValue((uint32_t)[alphabet length]))]];
    }

    return [self stringWithString:string];
}

- (NSArray *)symbols {
    NSMutableArray *symbols = [NSMutableArray arrayWithCapacity:[self length]];
    for (NSUInteger index = 0; index < [self length]; index++) {
        [symbols addObject:[NSString stringWithFormat:@"%c", [self characterAtIndex:index]]];
    }
    
    return [[symbols copy] autorelease];
}

@end
