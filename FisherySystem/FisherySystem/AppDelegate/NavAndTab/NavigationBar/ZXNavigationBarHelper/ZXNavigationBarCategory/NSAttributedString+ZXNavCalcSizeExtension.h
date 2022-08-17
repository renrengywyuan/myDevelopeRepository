//
//  NSAttributedString+ZXNavCalcSizeExtension.h
//  ZXNavigationBarDemo
//
//  Created by Mr.吕 on 2020/10/23.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (ZXNavCalcSizeExtension)
- (CGFloat)zx_getAttrRectWidthWithLimitH:(CGFloat)limitH fontSize:(CGFloat)fontSize;
- (CGFloat)zx_getAttrRectHeightWithLimitW:(CGFloat)limitW fontSize:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
