//
//  AVObservableObject.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVAlphabet.h"

@interface AVObservableObject : AVAlphabet
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observerSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObservedByObject:(id)observer;

//This method is intended for subclassing. Newer call it directly!
- (SEL)selectorForState:(NSUInteger)state;

@end
