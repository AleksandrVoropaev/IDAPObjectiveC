//
//  AVCreature.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVCreature : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  weight;
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, readonly) NSArray     *children;

- (void)addChild:(AVCreature *)child;
- (void)removeChild:(AVCreature *)child;
- (void)sayHi;
- (void)makeChildrenSayHi;
- (void)performGenderSpecificOperation;

@end
