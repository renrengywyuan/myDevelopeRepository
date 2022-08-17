//
//  HXDate.m
//  比较日期大小
//
//  Created by apple on 2020/4/26.
//  Copyright © 2020 Mr.吕. All rights reserved.
//  日期相关方法

#import "HXDate.h"

@implementation HXDate
// 增加天数计算
+ (NSDate *)jsDateFromBeginDate:(NSDate *)beginDate todays:(int)days
{
    NSDate *dateTemp = [[NSDate alloc]init];
    NSTimeInterval interval = 24*60*60*days;
    dateTemp = [dateTemp initWithTimeInterval:interval sinceDate:beginDate];
    return dateTemp;
}

// 增加小时数数计算
+ (NSDate *)jsDateFromBeginDateHour:(NSDate *)beginDateHours hours:(int)hours
{
    NSDate *dateTemp = [[NSDate alloc]init];
    NSTimeInterval interval = 60*60*hours;
    dateTemp = [dateTemp initWithTimeInterval:interval sinceDate:beginDateHours];
    
    return dateTemp;
}

// 增加分钟数数计算
+ (NSDate *)jsDateFromBeginDateMinute:(NSDate *)beginDateMinute minute:(int)minute
{
    NSDate *dateTemp = [[NSDate alloc]init];
    NSTimeInterval interval = 60*minute;
    dateTemp = [dateTemp initWithTimeInterval:interval sinceDate:beginDateMinute];
    
    return dateTemp;
}

//获取当前的时间
+ (NSString*)getCurrentTimesNew
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    //将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
//    NSLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
}

//获取当前的时间
+ (NSString*)getCurrentTimes
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datenow = [NSDate date];
    //将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
//    NSLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
}

////获取当前的时间
//+ (NSString*)getCurrentTimes
//{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    //设置时间格式,hh与HH的区别:分别表示12小时制,24小时制
//    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//    NSDate *datenow = [NSDate date];
//    //将nsdate按formatter格式转成nsstring
//    NSString *currentTimeString = [formatter stringFromDate:datenow];
////    NSLog(@"currentTimeString =  %@",currentTimeString);
//
//    return currentTimeString;
//}

//获取当前的时间"年或月或日"
+ (NSString*)getCurrentTimesTag:(NSString *)timeTag
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:timeTag];
    NSDate *datenow = [NSDate date];
    //将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}


//date01 当前时间
//date02 返回时间
+ (int)compareDate:(NSString*)date01 withDate:(NSString*)date02
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dt1 = [[NSDate alloc]init];
    NSDate *dt2 = [[NSDate alloc]init];
    dt1 = [df dateFromString:date01];
    dt2 = [df dateFromString:date02];
    
    NSComparisonResult result = [dt1 compare:dt2];
    
    if (result == NSOrderedDescending) {
        NSLog(@"Date1  is in the future");
        //当前时间大于返回时间
        return 1;
        
    }else if (result == NSOrderedAscending){
        NSLog(@"Date1 is in the past");
        //当前时间小于返回时间
        return -1;
    }
        NSLog(@"Both dates are the same");
        //完全相等
        return 0;
}

+ (int)jy_compareDate:(NSString*)date01 withDate:(NSString*)date02
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *dt1 = [[NSDate alloc]init];
    NSDate *dt2 = [[NSDate alloc]init];
    dt1 = [df dateFromString:date01];
    dt2 = [df dateFromString:date02];
    
    NSComparisonResult result = [dt1 compare:dt2];
    
    if (result == NSOrderedDescending) {
        NSLog(@"Date1  is in the future");
        //当前时间大于返回时间
        return 1;
        
    }else if (result == NSOrderedAscending){
        NSLog(@"Date1 is in the past");
        //当前时间小于返回时间
        return -1;
    }
        NSLog(@"Both dates are the same");
        //完全相等
        return 0;
}


+ (NSString *)time_timestampToString:(NSInteger)timestamp{

    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];

    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];

     [dateFormat setDateFormat:@"yyyy.MM.dd"];

    NSString* string=[dateFormat stringFromDate:confromTimesp];

    return string;

}
+ (NSString *)time_timestampToStringLine:(NSInteger)timestamp{

    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];

    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];

     [dateFormat setDateFormat:@"yyyy-MM-dd"];

    NSString* string=[dateFormat stringFromDate:confromTimesp];

    return string;

}
+(NSDate *)xh_dateWithFormat_yyyy_MM_dd_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}
// 中间不分隔
+ (NSString *)timestampToString:(NSInteger)timestamp{

    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];

    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];

     [dateFormat setDateFormat:@"yyyyMMdd"];

    NSString* string=[dateFormat stringFromDate:confromTimesp];

    return string;

}

// 字符串转时间
+(NSDate *)nsstringConversionNSDate:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datestr = [dateFormatter dateFromString:dateStr];
    return datestr;
}
// 时间转时间戳
+(NSString *)dateConversionTimeStamp:(NSDate *)date
{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]*1000];
    return timeSp;
}
// 时间戳转字符串
+(NSString *)timeStampConversionNSString:(NSString *)timeStamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
             
}

@end

/**
 NSString *str1 = @"2020-03-09";
 // 时间转化为时间戳
 NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
 [dateFormatter1 setDateFormat:@"YYYY-MM-dd"]; //设定时间的格式
 NSDate *tempDate = [dateFormatter1 dateFromString:str1];//将字符串转换为时间对象
 NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]];//字符串转成时间戳
 NSLog(@"时间戳 = %@",timeStr);
 NSLog(@"时间串: %@",[HXDate time_timestampToString:[timeStr integerValue]]);
 */
