//
//  Exacttime.h
//  定时器
//
//  Created by guohongqi on 2020/5/28.
//  Copyright © 2020 guohongqi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Exacttime : NSObject

+ (Exacttime *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector repeats:(BOOL)yesOrNo;

- (void)startRecordTime;
- (void)endRecordTime;
// 退出的时候一定要销毁
- (void)destroyTime;

@end

NS_ASSUME_NONNULL_END
