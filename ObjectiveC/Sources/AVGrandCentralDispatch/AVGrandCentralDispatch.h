//
//  AVGrandCentralDispatch.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/25/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

void AVDispachAsyncOnMainQueueWithBlock(void(^block)(void));
void AVDispachSyncOnMainQueueWithBlock(void(^block)(void));

void AVDispachAsyncOnGlobalQueueWithIdentifierAndBlock(long identifier, void(^block)(void));
void AVDispachSyncOnGlobalQueueWithIdentifierAndBlock(long identifier, void(^block)(void));

void AVDispachAsyncOnGlobalQueueHighPriorityWithBlock(void(^block)(void));
void AVDispachSyncOnGlobalQueueHighPriorityWithBlock(void(^block)(void));

void AVDispachAsyncOnGlobalQueueSecondPriorityWithBlock(void(^block)(void));
void AVDispachSyncOnGlobalQueueSecondPriorityWithBlock(void(^block)(void));

void AVDispachAsyncOnGlobalQueueLowPriorityWithBlock(void(^block)(void));
void AVDispachSyncOnGlobalQueueLowPriorityWithBlock(void(^block)(void));

void AVDispachAsyncOnGlobalQueueBackgroundPriorityWithBlock(void(^block)(void));
void AVDispachSyncOnGlobalQueueBackgroundPriorityWithBlock(void(^block)(void));
