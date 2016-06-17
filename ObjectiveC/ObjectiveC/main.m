//
//  main.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVCreatureTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AVCreatureTest *test = [[AVCreatureTest new] autorelease];
        [test startTest];
    }
    
    return 0;
}
