//
//  AVCreature.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVCreature.h"

@interface AVCreature()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation AVCreature

@dynamic children;

- (instancetype)init {
    self = [super init];
    self.mutableChildren = [NSMutableArray array];
    
    return self;
}

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

- (void)addChild:(AVCreature *)child {
    NSMutableArray *children = self.mutableChildren;
    if (![children containsObject:child]) {
        [children addObject:child];
    }
}

- (void)removeChild:(AVCreature *)child {
    [self.mutableChildren removeObject:child];
}

- (void)sayHi {
    NSLog(@"Hi!");
    [self makeChildrenSayHi];
}

- (void)makeChildrenSayHi {
    for (AVCreature *child in self.mutableChildren) {
        [child sayHi];
    }
}

- (void)performGenderSpecificOperation {
    
}

@end
