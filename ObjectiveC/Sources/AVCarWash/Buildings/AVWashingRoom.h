//
//  AVWashingRoom.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/20/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVRoom.h"

@interface AVWashingRoom : AVRoom
@property (nonatomic, readonly) NSArray *cars;

- (void)addCar:(NSObject *)object;

@end
