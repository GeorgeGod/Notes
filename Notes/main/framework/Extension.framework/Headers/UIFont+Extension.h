//
//  UIFont+Extension.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)

//苹方-简 常规体
+(instancetype)RegularFont:(float)size;

//苹方-简 极细体
+(instancetype)UltraLightFont:(float)size;

//苹方-简 细体
+(instancetype)LightFont:(float)size;

//苹方-简 纤细体
+(instancetype)ThinFont:(float)size;

//苹方-简 中黑体
+(instancetype)MediumFont:(float)size;

//苹方-简 中粗体
+(instancetype)SemiboldFont:(float)size;
@end
