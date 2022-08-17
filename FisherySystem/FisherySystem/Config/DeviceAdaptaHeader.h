//
//  DeviceAdaptaHeader.h
//
//  Created by Loren on 2019/4/16.
//  Copyright © 2019年  All rights reserved.
//

#ifndef DeviceAdaptaHeader_h
#define DeviceAdaptaHeader_h


//异形全面屏
#define hl_kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define hl_kScreenHeight ([UIScreen mainScreen].bounds.size.height)

//iPhoneX / iPhoneXS / iPhone_11_Pro
#define hl_isIphoneX_XS (hl_kScreenWidth == 375.f && hl_kScreenHeight == 812.f ? YES : NO)

//iPhoneXR / iPhoneXS_Max / iPhone_11 / iPhone_11_Pro_Max
#define hl_isIphoneXR_XSMax (hl_kScreenWidth == 414.f && hl_kScreenHeight == 896.f ? YES : NO)

//iPhone12_mini
#define hl_isIphone12_mini (hl_kScreenWidth == 360.f && hl_kScreenHeight == 780.f ? YES : NO)

//iPhone12 / iPhone12_Pro
#define hl_isIphone12_12Pro (hl_kScreenWidth == 390.f && hl_kScreenHeight == 844.f ? YES : NO)

//iPhone12_Pro_Max
#define hl_isIphone12_Pro_Max (hl_kScreenWidth == 428.f && hl_kScreenHeight == 926.f ? YES : NO)

//iPhone13_Mini
#define hl_isIphone13_Mini (hl_kScreenWidth == 375.f && hl_kScreenHeight == 812.f ? YES : NO)

//iPhone13
#define hl_isIphone13 (hl_kScreenWidth == 390.f && hl_kScreenHeight == 844.f ? YES : NO)

//iPhone13_Pro
#define hl_isIphone13_Pro (hl_kScreenWidth == 390.f && hl_kScreenHeight == 844.f ? YES : NO)

//iPhone13_Pro_Max
#define hl_isIphone13_Max (hl_kScreenWidth == 428.f && hl_kScreenHeight == 926.f ? YES : NO)

#define uk_isFullScreen (hl_isIphoneX_XS || hl_isIphoneXR_XSMax || hl_isIphone12_mini || hl_isIphone12_12Pro || hl_isIphone12_Pro_Max || hl_isIphone13_Mini || hl_isIphone13 || hl_isIphone13_Pro || hl_isIphone13_Max)

// Status bar height.
#define uk_StatusBarHeight (uk_isFullScreen ? 44.f : 20.f)

// Navigation bar height.
#define uk_NavigationBarHeight 44.f

// Tabbar height.
#define uk_TabbarHeight (uk_isFullScreen ? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.
#define uk_TabbarSafeBottomMargin (uk_isFullScreen ? 34.f : 0.f)

// 聚源融合OA系统
#define JY_BottomMargin (uk_isFullScreen ? 64.f : 49.f)

// Status bar & navigation bar height.
#define uk_StatusBarAndNavigationBarHeight (uk_isFullScreen ? 88.f : 64.f)

#define uk_NavBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height + [UINavigationBar appearance].frame.size.height)

#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Is_IPhoneX (hl_kScreenWidth >=375.0f && hl_kScreenHeight >=812.0f && Is_Iphone)
#define StatusBar_Height    (Is_IPhoneX ? (44.0):(20.0))
#define TabBar_Height       (Is_IPhoneX ? (49.0 + 34.0):(49.0))
#define NavBar_Height       (44)
#define SearchBar_Height    (55)
#define Bottom_SafeHeight   (Is_IPhoneX ? (34.0):(0))



/** 逻辑像素 */
#define IS_IPHONE_4                                                          \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)480) <    \
DBL_EPSILON)
#define IS_IPHONE_5                                                          \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) <    \
DBL_EPSILON)
#define IS_IPHONE_6                                                          \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)667) <    \
DBL_EPSILON)
#define IS_IPHONE_6S                                                          \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)667) <    \
DBL_EPSILON)
#define IS_IPHONE_6_Plus                                                      \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)736) <    \
DBL_EPSILON)
#define IS_IPHONE_6S_Plus                                                      \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)736) <    \
DBL_EPSILON)
#define IS_IPHONE_7                                                          \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)667) <    \
DBL_EPSILON)
#define IS_IPHONE_7_Plus                                                      \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)736) <    \
DBL_EPSILON)
#define IS_IPHONE_8                                                          \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)667) <    \
DBL_EPSILON)
#define IS_IPHONE_8_Plus                                                      \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)736) <    \
DBL_EPSILON)
#define IS_IPHONE_X                                                          \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)812) <    \
DBL_EPSILON)
#define IS_IPHONE_XS                                                      \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)812) <    \
DBL_EPSILON)
#define IS_IPHONE_XR                                                       \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)896) <    \
DBL_EPSILON)
#define IS_IPHONE_XS_MAX                                                       \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)896) <    \
DBL_EPSILON)
#define IS_IPHONE_11                                                       \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)896) <    \
DBL_EPSILON)
#define IS_IPHONE_11_Pro                                                      \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)812) <    \
DBL_EPSILON)
#define IS_IPHONE_11_Pro_MAX                                                       \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)896) <    \
DBL_EPSILON)
#define IS_IPHONE_12_mini                                                      \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)780) <    \
DBL_EPSILON)
#define IS_IPHONE_12                                                      \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)844) <    \
DBL_EPSILON)
#define IS_IPHONE_12_Pro                                                     \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)844) <    \
DBL_EPSILON)
#define IS_IPHONE_12_Pro_MAX                                                       \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)926) <    \
DBL_EPSILON)



// 物理像素
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1332), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhoneXS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhoneSE_01 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6S_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone7_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone8_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhoneSE_02 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhoneXS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone_11 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone_11_Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone_11_ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone_12_mini ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 2340), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone_12 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone_12_Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone_12_ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1284, 2778), [[UIScreen mainScreen] currentMode].size) : NO)


#define JCNew64          (kDevice_Is_iPhoneX ? 88 : 64)
#define TAB_BAR_HEIGHT   (kDevice_Is_iPhoneX ? 83 : 49)
#define kBottomMargin    (kDevice_Is_iPhoneX ? 34 : 0)

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

#define CONTAINER_WIDTH (KScreenW * 0.7)
#define CONTAINER_HEIGHT (KScreenH * 0.55)


#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]


#endif /* DeviceAdaptaHeader_h */
