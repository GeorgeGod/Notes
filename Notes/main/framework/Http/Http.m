//
//  Http.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "Http.h"
#import "GVUserDefaults+Extension.h"

@implementation HttpParams
+(instancetype)HttpParams {
    HttpParams *params = [HttpParams new];
    return params;
}
@end



@implementation Http

+(void)getWithParams:(HttpParams *)params success:(successBlock)success failure:(failureBlock)failure {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOST, params.uri];
    
    NSMutableString *mutableUrl = [[NSMutableString alloc] initWithString:url];
    
    NSDictionary *parameters = params.headParams;
    if ([parameters allKeys]) {
        [mutableUrl appendString:@"?"];
        for (id key in parameters) {
            NSString *value = [[parameters objectForKey:key] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            [mutableUrl appendString:[NSString stringWithFormat:@"%@=%@&", key, value]];
        }
    }
    NSString *urlEnCode = [[mutableUrl substringToIndex:mutableUrl.length - 1] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlEnCode]];
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            failure(error);
        } else {
            if (!data) {
                success(nil);
            } else {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                success(dic);
            }
        }
    }];
    [dataTask resume];
}

+(void)postWithParams:(HttpParams *)params success:(successBlock)success failure:(failureBlock)failure {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOST, params.uri];
    
    //在请求URL中添加一个token
    if (GVUSERINFO.accessToken.length > 0) {
        url = [url stringByAppendingFormat:@"?token=%@", GVUSERINFO.accessToken];
    }
//    NSURL *nsurl = [NSURL URLWithString:url];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:nsurl];
    //如果想要设置网络超时的时间的话，可以使用下面的方法：
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    //设置请求类型
    request.HTTPMethod = @"POST";
    
    //把参数放到请求体内
    NSString *postStr = [Http parseParams:params.bodyParams];
    request.HTTPBody = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                //请求失败
                failure(error);
            });
        } else {
            //请求成功
            if (data == nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(nil);
                });
            } else {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                if ([dic[@"errcode"] intValue] == 0) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        success(dic);
                    });
                } else {
                    //可能token过期了
                    [Http getTokenThenRequest:params success:success failure:failure];
                }
//                NSString *msg = dic[@"Message"];
//                if ([dic[@"errcode"] intValue] == 40001 || [dic[@"errcode"] intValue] == 40002 || msg.length > 0) {
//                    //可能token过期了
//                    [Http getTokenThenRequest:params success:success failure:failure];
//                } else {
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        success(dic);
//                    });
//                }
            }
        }
    }];
    [dataTask resume];  //开始请求
}

//拼接参数
+ (NSString *)parseParams:(NSDictionary *)params {
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithDictionary:params];
    NSString *keyValueFormat;
    NSMutableString *result = [NSMutableString new];
    NSEnumerator *keyEnum = [parameters keyEnumerator];
    id key;
    while (key = [keyEnum nextObject]) {
        keyValueFormat = [NSString stringWithFormat:@"%@=%@&", key, [params valueForKey:key]];
        [result appendString:keyValueFormat];
    }
    return result;
}

//privite 测试获取token的接口是否可用
+ (void)getToken {
    HttpParams *params = [HttpParams new];
    params.uri = @"/api/auth/auth/token";
    params.bodyParams = @{@"username":@"admin", @"password":@"123456"};
    [Http postWithParams:params success:^(NSDictionary * _Nullable json) {
        
        if ([json[@"errcode"] intValue] == 0) {
            GVUSERINFO.accessToken = json[@"access_token"];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"---获取token出错了");
    }];
}

//获取token之后继续之前的网络请求
+ (void)getTokenThenRequest:(HttpParams *)req success:(successBlock)success failure:(failureBlock)failure {
    
    NSTimeInterval time1 = [[NSUserDefaults standardUserDefaults] doubleForKey:@"kRequestTime"];
    NSTimeInterval time2 = [[NSDate date] timeIntervalSince1970];
    [[NSUserDefaults standardUserDefaults] setDouble:time2 forKey:@"kRequestTime"];
    if (fabs(time1-time2) < 60) { //如果一分钟之内请求了两次token，就要断开请求，否则会陷入死循环
        NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:40001 userInfo:@{NSUnderlyingErrorKey:@"token请求过于频繁"}];
        failure(error);
        return;
    }
    
    HttpParams *params = [HttpParams new];
    params.uri = @"/api/auth/auth/token";
    params.bodyParams = @{@"username":@"admin", @"password":@"123456"};
    [Http postWithParams:params success:^(NSDictionary * _Nullable json) {
        
        if ([json[@"errcode"] intValue] == 0) {
            GVUSERINFO.accessToken = json[@"access_token"];
            [Http postWithParams:req success:success failure:failure];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"---获取token出错了");
    }];
}

@end
