//
//  BaseMeNavigationController.h
//  InnoSpace
//
//  Created by admin on 2017/12/7.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseMeNavigationController : UINavigationController

/**
 设置导航控制器的根控制器
 
 @param rootViewController 根控制器
 @return 导航控制器对象
 */
+(instancetype)RootViewCtrl:(UIViewController *)rootViewController;

@end
