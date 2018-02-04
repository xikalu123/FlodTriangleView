//
//  AliCustomViewStyleConfig.h
//  AliBabaVIew
//
//  Created by 陈宇亮 on 2018/2/3.
//  Copyright © 2018年 陈宇亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AliCustomViewStyleConfig : NSObject

@property (nonatomic, assign) CGSize viewSize;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat trianglePointX; 
@property (nonatomic, assign) CGFloat trianglePointY;
@property (nonatomic, strong) UIColor *viewBgColor;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, copy)   NSString *textString;

- (instancetype)initWithFilePath:(NSString *)filePath;

@end
