//
//  NSString+ZXNavCalcSizeExtension.m
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/3/7.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import "NSString+ZXNavCalcSizeExtension.h"

@implementation NSString (ZXNavCalcSizeExtension)
- (CGFloat)zx_getRectWidthWithLimitH:(CGFloat)limitH fontSize:(CGFloat)fontSize{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, limitH)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                     context:nil];
    return rect.size.width;
}
- (CGFloat)zx_getRectHeightWithLimitW:(CGFloat)limitW fontSize:(CGFloat)fontSize{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(limitW,MAXFLOAT )
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                     context:nil];
    return rect.size.height;
}
@end
