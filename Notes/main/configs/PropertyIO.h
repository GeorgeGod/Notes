//
//  PropertyIO.h
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyIO : NSObject

//对项目的读写
+(NSArray *)readProjects;
+(void)writeProjects:(NSArray *)array;

//对身体部位的读写
+(NSArray *)readParts;
+(void)writeParts:(NSArray *)array;


+(NSArray *)readMainData;
+(BOOL)writeMainData:(NSArray *)array;
@end
