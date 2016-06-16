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
    AVMaleCreature *man = [AVMaleCreature new];
    [man setGender:AVGenderMale];
    AVFemaleCreature *woman = [AVFemaleCreature new];
    [woman setGender:AVGenderFemale];
    AVMaleCreature *boy = (AVMaleCreature *)[woman makeChild];
    [boy setGender:AVGenderMale];
    AVFemaleCreature *girl = (AVFemaleCreature *)[woman makeChild];
    [girl setGender:AVGenderFemale];

    NSMutableArray *array = [NSMutableArray new];
    [array addObject:man];
    [array addObject:woman];
    [array addObject:boy];
    [array addObject:girl];
    
//    for (AVCreature *creature in array) {
//        if (AVMaleCreature == creature.gender) {
//            [(AVMaleCreature *)creature makeWar];
//        }
//    }
    
    [man addChild:boy];
    [man addChild:girl];
    NSLog(@" %@ ", man.children);
    [man sayHi];
    [woman sayHi];
}

@end
