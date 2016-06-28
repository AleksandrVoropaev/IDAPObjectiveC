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
        NSString *string = [NSMutableString generateStringWithLength:5];
        NSLog(@"Your string is - \"%@\"", string);
//        AVCar *car = [[AVCar new] autorelease];
//        AVCarWash *testCarWash = [[AVCarWash new] autorelease];
//        [testCarWash addCarToQueue:car];
//        [testCarWash washCar:[testCarWash firstCarInQueue]];
    }
    
    return 0;
}
