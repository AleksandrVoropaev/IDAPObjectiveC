//
//  AVGrandCentralDispatch.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/25/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVGrandCentralDispatch.h"

void AVDispachAsyncOnMainQueueWithBlock(void(^block)(void)) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void AVDispachSyncOnMainQueueWithBlock(void(^block)(void)) {
    dispatch_sync(dispatch_get_main_queue(), block);
}

void AVDispachAsyncOnGlobalQueueWithIdentifierAndBlock(long identifier, void(^block)(void)){
    dispatch_async(dispatch_get_global_queue(identifier, 0), block);
}

void AVDispachSyncOnGlobalQueueWithIdentifierAndBlock(long identifier, void(^block)(void)) {
    dispatch_sync(dispatch_get_global_queue(identifier, 0), block);
}

void AVDispachAsyncOnGlobalQueueHighPriorityWithBlock(void(^block)(void)) {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0), block);
}

void AVDispachSyncOnGlobalQueueHighPriorityWithBlock(void(^block)(void)) {
    dispatch_sync(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0), block);
}

void AVDispachAsyncOnGlobalQueueSecondPriorityWithBlock(void(^block)(void)) {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), block);
}

void AVDispachSyncOnGlobalQueueSecondPriorityWithBlock(void(^block)(void)) {
    dispatch_sync(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), block);
}

void AVDispachAsyncOnGlobalQueueLowPriorityWithBlock(void(^block)(void)) {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), block);
}

void AVDispachSyncOnGlobalQueueLowPriorityWithBlock(void(^block)(void)) {
    dispatch_sync(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), block);
}

void AVDispachAsyncOnGlobalQueueBackgroundPriorityWithBlock(void(^block)(void)) {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}

void AVDispachSyncOnGlobalQueueBackgroundPriorityWithBlock(void(^block)(void)) {
    dispatch_sync(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}
