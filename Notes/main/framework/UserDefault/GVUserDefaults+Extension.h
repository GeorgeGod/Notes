//
//  GVUserDefaults+Extension.h
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

//#import <GVUserDefaults/GVUserDefaults.h>
#import "GVUserDefaults.h"
#define GVUSERINFO [GVUserDefaults standardUserDefaults]

@interface GVUserDefaults (Extension)

@property (nonatomic, copy  ) NSString *accessToken;  //登录token
@property (nonatomic, copy  ) NSString *deviceToken; //设备token
@property (nonatomic, copy  ) NSString *username; //用户名
@property (nonatomic, copy  ) NSString *memberId; //会员ID
@property (nonatomic, copy  ) NSString *mobile;  //手机号

@end
