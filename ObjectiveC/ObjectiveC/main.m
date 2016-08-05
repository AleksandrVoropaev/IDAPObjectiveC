//
//  main.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVCreatureTest.h"
#import "AVCarWash.h"

#import "NSString+AVExtensions.h"
#import "NSObject+AVExtensions.h"

NSUInteger const kAVCarsCount = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        AVCreatureTest *test = [[AVCreatureTest new] autorelease];
//        [test startTest];
        
//        NSMutableString *string = [NSMutableString alphanumericAlphabet];
//        NSLog(@"Your string is - \"%@\"\n\n", string);
//        string = [NSMutableString numericAlphabet];
//        NSLog(@"Your string is - \"%@\"\n\n", string);
//        string = [NSMutableString lowercaseAlphabet];
//        NSLog(@"Your string is - \"%@\"\n\n", string);
//        string = [NSMutableString uppercaseAlphabet];
//        NSLog(@"Your string is - \"%@\"\n\n", string);
//        string = [NSMutableString alphabetWithUnicodeRange:NSMakeRange('!', '@'-'!'+1)];
//        NSLog(@"Your string is - \"%@\"\n\n", string);
//        string = [NSMutableString randomString];
//        NSLog(@"Your string is - \"%@\"\n\n", string);
//        string = [NSMutableString randomStringWithLength:10];
//        NSLog(@"Your string is - \"%@\"\n\n", string);
//        string = [NSMutableString randomStringWithLength:5 alphabet:string];
//        NSLog(@"Your string is - \"%@\"\n\n", string);
        
        AVCarWash *testCarWash = [AVCarWash object];
        for (NSUInteger index = 0; index < kAVCarsCount; index++) {
            NSLog(@"\n\n number of run is - %lu \n", (unsigned long)index);
            [testCarWash washCar:[AVCar object]];
        }
    }
    
    [[NSRunLoop mainRunLoop] run];
    
    return 0;
}
