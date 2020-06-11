//
//  CommonTools.m
//  xcodeConfiguration
//
//  Created by guohongqi on 2020/5/29.
//  Copyright © 2020 guohongqi. All rights reserved.
//

#import "CommonTools.h"

@implementation CommonTools
// 空返回YES
+ (BOOL)objectIsNull:(id)string
{
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [string isEqual:@"<null>"] || [string isEqual:@"(null)"])
    {
        return YES;
        
        
    }
    else if([string isKindOfClass:[NSString class]] && [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0)
    {
        return YES;

    }
    else
    {
        
        return NO;
    }
}

+ (void)roundedCornerRadius:(CGFloat)cornerRadius corners:(UIRectCorner)corners imageView:(UIImageView *)imageView
{
    CGSize drawRectsize = imageView.frame.size;
    CGRect rect = CGRectMake(0, 0, drawRectsize.width, drawRectsize.height);
    UIGraphicsBeginImageContextWithOptions(drawRectsize, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [imageView.image drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageView.image = newImage;
}

+ (void)layerCornerRadius:(CGFloat)cornerRadius view:(UIView *)view
{
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    // 设置一些属性，增加绘制效率
    // 设置缓存  设置此属性 会导致离屏渲染
//    view.layer.shouldRasterize = true;
    // 设置抗锯齿边缘
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
    // 内容缩放比
    view.layer.contentsScale =  [UIScreen mainScreen].scale;
}

+ (void)drawLayerShadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius view:(UIView *)view
{
    view.layer.shadowColor = shadowColor.CGColor;//shadowColor阴影颜色
    view.layer.shadowOffset = shadowOffset;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    view.layer.shadowOpacity = shadowOpacity;//阴影透明度，默认0
    view.layer.shadowRadius = shadowRadius;//阴影半径，默认3
    [view.layer setShadowPath:[UIBezierPath bezierPathWithRect:view.bounds].CGPath];
}



@end
