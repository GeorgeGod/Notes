//
//  NSNumber+Extension.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/3.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

//#import "UIAppearance.h"
#import <UIKit/UIKit.h>

@implementation NSNumber (Extension)

float scale(float x) {
    float width = [UIScreen mainScreen].bounds.size.width;
    float s = width/375.0;
    return x*s;
}

@end
