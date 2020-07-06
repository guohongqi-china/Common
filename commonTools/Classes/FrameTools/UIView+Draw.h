//
//  UIView+Draw.h
//  commonTools
//
//  Created by guohongqi on 2020/6/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Draw)
/**
@description 绘制边框阴影
@param shadowColor 阴影颜色
@param shadowOffset 阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
@param shadowOpacity 阴影透明度，默认0
@param shadowRadius 阴影半径，默认3
@param bound 尺寸
@param cornerRadius 为0时代表没有圆角

*/
- (void)drawLayerShadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius cgBound:(CGRect)bound cornerRadius:(CGFloat)cornerRadius;

/**
  @description  系统方法绘制圆角
 */
- (void)layerCornerRadius:(CGFloat)cornerRadius;

/**
 注意：iOS9之后 通过cornerRadius、masksToBounds绘制圆角 在真机已经不再产生离屏渲染。 图像圆角
 @description 绘制图片圆角
 @param cornerRadius 圆角度
 @param corners 圆角方向
 @param imageView 绘制对象
*/
- (void)roundedCornerRadius:(CGFloat)cornerRadius corners:(UIRectCorner)corners imageView:(UIImageView *)imageView;
/**
 注意：iOS9之后 通过cornerRadius、masksToBounds绘制圆角 在真机已经不再产生离屏渲染。 图像圆角
 @description 绘制图片圆角
 @param rect 范围
 @param corner 圆角方向
 @param radii 圆角弧度
*/
- (void)roundedCornerRadius:(CGRect)rect  corner:(UIRectCorner)corner cornerRadii:(CGSize)radii;

@end

NS_ASSUME_NONNULL_END
