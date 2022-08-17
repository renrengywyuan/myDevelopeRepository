//
//  NSString+hlToJsonString.m
//  mybigbrother
//
//  Created by 郝靓 on 2021/8/17.
//  Copyright © 2018年 思能教育咨询(大连)有限公司. All rights reserved.
//

#import "NSString+hlToJsonString.h"

@implementation NSString (hlToJsonString)

+ (NSString *)dictionaryToJSONString:(NSDictionary *)dictionary

{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    return jsonString;
}


+ (NSString *)arrayToJSONString:(NSArray *)array
{
    
    NSError *error = nil;
//    NSMutableArray *muArray = [NSMutableArray array];
//    for (NSString *userId in array) {
//        [muArray addObject:[NSString stringWithFormat:@"\"%@\"", userId]];
//    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *jsonTemp1 = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *jsonResult  = [jsonTemp1 stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
//    NSLog(@"json array is: %@", jsonResult);
    return jsonResult;
}

@end
