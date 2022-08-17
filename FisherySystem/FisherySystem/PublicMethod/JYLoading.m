//
//  JYLoading.m
//  OASystem
//
//  Created by Mr.吕 on 2022/6/22.
//

#import "JYLoading.h"

#import <Masonry.h>

#define CQLoadingDefaultView [UIApplication sharedApplication].delegate.window

@interface JYLoading ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic,  strong) UIWindow *overlayWindow;
@end

@implementation JYLoading

#pragma mark - show

+ (void)show {
    [JYLoading showOnView:CQLoadingDefaultView withInfo:@""];
}

+ (void)showWithInfo:(NSString *)info {
    [JYLoading showOnView:CQLoadingDefaultView withInfo:info];
}

+ (void)showOnView:(UIView *)superView {
    [JYLoading showOnView:superView withInfo:@""];
}

+ (void)showOnView:(UIView *)superView withInfo:(NSString *)info {
    // 先将view上的loading移除
    [JYLoading removeFromView:superView];
    
    JYLoading *loading = [[JYLoading alloc] initWithInfo:info];
    [superView addSubview:loading];
    [loading mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.mas_equalTo(superView);
    }];
}

#pragma mark - remove

+ (void)remove {
    [JYLoading removeFromView:CQLoadingDefaultView];
}

+ (void)removeFromView:(UIView *)superView {
    for (UIView *subView in superView.subviews) {
        if ([subView isMemberOfClass:[JYLoading class]]) {
            [subView removeFromSuperview];
        }
    }
}

#pragma mark - init

- (instancetype)initWithInfo:(NSString *)info {
    if (self = [super init]) {
        [self showLoadingViewInfo:info];
    }
    
    return self;
}

- (void)showLoadingViewInfo:(NSString *)info
{
//    [[UIApplication sharedApplication].delegate.window addSubview:self];
//        [[[[UIApplication sharedApplication] windows] firstObject] addSubview:self];
    self.layer.zPosition = 1;
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];

    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading"]];
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        if ([info isEqualToString:@""]) {
            make.centerY.mas_equalTo(self);
        } else {
            make.bottom.mas_equalTo(self.mas_centerY).mas_offset(-20);
        }
    }];
    
    self.infoLabel = [[UILabel alloc] init];
    [self addSubview:self.infoLabel];
    self.infoLabel.text = info;
    self.infoLabel.font = [UIFont systemFontOfSize:14];
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_lessThanOrEqualTo(220);
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(self);
    }];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat: M_PI *2];
    animation.duration = 0.7;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

@end
