//
//  AliUtil.h
//  AliBabaVIew
//
//  Created by 陈宇亮 on 2018/2/3.
//  Copyright © 2018年 陈宇亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AliUtil : NSObject


#ifdef __cplusplus
extern "C"{
#endif

UIColor *colorWithHexValue(NSString* value);
NSString *toString(id x);

#ifdef __cplusplus
}
#endif
@end
