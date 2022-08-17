//
//  ZXNavTitleLabel.h
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/3/7.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZXNavTitleLabel : UILabel
//NavTitleLabel的frame更新回调
@property (copy, nonatomic) void (^zx_titleLabelFrameUpdateBlock)(ZXNavTitleLabel *titleLabel);
@end

NS_ASSUME_NONNULL_END
