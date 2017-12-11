//
//  BaseMeNavigationController.m
//  InnoSpace
//
//  Created by admin on 2017/12/7.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import "BaseMeNavigationController.h"
#import "UIFont+Extension.h"

@interface BaseMeNavigationController ()

@end

@implementation BaseMeNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.navigationBar.tintColor = [UIColor whiteColor];
    //    // 改变导航栏的颜色
    //    [[UINavigationBar appearance] setBarTintColor:OrangeRedColor];
    //    // 用图片来显示NavigationBar
    //    //[[UINavigationBar appearance] setBackgroundImage:[[UIImage imageNamed:@"nav_bg"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forBarMetrics:UIBarMetricsDefault];
    //
    //    // 修改NavigationBar的字体颜色
    //    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.translucent = NO;
    navBar.barTintColor = [UIColor whiteColor];
//    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:colorWithRGB(0x030303), NSFontAttributeName:[UIFont RegularFont:17]}];
//    [navBar setShadowImage:[UIImage imageWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.25]]];
}

- (void)setNavBarItemTheme
{
    //返回按钮
//    UIImage *backImg = [UIImage imageNamed:@"icon_返回"];
    //    [[UIBarButtonItem appearance]setBackButtonBackgroundImage:[backImg resizableImageWithCapInsets:UIEdgeInsetsMake(0, backImg.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //    [[UIBarButtonItem appearance]setBackButtonBackgroundImage:backImg  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //
    //    [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(-1000, 0) forBarMetrics:UIBarMetricsDefault];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if(self.viewControllers.count > 0) {
//        self.tabBarController.viewDeckController.panningMode = IIViewDeckNoPanning;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    if (self.viewControllers.count == 2) {
        
//        self.tabBarController.viewDeckController.panningMode = IIViewDeckAllViewsPanning;
    }
    return [super popViewControllerAnimated:animated];
}


/**
 设置导航控制器的根控制器
 
 @param rootViewController 根控制器
 @return 导航控制器对象
 */
+(instancetype)RootViewCtrl:(UIViewController *)rootViewController {
    if (!rootViewController) {
        NSLog(@"导航控制器的根控制器不能为空！");
        rootViewController = [UIViewController new];
    }
    BaseMeNavigationController *navigationCtrl = [[BaseMeNavigationController alloc] initWithRootViewController:rootViewController];
    return navigationCtrl;
}


@end
