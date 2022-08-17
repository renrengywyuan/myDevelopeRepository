//
//  NSAttributedString+ZXNavCalcSizeExtension.m
//  ZXNavigationBarDemo
//
//  Created by Mr.吕 on 2020/10/23.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import "NSAttributedString+ZXNavCalcSizeExtension.h"

@implementation NSAttributedString (ZXNavCalcSizeExtension)
- (CGFloat)zx_getAttrRectWidthWithLimitH:(CGFloat)limitH fontSize:(CGFloat)fontSize{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.attributedText = self;
    return [label sizeThatFits:CGSizeMake(MAXFLOAT, limitH)].width;
}
- (CGFloat)zx_getAttrRectHeightWithLimitW:(CGFloat)limitW fontSize:(CGFloat)fontSize{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.attributedText = self;
    return [label sizeThatFits:CGSizeMake(limitW,MAXFLOAT )].height;
}
@end
