//
//  DFWUpdateView.m
//  RenRenCiShanJia
//
//  Created by 吕文苑 on 2017/4/21.
//  Copyright © 2017年 sugarskylove. All rights reserved.
//

#import "DFWUpdateView.h"
#import "Masonry.h"
#import <QuartzCore/QuartzCore.h>

@interface DFWUpdateView ()
@property (nonatomic, copy) void (^tapBlock)(BOOL isUpdate);

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *tipImageView;
@property (nonatomic, strong) UILabel *versionLabel;
@property (nonatomic, strong) UIButton *botButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UITextView *msgTextView;
@property (nonatomic, strong) UILabel *tipLabel;
@end

@implementation DFWUpdateView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        [self prepareUI];
    }
    return self;
}

/**
 准备UI
 */
- (void)prepareUI
{
    self.alpha = 0;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.tipImageView];
    [self.containerView addSubview:self.versionLabel];
    [self.containerView addSubview:self.msgTextView];
    [self.containerView addSubview:self.cancelButton];
    [self.containerView addSubview:self.botButton];
    [self.containerView addSubview:self.tipLabel];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(CONTAINER_WIDTH, 300));
    }];

    [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(-50);
        make.height.mas_equalTo(400 * 0.35);
    }];
    
    [self.msgTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.left.mas_equalTo(20);
        make.top.equalTo(self.tipImageView.mas_bottom).offset(0);
        make.height.mas_equalTo(150);
    }];
    
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.containerView);
        make.bottom.equalTo(self.tipImageView.mas_bottom).mas_offset(-10);
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.containerView);
        make.bottom.equalTo(self.tipImageView.mas_bottom).mas_offset(-35);
    }];

    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(63);
    }];
    
    [self.botButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.containerView);
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.msgTextView.mas_bottom).offset(0);
    }];
}

/**
 显示升级弹窗

 @param version 版本号
 @param message 升级提示信息
 @param tapBlock 是否升级回调
 */
- (void)showWithVersion:(NSString *)version message:(NSString *)message tapBlock:(void (^)(BOOL isUpdate))tapBlock
{
    self.tapBlock = tapBlock;
    self.versionLabel.text = [NSString stringWithFormat:@"%@", version];
    self.msgTextView.text = message;
    
//    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
    [[[[UIApplication sharedApplication] windows] lastObject] addSubview:self];
    
    
    self.containerView.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.transform = CGAffineTransformIdentity;
        self.alpha = 1;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    }];
    
}

/**
 弹窗消失
 */
- (void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.transform = CGAffineTransformMakeScale(0, 0);
        self.alpha = 0;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/**
 确定升级
 */
- (void)didTappedConfirm
{
    [self dismiss];
    self.tapBlock(YES);
}

/**
 取消升级
 */
- (void)didTappedCancel
{
    [self dismiss];
    self.tapBlock(NO);
}

#pragma mark - 懒加载
- (UIView *)containerView
{
    
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.layer.cornerRadius = 10;
        _containerView.layer.masksToBounds = YES;
    }
    return _containerView;
}

- (UIImageView *)tipImageView
{
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] init];
        _tipImageView.image = [UIImage imageNamed:@""];
        _tipImageView.backgroundColor = [UIColor whiteColor];
    }
    return _tipImageView;
}

- (UILabel *)versionLabel
{
    if (!_versionLabel) {
        _versionLabel = [[UILabel alloc] init];
        _versionLabel.textColor = [UIColor colorWithHexString:@"#FADC4F"];
        _versionLabel.font = [UIFont systemFontOfSize:14];
    }
    return _versionLabel;
}

- (UITextView *)msgTextView
{
    if (!_msgTextView) {
        _msgTextView = [[UITextView alloc] init];
        _msgTextView.backgroundColor = [UIColor whiteColor];
        _msgTextView.font = [UIFont boldSystemFontOfSize:15];
        _msgTextView.textColor = [UIColor colorWithRed:0.06 green:0.06 blue:0.06 alpha:1.00];
        [_msgTextView setEditable:NO];
        _msgTextView.showsVerticalScrollIndicator = NO;
    }
    return _msgTextView;
}

- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _tipLabel.font = [UIFont boldSystemFontOfSize:18];
        _tipLabel.text = @"检测到新版本";
    }
    return _tipLabel;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton addTarget:self action:@selector(didTappedConfirm) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton.backgroundColor = [UIColor whiteColor];
//        _cancelButton.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
//        _cancelButton.layer.borderWidth = 1;
    }
    return _cancelButton;
}

- (UIButton *)botButton
{
    if (!_botButton) {
        _botButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_botButton setTitle:@"更新" forState:UIControlStateNormal];
        [_botButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _botButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_botButton addTarget:self action:@selector(didTappedConfirm) forControlEvents:UIControlEventTouchUpInside];
        _botButton.backgroundColor = [UIColor orangeColor];
    }
    return _botButton;
}

@end


