//
//  UIFont+Extension.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

//苹方-简 常规体
+(instancetype)RegularFont:(float)size {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

//苹方-简 极细体
+(instancetype)UltraLightFont:(float)size {
    return [UIFont fontWithName:@"PingFangSC-Ultralight" size:size];
}

//苹方-简 细体
+(instancetype)LightFont:(float)size {
    return [UIFont fontWithName:@"PingFangSC-Light" size:size];
}

//苹方-简 纤细体
+(instancetype)ThinFont:(float)size {
    return [UIFont fontWithName:@"PingFangSC-Thin" size:size];
}

//苹方-简 中黑体
+(instancetype)MediumFont:(float)size {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

//苹方-简 中粗体
+(instancetype)SemiboldFont:(float)size {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}
@end
