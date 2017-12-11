//
//  UIColor+Extension.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

// 默认alpha位1
+ (UIColor *)colorWithHexStr:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexStr:(NSString *)color alpha:(CGFloat)alpha;

//+ (UIColor *)randomColor;
@end

