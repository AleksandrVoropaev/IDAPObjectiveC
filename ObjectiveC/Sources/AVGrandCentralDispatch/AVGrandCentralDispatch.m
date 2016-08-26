//
//  AVGrandCentralDispatch.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/25/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVGrandCentralDispatch.h"

dispatch_queue_t AVDispatchQueueWithPriority(AVDispatchQueuePriorityType type) {
    return dispatch_get_global_queue(type, 0);
}

void AVDispatchAsyncBlockOnMainQueue(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

void AVDispatchSyncBlockOnMainQueue(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueuePriorityType type, void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(AVDispatchQueueWithPriority(type), block);
}

void AVDispatchSyncBlockOnQueueWithType(AVDispatchQueuePriorityType type, void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_sync(AVDispatchQueueWithPriority(type), block);
}

void AVDispatchAsyncBlockOnQueueWithHighPriority(void(^block)(void)) {
    AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueueHighPriority, block);
}

void AVDispatchSyncBlockOnQueueWithHighPriority(void(^block)(void)) {
    AVDispatchSyncBlockOnQueueWithType(AVDispatchQueueHighPriority, block);
}

void AVDispatchAsyncBlockOnQueueWithSecondPriority(void(^block)(void)) {
    AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueueSecondPriority, block);
}

void AVDispatchSyncBlockOnQueueWithSecondPriority(void(^block)(void)) {
    AVDispatchSyncBlockOnQueueWithType(AVDispatchQueueSecondPriority, block);
}

void AVDispatchAsyncBlockOnQueueWithLowPriority(void(^block)(void)) {
    AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueueLowPriority, block);
}

void AVDispatchSyncBlockOnQueueWithLowPriority(void(^block)(void)) {
    AVDispatchSyncBlockOnQueueWithType(AVDispatchQueueLowPriority, block);
}

void AVDispatchAsyncBlockOnQueueWithBackgroundPriority(void(^block)(void)) {
    AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueueBackgroundPriority, block);
}

void AVDispatchSyncBlockOnQueueWithBackgroundPriority(void(^block)(void)) {
    AVDispatchSyncBlockOnQueueWithType(AVDispatchQueueBackgroundPriority, block);
}
