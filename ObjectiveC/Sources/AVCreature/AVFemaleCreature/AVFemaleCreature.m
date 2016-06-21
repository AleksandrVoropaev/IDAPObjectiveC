//
//  AVFemaleCreature.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVFemaleCreature.h"

#import "NSObject+AVExtentions.h"

@implementation AVFemaleCreature

- (id)makeChild {
    AVCreature *child = [AVCreature object];
    [self addChild:child];
    NSLog(@"We have new one!");
    
    return child;
}

- (void)performGenderSpecificOperation {
    [self makeChild];
}

@end
