//
//  main.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVCarWashDispatcher.h"

#import "NSObject+AVExtensions.h"

NSUInteger const kAVCarsCount = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AVCarWashDispatcher *carWashDispatcher = [AVCarWashDispatcher object];
        [carWashDispatcher start];
        
        [[NSRunLoop mainRunLoop] run];
    }
    
    return 0;
}
