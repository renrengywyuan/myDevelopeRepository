//
//  ZXNavTitleLabel.m
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/3/7.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import "ZXNavTitleLabel.h"

@implementation ZXNavTitleLabel

- (void)setText:(NSString *)text{
    [super setText:text];
    [self noticeUpdateFrame];
}

- (void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    [self noticeUpdateFrame];
}

- (void)setFont:(UIFont *)font{
    [super setFont:font];
    [self noticeUpdateFrame];
}

- (void)noticeUpdateFrame{
    if(self.zx_titleLabelFrameUpdateBlock){
        self.zx_titleLabelFrameUpdateBlock(self);
    }
}

@end
