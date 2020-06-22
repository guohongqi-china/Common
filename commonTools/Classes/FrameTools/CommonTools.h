//
//  CommonTools.h
//  xcodeConfiguration
//
//  Created by guohongqi on 2020/5/29.
//  Copyright © 2020 guohongqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface CommonTools : NSObject

/**
  @description 对象判空
 */
+ (BOOL)objectIsNull:(id)string;

#pragma mark -  UIKit 相关处理
/**
 注意：iOS9之后 通过cornerRadius、masksToBounds绘制圆角 在真机已经不再产生离屏渲染。
 @description 绘制图片圆角
 @param cornerRadius 圆角度
 @param corners 圆角方向
 @param imageView 绘制对象
*/
+ (void)roundedCornerRadius:(CGFloat)cornerRadius corners:(UIRectCorner)corners imageView:(UIImageView *)imageView;
/**
  @description  系统方法绘制圆角
 */
+ (void)layerCornerRadius:(CGFloat)cornerRadius view:(UIView *)view;



@end

NS_ASSUME_NONNULL_END
