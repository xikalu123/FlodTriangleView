//
//  AliUtil.m
//  AliBabaVIew
//
//  Created by 陈宇亮 on 2018/2/3.
//  Copyright © 2018年 陈宇亮. All rights reserved.
//

#import "AliUtil.h"

@implementation AliUtil

UIColor *colorWithHexValue(NSString* value)
{
    if ([value length] < 6) {
        return [UIColor blackColor];
    }
    NSString *tempString = [value lowercaseString];
    if ([tempString hasPrefix:@"0x"]) {
        tempString = [tempString substringFromIndex:2];
    } else if ([tempString hasPrefix:@"#"]) {
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] != 6) {
        return [UIColor blackColor];
    }
    NSRange range = NSMakeRange(0, 2);
    NSString *rString = [tempString substringWithRange:range];
    range.location = 2;
    NSString *gString = [tempString substringWithRange:range];
    range.location = 4;
    NSString *bString = [tempString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:1.0f];
}

NSString *toString(id x)
{
    if ([x isKindOfClass:[NSString class]])  return x;
    
    else if (!x || [x isKindOfClass:[NSNull class]]) return @"";
    
    else if ([x isKindOfClass:[NSNumber class]])
    {
        NSNumber *str = x;
        return [str stringValue];
    }
    
    return [x description];
}

@end
