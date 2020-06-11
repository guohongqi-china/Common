//
//  Exacttime.m
//  定时器
//
//  Created by guohongqi on 2020/5/28.
//  Copyright © 2020 guohongqi. All rights reserved.
//

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
} while (0)

#import "Exacttime.h"

@interface Exacttime()

@property (nonatomic, strong) dispatch_source_t   timer;
@property (nonatomic, assign) BOOL                isSuspend; //定时器挂起状态

@end
@implementation Exacttime

+ (Exacttime *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector repeats:(BOOL)yesOrNo{
     return [[Exacttime alloc] initWith:interval target:aTarget selector:aSelector repeats:yesOrNo];
}

- (instancetype)initWith:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector repeats:(BOOL)yesOrNo{
    if (self = [super init]) {
        _isSuspend = YES;
        __weak typeof(aTarget) weakTarget = aTarget;
        uint64_t interval1 = (uint64_t)(interval * NSEC_PER_SEC);
        dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC));
        dispatch_source_set_timer(self.timer, start, interval1, 0);
        dispatch_source_set_event_handler(self.timer, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                SuppressPerformSelectorLeakWarning(
                    [weakTarget performSelector:aSelector];
                );
            });
        });
    }
    return self;
}

- (dispatch_source_t)timer
{
    if (!_timer) {
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    }
    return _timer;
}

- (void)startRecordTime{
    if (self.isSuspend) {
        dispatch_resume(self.timer);
        _isSuspend = NO;
    }
}

- (void)endRecordTime{
    if (!self.isSuspend) {
        dispatch_suspend(self.timer);
        _isSuspend = YES;
    }

}

- (void)destroyTime{
    if (_timer) {
        if (_isSuspend) {
            dispatch_resume(_timer);
        }
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

- (void)dealloc{
    NSLog(@"定时器释放");
}


@end
