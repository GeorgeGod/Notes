//
//  Http.h
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlockCallBack.h"
#define HOST @"http://tangshuo2017.idea-source.net"

@interface HttpParams : NSObject
@property (nonatomic, copy  ) NSString *uri;
@property (nonatomic, strong) NSDictionary *headParams;
@property (nonatomic, strong) NSDictionary *bodyParams;
@end


@interface Http : NSObject

+(void)getWithParams:(HttpParams *)params success:(successBlock)success failure:(failureBlock)failure;
+(void)postWithParams:(HttpParams *)params success:(successBlock)success failure:(failureBlock)failure;

//+ (void)getToken;
@end
