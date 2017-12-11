//
//  Enum.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#ifndef Enum_h
#define Enum_h

typedef NS_ENUM(NSInteger, TSPayType) {
    TSPayTypeAliPay         = 1, //支付宝支付
    TSPayTypeWePay          = 2, //微信支付
    TSPayTypeUnionPay       = 3, //银联支付
    TSPayTypeTransferPay    = 4, //转账支付
};

typedef NS_ENUM(NSInteger, TSMemberCenterType) {
    TSMemberCenterTypeVIP       = 1, //vip
    TSMemberCenterTypeMaker     = 2, //maker
    TSMemberCenterTypeBox       = 3, //储物箱
};

typedef NS_ENUM(NSInteger, BindType) {
    BindTypePhone = 0,  //绑定手机号
    BindTypeEmail = 1,  //绑定邮箱
};

#endif /* Enum_h */
