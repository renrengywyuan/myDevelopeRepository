//
//  Toast.m
//
//  Created by Mr.吕on 2020/11/16.
//  Copyright © 2020 leimingtech. All rights reserved.
//  文字提示Toast

#import "UKToast.h"

#define DEFAULT_DISPLAY_DURATION 2.0f

@interface UKToast ()
{
    CGFloat _duration;  // 显示时间默认2秒
}

@property (nonatomic, strong) UIView *contentView;

@end

@implementation UKToast

- (id)initWithText:(NSString *)content
{
    self = [super init];
    if (self) {
        [self initView:content];
    }
    return self;
}

// 初始化UI
- (void)initView:(NSString *)content
{
    UIFont *font = [UIFont systemFontOfSize:14];
    
    NSDictionary *dic = @{NSFontAttributeName : font};
    
    CGRect textRect = [content boundingRectWithSize:CGSizeMake(280, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 5, textRect.size.width + 6, textRect.size.height + 6)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = font;
    textLabel.text = content;
    textLabel.numberOfLines = 0;
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textLabel.frame.size.width + 24, textLabel.frame.size.height + 11)];
    _contentView.layer.cornerRadius =  _contentView.frame.size.height / 2; // 10
    _contentView.layer.borderWidth = 0.0f;
    _contentView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:1.0].CGColor;
    _contentView.backgroundColor = [UIColor colorWithRed:0.0
                                                  green:0.0f
                                                   blue:0.0f
                                                   alpha:1.0f];
    [_contentView addSubview:textLabel];
    
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    _contentView.alpha = 0.0f;
    
    _duration = DEFAULT_DISPLAY_DURATION;
}


-(void)dismissToast
{
    [_contentView removeFromSuperview];
}

- (void)setDuration:(CGFloat) duration
{
    _duration = duration;
}


-(void)showAnimation
{
    [UIView beginAnimations:@"show" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    _contentView.alpha = 1.0f;
    [UIView commitAnimations];
}


-(void)hideAnimation
{
    [UIView beginAnimations:@"hide" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissToast)];
    [UIView setAnimationDuration:0.3];
    _contentView.alpha = 0.0f;
    [UIView commitAnimations];
}

// 显示Toast
- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _contentView.center = window.center;
    [window addSubview:_contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:_duration];
}

- (void)showFromTopOffset:(CGFloat)top
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _contentView.center = CGPointMake(window.center.x, top + _contentView.frame.size.height / 2);
    [window addSubview:_contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:_duration];
}

- (void)showFromBottomOffset:(CGFloat)bottom{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _contentView.center = CGPointMake(window.center.x, window.frame.size.height - (bottom + _contentView.frame.size.height / 2));
    [window addSubview:_contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:_duration];
}

+ (void)showWithText:(NSString *)text
{
    [UKToast showWithText:text duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text
            duration:(CGFloat)duration
{
    UKToast *toast = [[UKToast alloc] initWithText:text];
    [toast setDuration:duration];
    [toast show];
}

+ (void)showWithText:(NSString *)text
           topOffset:(CGFloat)topOffset
{
    [self showWithText:text topOffset:topOffset duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text
           topOffset:(CGFloat)topOffset
            duration:(CGFloat)duration
{
    UKToast *toast = [[UKToast alloc] initWithText:text];
    [toast setDuration:duration];
    [toast showFromTopOffset:topOffset];
}

+ (void)showWithText:(NSString *)text
        bottomOffset:(CGFloat)bottomOffset
{
    [UKToast showWithText:text bottomOffset:bottomOffset duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text
        bottomOffset:(CGFloat)bottomOffset
            duration:(CGFloat)duration
{
    UKToast *toast = [[UKToast alloc] initWithText:text];
    [toast setDuration:duration];
    [toast showFromBottomOffset:bottomOffset];
}

- (void)dealloc
{
    _contentView = nil;
}
@end
