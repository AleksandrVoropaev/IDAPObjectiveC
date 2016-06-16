//
//  AVFemaleCreature.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVFemaleCreature.h"

@implementation AVFemaleCreature

//- (AVCreature *)makeChild {
//    AVCreature *child = [AVCreature new];
//    [self addChild:child];
//    NSLog(@"We have new one!");
//    return child;
//}
- (AVCreature *)makeChild {
    AVCreature *child = [AVCreature new];
    [self addChild:child];
    NSLog(@"We have new one!");
    return child;
}

@end
