//
//  AVBookkeeper.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/17/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVEmployee.h"
#import "AVDirector.h"

@interface AVBookkeeper : AVEmployee

- (void)countMoneyForDirector:(AVDirector *)director;

@end
