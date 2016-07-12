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
#import "NSMutableString+AVExtensions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        AVCreatureTest *test = [[AVCreatureTest new] autorelease];
//        [test startTest];
        
        NSString *string = [NSMutableString randomString];
        NSLog(@"Your string is - \"%@\"\n\n", string);
        
        AVCarWash *testCarWash = [[AVCarWash new] autorelease];
        NSMutableArray *cars = [NSMutableArray array];
        AVCar *car = [AVCar object];
        
        for (NSUInteger index = 0; index < 9; index++) {
            [cars addObject:car];
        }
        
        [testCarWash enqueueCars:cars];
        [testCarWash washCar:car];
    }
    
    return 0;
}
