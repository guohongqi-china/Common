//
//  ProConfig.h
//  定时器
//
//  Created by guohongqi on 2020/5/28.
//  Copyright © 2020 guohongqi. All rights reserved.
//

#ifndef ProConfig_h
#define ProConfig_h

#ifdef DEBUG
   #define NSLog(...) NSLog(__VA_ARGS__)
   #define debugMethod() NSLog(@"%s", __func__)
#else
   #define NSLog(...)
   #define debugMethod()
#endif

#pragma mark -  header.h
#import "ProConfig.h"
#import "CommonTools.h"
#import "CAGradientLayer+ZTPExtension.h"
#import "UIView+Draw.h"

#pragma mark -  commonDefine
// 常用高度宽度宏
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height
#define SCIsIPhoneX (ZTPTScreenH == 896 || ZTPTScreenH == 812)
#define SCAreaH (ZTPTIsIPhoneX ? 34 : 0)                          // 底部安全区域
#define SCStatusBarH (ZTPTIsIPhoneX ? 44 : 20)                    // 顶部状态栏
#define SCNavigationH (44 + SCStatusBarH)                         // 导航栏高度

// 常用宏
#define SCWeek(type) __weak typeof(type)w_##type = type;

// 安全获取主线程
#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)\
if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(dispatch_get_main_queue())) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif

// 通知
#define NotificationCenter  [NSNotificationCenter defaultCenter]

#define PostNotification(__signal__,__object__) \
[NotificationCenter postNotificationName:__signal__ object:__object__]

#define PostNotificationInfo(__signal__,__object__,__info__) \
[NotificationCenter postNotificationName:__signal__ object:__object__ userInfo:__info__];

#define RegistNotification(__sigNal__,__function__) \
[NotificationCenter addObserver:self selector:@selector(__function__) name:__sigNal__ object:nil]

// 对象判空
#define Objc_isNull(__obj__) [CommonTools objectIsNull:__obj__]


// 颜色
#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]


#define ssRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ssRGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]



#endif /* ProConfig_h */
