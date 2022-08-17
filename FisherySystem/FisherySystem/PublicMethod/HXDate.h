//
//  HXDate.h
//  比较日期大小
//
//  Created by apple on 2020/4/26.
//  Copyright © 2020 Mr.吕. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXDate : NSObject
+ (NSString*)getCurrentTimesNew;
// 获取当前时间
+ (NSString*)getCurrentTimes;
// 增加天数处理
+ (NSDate *)jsDateFromBeginDate:(NSDate *)beginDate todays:(int)days;
// 增加小时数数计算
+ (NSDate *)jsDateFromBeginDateHour:(NSDate *)beginDateHours hours:(int)hours;
// 增加分钟数数计算
+ (NSDate *)jsDateFromBeginDateMinute:(NSDate *)beginDateMinute minute:(int)minute;
// date01 当前时间 ,  date02 返回时间
+ (int)compareDate:(NSString*)date01 withDate:(NSString*)date02;
//时间戳转化为字符转
+ (NSString *)time_timestampToString:(NSInteger)timestamp;
//时间戳转化为字符转 - 中间不带分隔开线
+ (NSString *)timestampToString:(NSInteger)timestamp;
+ (NSString *)time_timestampToStringLine:(NSInteger)timestamp;
// 字符串转时间
+(NSDate *)nsstringConversionNSDate:(NSString *)dateStr;
// 时间转时间戳
+(NSString *)dateConversionTimeStamp:(NSDate *)date;
// 时间戳转字符串
+(NSString *)timeStampConversionNSString:(NSString *)timeStamp;
//获取当前的时间"年或月或日"
+ (NSString*)getCurrentTimesTag:(NSString *)timeTag;

//+ (int)compareDate:(NSString*)date1 withDate:(NSString*)date2;

+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

// date01 当前时间 ,  date02 返回时间
+ (int)jy_compareDate:(NSString*)date01 withDate:(NSString*)date02;
@end

NS_ASSUME_NONNULL_END
