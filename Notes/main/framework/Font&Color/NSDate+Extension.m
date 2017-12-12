//
//  NSDate+Extension.m
//  InnoSpace
//
//  Created by admin on 2017/12/8.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)



//计算时间差 eg: 2小时
+(NSString *)date2Duration:(NSDate *)from to:(NSDate *)to {
    //两个时间间隔
    NSTimeInterval timeInterval = fabs([from timeIntervalSinceDate:to]);
    
    NSString *txt;
    
    long temp = (long)((timeInterval+0.5)/60);
    NSInteger hour = temp/60;
    NSInteger min = temp%60;
    if (hour==0 && min > 0) {
        txt = [NSString stringWithFormat:@"%ld分钟", min];
    } else if (hour > 0 && min == 0) {
        txt = [NSString stringWithFormat:@"%ld小时", hour];
    } else if (hour > 0 && min > 0) {
        txt = [NSString stringWithFormat:@"%ld小时%ld分钟", hour, min];
    } else {
        txt = @"时间貌似不对啊";
    }
    return txt;
}
//计算时间间隔 eg:9:00-10:00
+(NSString *)date2Interval:(NSDate *)from to:(NSDate *)to {
    NSString *begin = [self date2Hour:from];
    NSString *end = [self date2Hour:to];
    return [NSString stringWithFormat:@"%@-%@",begin, end];
}
+(NSString *)date2YearMonthDay:(NSDate *)date {
    NSDateFormatter *formatter = [self dateFormatter:@"yyyy年MM月dd日"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}
+(NSString *)date2MonthDay:(NSDate *)date {
    NSDateFormatter *formatter = [self dateFormatter:@"MM月dd日"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}
+(NSString *)date2Day:(NSDate *)date {
    NSDateFormatter *formatter = [self dateFormatter:@"dd日"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+(NSString *)date2Hour:(NSDate *)date {
    NSDateFormatter *formatter = [self dateFormatter:@"HH:mm"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+(NSString *)date2MonthDayHourMin:(NSDate *)date {
    NSDateFormatter *formatter = [self dateFormatter:@"MM月dd日 HH:mm"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

//private
+(NSDateFormatter *)dateFormatter:(NSString *)formatterStr {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:formatterStr];
    return formatter;
}




























+(instancetype)transformDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [self worldTimeToChinaTime:[dateFormatter dateFromString:date]];
}

//将世界时间转化为中国区时间
+ (NSDate *)worldTimeToChinaTime:(NSDate *)date {
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:interval];
    return localeDate;
}

//根据生日计算年龄
-(NSString *)getAge {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    
    NSDate *nowDate = [NSDate date];
    
    //生日
    NSDate *birthDay = self;
    
    //用来得到详细的时差
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *date = [calendar components:unitFlags fromDate:birthDay toDate:nowDate options:0];
    
    
    if ([date year] > 0) {
        return [NSString stringWithFormat:@"%ld岁", [date year]];
    } else {
        return @"0岁";
    }
}


- (NSString *)getConstellation {
    
    NSDate *birthDay = self;

    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"MM"];
    NSInteger month = [[formatter stringFromDate:birthDay] intValue];
    
    [formatter setDateFormat:@"dd"];
    NSInteger day = [[formatter stringFromDate:birthDay] intValue];
    
    NSString * astroString = @"摩羯座水瓶座双鱼座白羊座金牛座双子座巨蟹座狮子座处女座天秤座天蝎座射手座摩羯座";
    NSString * astroFormat = @"102123444543";
    NSString * result;
    
    result = [NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(month*3-(day < [[astroFormat substringWithRange:NSMakeRange((month-1), 1)] intValue] - (-19))*3, 3)]];
    
    return result;
}

@end
