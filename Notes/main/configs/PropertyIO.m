//
//  PropertyIO.m
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PropertyIO.h"

@implementation PropertyIO


//对项目的读写
+(NSArray *)readProjects {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"projects" ofType:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:path];
    return data;
}
+(void)writeProjects:(NSArray *)array {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"projects" ofType:@"plist"];
    [array writeToFile:path atomically:YES];
}

//对身体部位的读写
+(NSArray *)readParts {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"parts" ofType:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:path];
    return data;
}
+(void)writeParts:(NSArray *)array {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"parts" ofType:@"plist"];
    [array writeToFile:path atomically:YES];
}


+(NSArray *)readMainData {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *plistPath = [path stringByAppendingPathComponent:@"main.plist"];
    NSLog(@"Note: %@", plistPath);
    NSArray *data = [NSArray arrayWithContentsOfFile:plistPath];
    return data;
}
+(BOOL)writeMainData:(NSArray *)array {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *plistPath = [path stringByAppendingPathComponent:@"main.plist"];
    NSLog(@"Note: %@", plistPath);
    BOOL result = [array writeToFile:plistPath atomically:YES];
    NSLog(@"保存%@", result ? @"成功": @"失败");
    return result;
}

@end
