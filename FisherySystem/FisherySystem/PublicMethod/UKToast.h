//
//  Toast.h
//
//  Created by Mr.吕 on 2020/11/16.
//  Copyright © 2020 leimingtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UKToast : NSObject

// 设置提示文字
+ (void)showWithText:(NSString *)text;

// 设置提示文字、显示时间
+ (void)showWithText:(NSString *)text
            duration:(CGFloat)duration;

// 设置提示文字、Toast与顶部距离
+ (void)showWithText:(NSString *)text
           topOffset:(CGFloat)topOffset;

// 设置提示文字、Toast与顶部距离、显示时间
+ (void)showWithText:(NSString *)text
           topOffset:(CGFloat)topOffset
            duration:(CGFloat)duration;

// 设置提示文字、Toast与底部距离
+ (void)showWithText:(NSString *)text
        bottomOffset:(CGFloat)bottomOffset;

// 设置提示文字、Toast与底部距离、显示时间
+ (void)showWithText:(NSString *)text
        bottomOffset:(CGFloat) bottomOffset
            duration:(CGFloat) duration;


@end
