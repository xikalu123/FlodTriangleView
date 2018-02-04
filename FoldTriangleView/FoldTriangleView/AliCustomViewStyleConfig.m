//
//  AliCustomViewStyleConfig.m
//  AliBabaVIew
//
//  Created by 陈宇亮 on 2018/2/3.
//  Copyright © 2018年 陈宇亮. All rights reserved.
//

#import "AliCustomViewStyleConfig.h"
#import "AliUtil.h"

@implementation AliCustomViewStyleConfig

- (instancetype)initWithFilePath:(NSString *)filePath
{
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dic = @{};
    if (data) {
        dic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingAllowFragments
                                                              error:nil];
    }
    [self configWithDictionary:dic];
    
    return  self;
}

- (void)configWithDictionary:(NSDictionary *)dict
{
    CGFloat width =  [toString([dict objectForKey:@"width"]) doubleValue];
    CGFloat height = [toString([dict objectForKey:@"height"]) doubleValue];
    width =  width < 0.0f ? 200.0f : width;
    height =  height < 0.0f ? 100.0f : height;
    _viewSize = CGSizeMake(width, height);
    _viewBgColor = colorWithHexValue(toString([dict objectForKey:@"bgColor"]));
    _borderWidth = [toString([dict objectForKey:@"borderWidth"]) doubleValue];
    _borderWidth = _borderWidth < 0.0f ? 2.0f : _borderWidth;
    _borderColor = colorWithHexValue(toString([dict objectForKey:@"borderColor"]));
    _trianglePointX = [toString([dict objectForKey:@"trianglePointX"]) doubleValue];
    _trianglePointY = [toString([dict objectForKey:@"trianglePointY"]) doubleValue];
    _trianglePointX = [self positiveNumberWithNumber:_trianglePointX upperNumber:width];
    _trianglePointY = [self positiveNumberWithNumber:_trianglePointY upperNumber:height];
    _textString = toString([dict objectForKey:@"content"]);
}

- (CGFloat)positiveNumberWithNumber:(CGFloat )number
                        upperNumber:(CGFloat )upperNumber
{
    if (number < 0.0f) return 0.0f;
    else if (number > upperNumber) return upperNumber;
    else return number;
}

@end
