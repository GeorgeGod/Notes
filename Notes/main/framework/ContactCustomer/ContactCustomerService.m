//
//  ContactCustomerService.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "ContactCustomerService.h"

@implementation ContactCustomerService

+(void)ContactCustomerService {
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"021-61485266"];
    UIWebView *callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [[UIApplication sharedApplication].keyWindow addSubview:callWebview];
}

@end
