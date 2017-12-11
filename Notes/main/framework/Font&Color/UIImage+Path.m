//
//  UIImage+Path.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "UIImage+Path.h"

@implementation UIImage (Path)

+(UIImage *)load:(NSString *)name {
    
    if (![name hasSuffix:@".png"]) {
        //portrait@3x.png
        name = [NSString stringWithFormat:@"%@@%dx.png", name, (int)[UIScreen mainScreen].scale];
    }
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"MineResources" ofType:@"bundle"];
    
    bundlePath = [bundlePath stringByAppendingPathComponent:@"images"];
    
    NSString *imgPath= [bundlePath stringByAppendingPathComponent:name];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imgPath];
    
    return image;
}

@end
