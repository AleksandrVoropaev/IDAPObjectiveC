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

@implementation AVCreatureTest

- (void)startTest {
    AVMaleCreature *man = [[AVMaleCreature new] autorelease];
    man.gender = AVGenderMale;
    
    AVFemaleCreature *woman = [[AVFemaleCreature new] autorelease];
    woman.gender = AVGenderFemale;
    
    AVMaleCreature *boy = [woman makeChild];
    boy.gender = AVGenderMale;
    
    AVFemaleCreature *girl = [woman makeChild];
    girl.gender = AVGenderFemale;

    NSMutableArray *array = [[NSMutableArray new] autorelease];
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
