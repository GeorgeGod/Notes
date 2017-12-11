//
//  RequestTest.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "RequestTest.h"
#import "Http.h"

@implementation RequestTest

+(void)requestTest {
    
    /*
    HttpParams *para = [HttpParams new];
    para.uri = @"/api/app/meeting/getarea";
    para.bodyParams = @{@"Type":@(0)};
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
    } failure:^(NSError * _Nullable error) {
        
        NSLog(@"bbb");
    }];
     */
    
    
//    //登录
//    HttpParams *para = [HttpParams new];
//    para.uri = @"/api/app/members/login";
//
//    NSString *uuid = [RequestTest getUUID];
//    if (uuid == nil) {
//        uuid = @"";
//    }
//    para.bodyParams = @{
//                        @"Mobile":@"15201834213",
//                        @"Password":@"123123",
//                        @"UuId":uuid,
//                        @"DeviceToken":@"",
//                        };
//
//    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
//
//        NSLog(@"aaa=%@", (NSDictionary *)json);
//
//        USERINFO.memberId = [NSString stringWithFormat:@"%@", json[@"memberid"]]; //96080158
//        USERINFO.username = json[@"name"]; //The
//        USERINFO.mobile = json[@"mobile"];
//
//    } failure:^(NSError * _Nullable error) {
//        NSLog(@"bbb");
//    }];
    
    
    
    //9.6
//    HttpParams *para = [HttpParams new];
//    para.uri = @"/api/app/buyvip/list";
//    
//    NSString *memberId = USERINFO.memberId;
//    if (memberId==nil) {
//        memberId = @"";
//    }
//    para.bodyParams = @{@"IdentityId":memberId}; //会员ID
//
//    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
//
//
//        NSArray<MemberCenterStatusModel *> *dataArray = [MemberCenterStatusModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
//
//        NSLog(@"aaa=%@", (NSDictionary *)json);
//    } failure:^(NSError * _Nullable error) {
//        NSLog(@"bbb");
//    }];
    
    
    //9.7
    HttpParams *para = [HttpParams new];
    para.uri = @"/api/app/buyvip/getprice";
    para.bodyParams = @{@"typeId":@(1)}; //1：VIP会员，2：InnoMaker会员，3：InnoMaker储物箱
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
    } failure:^(NSError * _Nullable error) {
        NSLog(@"bbb");
    }];
    
    /*
    //9.8
    para = [HttpParams new];
    para.uri = @"/api/app/buyvip/add";
    para.bodyParams = @{@"typeId":@(0), //1：VIP会员，2：InnoMaker会员，3：InnoMaker储物箱
                        @"IdentityId":@(0), //会员ID
                        @"priceId":@(0), //价格id
                        @"payType":@(1),//1：支付宝，2：微信支付
                        };
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
    } failure:^(NSError * _Nullable error) {
        NSLog(@"bbb");
    }];
     
     */
}


+(NSString*)getUUID
{
    static NSString *stringUUID = nil;
    
    if(!stringUUID){
        // UserDefaultから読みこんで、なかったら生成
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        NSLog(@"read UUID = %@", stringUUID);
        stringUUID = [ud stringForKey:@"uuid"];
        
        if(!stringUUID || [stringUUID isEqualToString:@""])
        {
            CFUUIDRef uuidObj = CFUUIDCreate(nil);
            stringUUID =CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
            CFRelease(uuidObj);
            
            // 書き込む
            NSLog(@"write UUID = %@", stringUUID);
            [ud setObject:stringUUID forKey:@"uuid"];
        }
    }
    
    NSLog(@"UUID = %@", stringUUID);
    return stringUUID;
}

@end
