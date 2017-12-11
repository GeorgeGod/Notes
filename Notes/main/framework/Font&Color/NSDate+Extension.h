//
//  NSDate+Extension.h
//  InnoSpace
//
//  Created by admin on 2017/12/8.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+(instancetype)transformDate:(NSString *)date;

-(NSString *)getAge;

- (NSString *)getConstellation;

@end
