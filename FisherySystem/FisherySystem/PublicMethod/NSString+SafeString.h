//
//  NSString+SafeString.h
//  SafeStringT
//
//  Created by Mr.吕 on 2018/3/9.
//  Copyright © 2018年 Mr.吕. All rights reserved.
//  空字符替换分类

#import <Foundation/Foundation.h>

@interface NSString (SafeString)

+ (NSString *)safe:(NSString *)str;

@end
