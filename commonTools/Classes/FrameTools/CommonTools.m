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




@end
