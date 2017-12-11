//
//  GeneralPayment.m
//  InnoSpace
//
//  Created by admin on 2017/12/4.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import "GeneralPayment.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
#import "HttpDataTool.h"
#import "MJExtension.h"

@implementation GeneralPaymentModel
@end


@implementation GeneralPayment

+(void)payType:(TSPayType)type withParams:(NSDictionary *)params {
    
    switch (type) {
        case TSPayTypeAliPay: { //支付宝支付
            [self requestAliPaySign:params];
            break;
        }
        case TSPayTypeWePay: { //微信支付
            [self requestWeChatPaySign:params];
        }
        default:
            break;
    }
}

+(void)requestAliPaySign:(NSDictionary *)params {
    //支付宝支付
    [HttpDataTool M2ServiceAlipay:params[GPOrderNum] subject:params[GPOrderSub] Success:^(id json) {
        
        if ([json[@"errcode"] intValue] == 0) {
            //支付参数获取正确
            [self sendAliPayWith:json];
        } else {
            NSLog(@"支付宝支付参数获取失败");
        }
    } failure:^(NSError *err) {
        NSLog(@"支付宝支付参数获取错误");
    }];
}

+(void)requestWeChatPaySign:(NSDictionary *)params {
    //微信支付
    [HttpDataTool M2ServiceWeChatpay:params[GPOrderNum] body:params[GPOrderBody] attach:params[GPOrderAttach] goods_tag:params[GPOrderTag] Success:^(id json) {
        
        if ([json[@"errcode"] intValue] == 0) {
            //微信支付参数获取正确
            [self sendWeChatPayWith:json];
        } else {
            NSLog(@"微信支付参数获取失败");
        }
    } failure:^(NSError *err) {
        NSLog(@"微信支付参数获取错误");
    }];
}


/**
 调起微信支付的支付界面

 @param json 微信支付的参数
 */
+(void)sendWeChatPayWith:(NSDictionary *)json {
//    GeneralPaymentModel* model = [GeneralPaymentModel new];
    NSDictionary *dic = json[@"signinfo"];
    
    GeneralPaymentModel* model = [GeneralPaymentModel mj_objectWithKeyValues:dic];
    
//    model.AppId = json[@"signinfo"][@"AppId"];
//    model.PartnerId = json[@"data"][@"partnerid"];
//    model.Package = json[@"data"][@"package"];
//    model.NonceStr = json[@"data"][@"noncestr"];
//    model.TimeStamp = json[@"data"][@"timestamp"];
//    model.Sign = json[@"data"][@"sign"];
//    model.PrepayId = json[@"data"][@"prepayid"];
    
    [WXApi registerApp:model.AppId];
    if (![WXApi isWXAppInstalled])
    {
        [DiaLogView showShakeType:ShakeTypeYes ZoomType:ZoomTypeNo Message:@"您未安装微信APP" complete:^(BOOL result) {
            [DiaLogView dismissDialogComplete:nil];
        }];
        
    }else{
        
        PayReq *request   = [[PayReq alloc] init];
        /*商家向财付通申请的商家id*/
        request.partnerId = model.PartnerId;
        /*预支付订单*/
        request.prepayId  = model.PrepayId;
        /*商家根据财付通文档填写的数据和签名*/
        request.package   = model.Package;
        /*随机串，防重发*/
        request.nonceStr  = model.NonceStr;
        /*时间戳，防重发*/
        request.timeStamp = [model.TimeStamp intValue];
        /*商家根据微信开放平台文档对数据做的签名*/
        request.sign      = model.Sign;
        [WXApi sendReq:request];
    }
}


/**
 调起支付宝支付的支付界面

 @param json 支付宝支付的相关参数
 */
+(void)sendAliPayWith:(NSDictionary *)json {
    //支付参数获取正确
    NSURL * aliAppScheme = [NSURL URLWithString:@"alipay:"];
    if (![[UIApplication sharedApplication] canOpenURL:aliAppScheme]) {
        
        [DiaLogView showShakeType:ShakeTypeYes ZoomType:ZoomTypeNo Message:@"您未安装支付宝APP" complete:^(BOOL result) {
            [DiaLogView dismissDialogComplete:nil];
        }];
        
    }else{
        
//        GeneralPaymentModel* model = [GeneralPaymentModel new];
//        /*支付宝订单详情*/
//        model.alipayOrderInfo = json[@"data"][@"alipayOrderInfo"];
//        /*支付白私钥签名*/
//        model.alipaysign = json[@"data"][@"alipaysign"];
//        model.prepayid = json[@"data"][@"prepayid"];
//
        NSString* appScheme = @"InnoSpace2";
//        NSString *orderSpec = model.alipayOrderInfo;
//        NSString *signedString = [self urlEncodedString:model.alipaysign];
        
        //将签名成功字符串格式化为订单字符串,请严格按照该格式
//        NSString *orderString = nil;
//        if (signedString != nil) {
        
//            orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
//                           orderSpec, signedString, @"RSA"];
//            NSLog(@"zhifubao init begin = %@",orderString);
        
            //orderString
            [[AlipaySDK defaultService] payOrder:json[@"data"] fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                
                NSString * msg =  @"支付没有成功";
                
                NSMutableDictionary * userInfo = [NSMutableDictionary dictionary];
                [userInfo setObject:@"AliPay" forKey:@"pay_type"];
                [userInfo setObject:@"fail" forKey:@"pay_result"];
                
                if ([resultDic[@"result"] length]) {
                    msg = @"支付成功";
                    [userInfo setObject:@"success" forKey:@"pay_result"];
                    
                    NSNotification *notification = [NSNotification notificationWithName:@"kAliPaySuccess" object:@"payResult" userInfo:@{@"payResult":@YES}];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
                }
            }];
//        }
    }
}

+(void)gotoAppStoreWithType:(TSPayType)type {
    NSString *url = @"";
    switch (type) {
        case TSPayTypeAliPay: {
            //支付宝
            url = @"itms-apps://itunes.apple.com/cn/app/支付宝-让生活更简单/id333206289?mt=8";
            break;
        }
        case TSPayTypeWePay: {
            //微信
            url = @"itms-apps://itunes.apple.com/cn/app/微信/id414478124?mt=8";
            break;
        }
        default:
            break;
    }
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]];
    if (canOpen) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}


#pragma mark - 获取支付宝签名进行UTF-8编码
+ (NSString*)urlEncodedString:(NSString *)string {
    NSString * encodedString = (__bridge_transfer  NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
    
    return encodedString;
}

@end
