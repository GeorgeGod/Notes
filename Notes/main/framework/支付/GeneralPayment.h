//
//  GeneralPayment.h
//  InnoSpace
//
//  Created by admin on 2017/12/4.
//  Copyright © 2017年 zfd. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Enum.h"


/**
 支付参数
 */
@interface GeneralPaymentModel : NSObject
/*微信*/
@property (nonatomic, copy  ) NSString *AppId;
@property (nonatomic, copy  ) NSString *NonceStr;
@property (nonatomic, copy  ) NSString *Package;
@property (nonatomic, copy  ) NSString *PartnerId;
@property (nonatomic, copy  ) NSString *PrepayId;
@property (nonatomic, copy  ) NSString *Sign;
@property (nonatomic, copy  ) NSString *TimeStamp;

/*支付宝*/
@property (nonatomic, copy  ) NSString *alipayOrderInfo;
@property (nonatomic, copy  ) NSString *alipaysign;
@property (nonatomic, copy  ) NSString *prepayid;
@end





//支付宝和微信都要
static const NSString *GPOrderNum = @"GPOrderNum";//订单编号

//支付宝
static const NSString *GPOrderSub = @"GPOrderSub"; //订单名称

//微信
static const NSString *GPOrderBody = @"GPOrderBody"; //商品描述
static const NSString *GPOrderAttach = @"GPOrderAttach"; //附加数据
static const NSString *GPOrderTag = @"GPOrderTag"; //商品标记

/**
 通用支付接口
 */
@interface GeneralPayment : NSObject

+(void)payType:(TSPayType)type withParams:(NSDictionary *)params;

@end
