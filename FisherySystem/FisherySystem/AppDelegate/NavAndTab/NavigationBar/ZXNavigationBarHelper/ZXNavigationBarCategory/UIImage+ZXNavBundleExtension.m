//
//  UIImage+ZXNavBundleExtension.m
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/3/11.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import "UIImage+ZXNavBundleExtension.h"
#import "ZXNavigationBar.h"
@implementation UIImage (ZXNavBundleExtension)

+ (UIImage *)zx_imageFromBundleWithImageName:(NSString *)imageName{
    static UIImage *image = nil;
    if (image == nil) {
        NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[ZXNavigationBar class]] pathForResource:@"ZXNavigationBar" ofType:@"bundle"]];
        image = [[UIImage imageWithContentsOfFile:[bundle pathForResource:imageName ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return image;
}

@end
