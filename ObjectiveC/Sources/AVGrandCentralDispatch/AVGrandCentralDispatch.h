//
//  AVGrandCentralDispatch.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/25/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

typedef enum {
    AVDispatchQueueHighPriority = QOS_CLASS_USER_INTERACTIVE,
    AVDispatchQueueSecondPriority = QOS_CLASS_USER_INITIATED,
    AVDispatchQueueLowPriority = QOS_CLASS_UTILITY,
    AVDispatchQueueBackgroundPriority = QOS_CLASS_BACKGROUND,
} AVDispatchQueuePriorityType;

dispatch_queue_t AVDispatchQueueWithPriority(AVDispatchQueuePriorityType type);

void AVDispatchAsyncBlockOnMainQueue(void(^block)(void));
void AVDispatchSyncBlockOnMainQueue(void(^block)(void));

void AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueuePriorityType type, void(^block)(void));
void AVDispatchSyncBlockOnQueueWithType(AVDispatchQueuePriorityType type, void(^block)(void));

void AVDispatchAsyncBlockOnQueueWithHighPriority(void(^block)(void));
void AVDispatchSyncBlockOnQueueWithHighPriority(void(^block)(void));

void AVDispatchAsyncBlockOnQueueWithSecondPriority(void(^block)(void));
void AVDispatchSyncBlockOnQueueWithSecondPriority(void(^block)(void));

void AVDispatchAsyncBlockOnQueueWithLowPriority(void(^block)(void));
void AVDispatchSyncBlockOnQueueWithLowPriority(void(^block)(void));

void AVDispatchAsyncBlockOnQueueWithBackgroundPriority(void(^block)(void));
void AVDispatchSyncBlockOnQueueWithBackgroundPriority(void(^block)(void));
