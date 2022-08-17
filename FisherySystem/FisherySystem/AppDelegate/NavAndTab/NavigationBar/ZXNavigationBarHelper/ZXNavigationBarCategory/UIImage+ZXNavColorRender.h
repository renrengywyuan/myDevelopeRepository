//
//  UIImage+ZXNavColorRender.h
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/3/10.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZXNavColorRender)

/**
 图片渲染

 @param color 需要渲染的颜色
 @return 渲染后的图片
 */
- (UIImage *)zx_renderingColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
