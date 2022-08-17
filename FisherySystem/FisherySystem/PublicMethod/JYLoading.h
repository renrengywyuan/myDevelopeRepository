//
//  JYLoading.h
//  OASystem
//
//  Created by Mr.吕 on 2022/6/22.
//  全局Loading加载

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYLoading : UIView
+ (void)show;
+ (void)showWithInfo:(NSString *)info;
+ (void)showOnView:(UIView *)superView;
+ (void)showOnView:(UIView *)superView withInfo:(NSString *)info;

+ (void)remove;
+ (void)removeFromView:(UIView *)superView;
@end

NS_ASSUME_NONNULL_END
