//
//  UIView+ZXNavFrameExtension.h
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/3/7.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.3.6

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZXNavFrameExtension)
@property (nonatomic) CGFloat zx_x;
@property (nonatomic) CGFloat zx_y;
@property (nonatomic) CGFloat zx_width;
@property (nonatomic) CGFloat zx_height;
@property (nonatomic) CGFloat zx_right;
@property (nonatomic) CGFloat zx_bottom;
@property (nonatomic) CGFloat zx_centerX;
@property (nonatomic) CGFloat zx_centerY;
@property (nonatomic) CGPoint zx_origin;
@property (nonatomic) CGSize zx_size;
@end

NS_ASSUME_NONNULL_END
