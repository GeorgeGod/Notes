//
//  NSDate+Extension.h
//  InnoSpace
//
//  Created by admin on 2017/12/8.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

//计算时间差 eg: 2小时
+(NSString *)date2Duration:(NSDate *)from to:(NSDate *)to;
//计算时间间隔 eg:9:00-10:00
+(NSString *)date2Interval:(NSDate *)from to:(NSDate *)to;
+(NSString *)date2YearMonthDay:(NSDate *)date;
+(NSString *)date2MonthDay:(NSDate *)date;
+(NSString *)date2Day:(NSDate *)date;
+(NSString *)date2Hour:(NSDate *)date;

+(NSString *)date2MonthDayHourMin:(NSDate *)date;

/*
 * 下面不需要了
 */
+(instancetype)transformDate:(NSString *)date;

-(NSString *)getAge;

- (NSString *)getConstellation;

@end
