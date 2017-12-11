//
//  GVUserDefaults+Extension.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "GVUserDefaults+Extension.h"

@implementation GVUserDefaults (Extension)
@dynamic accessToken;

- (NSString *)transformKey:(NSString *)key {
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] uppercaseString]];
    return [NSString stringWithFormat:@"GVDefault%@", key];
}

@end
