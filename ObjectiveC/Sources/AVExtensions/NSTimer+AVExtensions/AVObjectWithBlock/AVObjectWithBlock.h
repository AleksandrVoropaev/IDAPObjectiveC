//
//  AVObjectWithBlock.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/24/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AVProcedureBlock)(void);

@interface AVObjectWithBlock : NSObject

- (void)execute;
- (instancetype)initWithBlock:(AVProcedureBlock)block;

@end
