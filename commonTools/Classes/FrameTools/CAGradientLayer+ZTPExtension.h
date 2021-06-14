//
//  CAGradientLayer+ZTPExtension.h
//  ZTPTools
//
//  Created by caiyanzhi on 2019/12/31.
//  Copyright © 2019 caiyanzhi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CAGradientDirectionHorizontal,  // 水平
    CAGradientDirectionVertical     // 垂直
} CAGradientDirection;

@interface CAGradientLayer (ZTPExtension)

+ (instancetype _Nonnull) graidentWithDirection:(CAGradientDirection) direction color:(NSArray<UIColor *> *_Nonnull) colors ;

@end
