//
//  HLNewUserManger.h
//  mybigbrother
//
//  Created by 吕文苑 on 2021/8/16.
//

#import <Foundation/Foundation.h>

#import "HLNewUserMode.h"

@interface HLNewUserManger : NSObject

/** 单例*/
+ (HLNewUserManger *)shareManager;

// 删除数据
+ (void)clearUserInfor;
/**
    保存，更新用户信息
 */
+ (void)saveUserInfoMode:(HLNewUserMode *)mode;
/**
 保存，更新用户信息
 */
+ (void)saveUserdic:(NSDictionary *)dic;
/**
 *  获取用户信息
 */
+ (HLNewUserMode *)fetchUserInfo;
/**
 *  保存用户token
 */
+ (void )saveUserToken:(NSString *)token;
/**
 *  获取用户token
 */
+ (NSString *)getToken;

/**
 *  删除用户token
 */
+ (void )removeUserToken:(NSString *)token;

/**
 *  保存用户expires_in(过期时间)
 */
+ (void )saveUserExpiresTime:(NSString *)expiresTime;
/**
 *  获取用户expires_in(过期时间)
 */
+ (NSString *)getExpiresTime;

/**
 *  保存用户当前登录的系统时间currentTime
 */
+ (void )saveUserLoginCurrentSystomTime:(NSString *)CurrentSystomTime;
/**
 *  获取用户当前登录的系统时间currentTime
 */
+ (NSString *)getCurrentSystomTime;

/**
 *  保存用户BLACKLIST_FLAG(黑名单标识)
 */
+ (void )saveUserBlackListFlag:(NSString *)blackListFlag;
/**
 *  获取用户BLACKLIST_FLAG(黑名单标识)
 */
+ (NSString *)getBlackListFlag;

/**
 *  保存用户PWD_NOT_NULL(设置过密码)
 */
+ (void )saveUserPwdNotNull:(NSString *)pwdNotNull;

/**
 *  移除用户PWD_NOT_NULL(设置过密码)
 */
+ (void )removeUserPwdNotNull:(NSString *)pwdNotNull;
/**
 *  保存用户GESTURE_VERIFICATION_REACHES_LIMIT(重新设置手势)
 */
+ (void )saveUserReSetGesture:(NSString *)reSetGesture;
/**
 *  移除用户GESTURE_VERIFICATION_REACHES_LIMIT(移除设置的手势)
 */
+ (void )removeUserReSetGesture;
/**
 *  获取用户GESTURE_VERIFICATION_REACHES_LIMIT(设置的手势)
 */
+ (NSString *)getUserReSetGesture;
/**
 *  获取用户PWD_NOT_NULL(设置过密码)
 */
+ (NSString *)getPwdNotNull;

+ (void)isLogin:(BOOL)isLogin;

// 获取登录
+ (BOOL)obtainIsLogin;

/**
 *  保存用户登录手机号
 */
+ (void )saveUserLoginPhone:(NSString *)LoginPhone;
/**
 *  获取用户登录手机号
 */
+ (NSString *)getLoginPhone;

/**
 *  保存二类户人脸标识
 */
+ (void )saveTwoClassAcountFace:(NSString *)twoClassAcountFace;
/**
 *  获取二类户人脸标识
 */
+ (NSString *)getTwoClassAcountFace;
/**
 *  删除二类户人脸标识
 */
+ (void)removeTwoClassAcountFace;
/**
 *  保存用户绑定的卡号
 */
+ (void )saveUserBindCardNo:(NSString *)BindCardNo;
/**
 *  获取用户绑定的卡号
 */
+ (NSString *)getBindCardNo;
/**
 *  移除用户用户绑定的卡号
 */
+ (void )removeUserBindCardNo;
/**
 *  保存收益标识
 */
+ (void )saveProfitTag:(NSString *)ProfitTag;
/**
 *  获取收益标识
 */
+ (NSString *)getProfitTag;
/**
 *  保存用户绑定的银行
 */
+ (void )saveUserBindBank:(NSString *)BindBank;
/**
 *  获取用户绑定的银行
 */
+ (NSString *)getBindBank;
/**
 *  移除用户绑定的银行
 */
+ (void)removeBindBank;


+ (void )saveUserGestureLoginPhone:(NSString *)GestureLoginPhone;
+ (NSString *)getGestureLoginPhone;
+ (void )removeGestureLoginPhone;

@end
