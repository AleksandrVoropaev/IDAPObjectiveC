//
//  NSMutableString+AVExtentions.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (AVExtensions)

+ (id)alphanumericAlphabet;
+ (id)numericAlphabet;
+ (id)lowercaseAlphabet;
+ (id)uppercaseAlphabet;
+ (id)letterAlphabet;

+ (id)alphabetWithUnicodeRange:(NSRange)range;

+ (id)randomString;
+ (id)randomStringWithLength:(NSUInteger)length;
+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
