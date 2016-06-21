//
//  AVCreatureTest.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/16/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVCreatureTest.h"

#import "AVCreature.h"
#import "AVFemaleCreature.h"
#import "AVMaleCreature.h"

#import "NSObject+AVExtentions.h"

@implementation AVCreatureTest

- (void)startTest {    
    AVMaleCreature *man = [AVMaleCreature object];

    AVFemaleCreature *woman = [AVFemaleCreature object];
    
    AVMaleCreature *boy = [woman makeChild];
    
    AVFemaleCreature *girl = [woman makeChild];

    NSMutableArray *array = [NSMutableArray array];
    [array addObject:man];
    [array addObject:woman];
    [array addObject:boy];
    [array addObject:girl];
    
    for (AVCreature *creature in array) {
        [creature performGenderSpecificOperation];
    }
    
    [man addChild:boy];
    [man addChild:girl];

    [man sayHi];
    NSLog(@"\n");
    [woman sayHi];
}

@end
