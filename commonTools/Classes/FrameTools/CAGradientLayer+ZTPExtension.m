//
//  CAGradientLayer+ZTPExtension.m
//  ZTPTools
//
//  Created by caiyanzhi on 2019/12/31.
//  Copyright © 2019 caiyanzhi. All rights reserved.
//

#import "CAGradientLayer+ZTPExtension.h"

@implementation CAGradientLayer (ZTPExtension)

+ (instancetype _Nonnull) graidentWithDirection:(CAGradientDirection) direction color:(NSArray *_Nonnull) colors {
    if (!colors) {
        return nil ;
    }
    
    NSMutableArray *cgColors = @[].mutableCopy ;
    for (UIColor *color in colors) {
         [cgColors addObject:(id)color.CGColor] ;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer] ;
    gradientLayer.colors = cgColors ;
    
    if (direction == CAGradientDirectionVertical) {
        gradientLayer.startPoint = CGPointMake(0, 0) ;
        gradientLayer.endPoint = CGPointMake(0, 1) ;
    } else {
        gradientLayer.startPoint = CGPointMake(0, 0) ;
        gradientLayer.endPoint = CGPointMake(1, 0) ;
    }
    
    
    return gradientLayer ;
}


@end
