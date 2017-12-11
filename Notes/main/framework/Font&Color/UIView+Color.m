//
//  UIView+Color.m
//  InnoSpace
//
//  Created by 虞嘉伟 on 2017/12/4.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import "UIView+Color.h"
#import "UIColor+Extension.h"

@implementation UIView (Color)

+(instancetype)ViewWithColor:(NSString *)color {
    UIView *colorV = [UIView new];
    colorV.backgroundColor = [UIColor colorWithHexStr:color];
    return colorV;
}

@end
