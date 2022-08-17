//
//  WYSaveTool.h
//
//  Created by apple on 2020/11/18.
//  Copyright © 2020 Mr.吕. All rights reserved.
//  本地存储相关方法

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYSaveTool : NSObject
/**
Object 保存信息
*/
+ (void)setObject:(id)value forKey:(NSString *)defaultName;
/**
Object 查询信息
*/
+ (id)objectForKey:(NSString *)defaultName;
/**
Value 保存信息
*/
+ (void)setValue:(id)value forKey:(NSString *)defaultName;
/**
Value 查询信息
*/
+ (id)valueForKey:(NSString *)defaultName;
/**
移除单个本地存储
*/
+(void)removeObjectForKey:(NSString*)key;
/**
移除全部本地存储
*/
+(void)clearAll;

@end

NS_ASSUME_NONNULL_END
