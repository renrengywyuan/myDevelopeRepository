//
//  UIButton+TouchArea.h
//  OASystem
//
//  Created by Mr.吕 on 2022/6/24.
//  功能：旨在扩大UIButton的点击区域

/**
 使用方法：
 self.backBtn = [[UIButton alloc] init];
 [self.view addSubview:self.backBtn];
 [self.backBtn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
 [self.backBtn addTarget:self action:@selector(back_click) forControlEvents:UIControlEventTouchUpInside];
 self.backBtn.clickArea = @"10"; // 加上这句即可
 [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.mas_equalTo(17.5);
     make.top.mas_equalTo(uk_StatusBarHeight+5);
     make.height.mas_equalTo(30);
 }];
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TouchArea)
// 扩大按钮热区的比例系数
@property (nonatomic, copy) NSString *clickArea;

@end

NS_ASSUME_NONNULL_END
