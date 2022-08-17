//
//  NSString+hlToJsonString.h
//  mybigbrother
//
//  Created by 郝靓 on 2021/8/17.
//  Copyright © 2018年 思能教育咨询(大连)有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (hlToJsonString)

+ (NSString *)dictionaryToJSONString:(NSDictionary *)dictionary;
+ (NSString *)arrayToJSONString:(NSArray *)array;

@end
