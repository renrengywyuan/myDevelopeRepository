//
//  NSDictionary+HLDelNullValue.h
//  mybigbrother
//
//  Created by 郝靓 on 2021/8/16.
//  Copyright © 2018年 思能教育咨询(大连)有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HLDelNullValue)

+ (NSDictionary *)hl_delNullValue:(NSDictionary *)dic;

@end
