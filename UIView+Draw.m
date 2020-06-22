//
//  UIView+Draw.m
//  commonTools
//
//  Created by guohongqi on 2020/6/22.
//

#import "UIView+Draw.h"

@implementation UIView (Draw)

- (void)drawLayerShadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius cgBound:(CGRect)bound cornerRadius:(CGFloat)cornerRadius
{
    if (cornerRadius != 0) {
        self.layer.cornerRadius = cornerRadius;
    }
    self.layer.shadowColor = shadowColor.CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = shadowOffset;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = shadowOpacity;//阴影透明度，默认0
    self.layer.shadowRadius = shadowRadius;//阴影半径，默认3
    [self.layer setShadowPath:[UIBezierPath bezierPathWithRect:bound].CGPath];
}

- (void)layerCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    // 设置一些属性，增加绘制效率
    // 设置缓存  设置此属性 会导致离屏渲染
//    view.layer.shouldRasterize = true;
    // 设置抗锯齿边缘
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    // 内容缩放比
    self.layer.contentsScale =  [UIScreen mainScreen].scale;
}

- (void)roundedCornerRadius:(CGFloat)cornerRadius corners:(UIRectCorner)corners imageView:(UIImageView *)imageView
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

@end
