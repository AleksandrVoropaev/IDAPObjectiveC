//
//  AVObjectWithBlock.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/24/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVObjectWithBlock.h"

@interface AVObjectWithBlock ()
@property (nonatomic, assign)   AVProcedureBlock    procedureBlock;

@end

@implementation AVObjectWithBlock

- (instancetype)initWithBlock:(AVProcedureBlock)block {
    self = [super init];
    
    if (self) {
        self.procedureBlock = block;
    }
    
    return self;
}

- (void)execute {
    self.procedureBlock();
}

@end
