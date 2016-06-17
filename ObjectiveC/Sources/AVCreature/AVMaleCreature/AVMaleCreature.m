//
//  AVMaleCreature.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVMaleCreature.h"

@implementation AVMaleCreature

- (void)makeWar {
    NSLog(@"I'm %@! Let's make some WAR!", self.name);
}

- (void)performGenderSpecificOperation {
    self.makeWar;
}

@end
