//
//  UIImage+ZXNavBundleExtension.h
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/3/11.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZXNavBundleExtension)
+ (UIImage *)zx_imageFromBundleWithImageName:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
