//
//  NSMutableString+AVExtentions.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (AVExtensions)

+ (instancetype)alphanumericAlphabet;
+ (instancetype)numericAlphabet;
+ (instancetype)lowercaseAlphabet;
+ (instancetype)uppercaseAlphabet;
+ (instancetype)letterAlphabet;

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;

+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

- (NSArray *)symbols;

@end
