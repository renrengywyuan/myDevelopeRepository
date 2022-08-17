//
//  HLNewUserManger.m
//  mybigbrother
//  Created by 吕文苑 on 2021/8/16.
//

#import "HLNewUserManger.h"

#define HLNewUserModeManger @"HLNewUserModeManger"
#define HLNewUserModeToken @"HLNewUserModeToken"
#define HLNewUserLoginStatus @"HLNewUserLoginStatus"
#define HLNewUserModeExpiresTime @"HLNewUserModeExpiresTime"
#define HLNewUserModeBlackListFlag @"HLNewUserModeBlackListFlag"
#define HLNewUserModePwdNotNull @"HLNewUserModePwdNotNull"
#define HLNewUserModeCurrentSystomTime @"HLNewUserModeCurrentSystomTime"
#define HLNewUserLoginPhone @"HLNewUserLoginPhone"
#define HLTwoClassAcountFace @"HLTwoClassAcountFace"
#define HLUserBindCardNo @"HLUserBindCardNo"
#define HLUserProfitTag @"HLUserProfitTag"
#define HLUserBindBank @"HLUserBindBank"
#define HLUserReSetGesture @"HLUserReSetGesture"
#define HLUserGestureLogin @"HLUserGestureLogin"

@implementation HLNewUserManger

// 单例
+ (HLNewUserManger *)shareManager{
    // 单例的写法，线程安全
    static HLNewUserManger * userInforManger;
    
    // 标识
    static dispatch_once_t token;
    // 这个函数，会保证Block只执行一次
    dispatch_once(&token, ^{
        userInforManger = [[HLNewUserManger alloc] init];
    });
    return userInforManger;
}

// 退登
+ (void)clearUserInfor{
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults removeObjectForKey:@"HLNewUserModeManger"];
    [userdefaults synchronize];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"RCToken"];
    [userdefaults synchronize];
    
    NSUserDefaults *tokenDefaults = [NSUserDefaults standardUserDefaults];
    [tokenDefaults removeObjectForKey:@"HLNewUserModeToken"];
    [tokenDefaults synchronize];
    
}

/** 更新用户信息*/
+ (void)saveUserInfoMode:(HLNewUserMode *)mode{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:[NSDictionary hl_delNullValue:mode.mj_keyValues] forKey:@"HLNewUserModeManger"];
    [df synchronize];
}

/** 保存用户信息*/
+ (void)saveUserdic:(NSDictionary *)dic{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:dic forKey:@"HLNewUserModeManger"];
    [df synchronize];// 你回到个人中心
}

/** 获取用户信息*/
+ (HLNewUserMode *)fetchUserInfo{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSDictionary * dic = [df valueForKey:@"HLNewUserModeManger"];
    HLNewUserMode * mode = [HLNewUserMode mj_objectWithKeyValues:dic];
    return mode;
}

/*保存token*/
+ (void)saveUserToken:(NSString *)token{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:token forKey:HLNewUserModeToken];
    [df synchronize];
}

/*清除用户token*/
+ (void )removeUserToken:(NSString *)token
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df removeObjectForKey:HLNewUserModeToken];
    [df synchronize];
}

/*获取token*/
+ (NSString *)getToken{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * token = [df valueForKey:HLNewUserModeToken];
    return token;
}

/**
 *  保存用户expires_in(过期时间)
 */
+ (void )saveUserExpiresTime:(NSString *)expiresTime{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:expiresTime forKey:HLNewUserModeExpiresTime];
    [df synchronize];
}
/**
 *  获取用户expires_in(过期时间)
 */
+ (NSString *)getExpiresTime{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * ExpiresTime = [df valueForKey:HLNewUserModeExpiresTime];
    return ExpiresTime;
}

/**
 *  保存用户当前登录的系统时间currentTime
 */
+ (void )saveUserLoginCurrentSystomTime:(NSString *)CurrentSystomTime
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:CurrentSystomTime forKey:HLNewUserModeCurrentSystomTime];
    [df synchronize];
}
/**
 *  获取用户当前登录的系统时间currentTime
 */
+ (NSString *)getCurrentSystomTime
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * CurrentSystomTime = [df valueForKey:HLNewUserModeCurrentSystomTime];
    return CurrentSystomTime;
}

/**
 *  保存用户BLACKLIST_FLAG(黑名单标识)
 */
+ (void )saveUserBlackListFlag:(NSString *)blackListFlag
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:blackListFlag forKey:HLNewUserModeBlackListFlag];
    [df synchronize];
}
/**
 *  获取用户BLACKLIST_FLAG(黑名单标识)
 */
+ (NSString *)getBlackListFlag
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * BlackListFlag = [df valueForKey:HLNewUserModeBlackListFlag];
    return BlackListFlag;
}

/**
 *  保存用户PWD_NOT_NULL(设置过密码)
 */
+ (void )saveUserPwdNotNull:(NSString *)pwdNotNull
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:pwdNotNull forKey:HLNewUserModePwdNotNull];
    [df synchronize];
}
/**
 *  获取用户PWD_NOT_NULL(设置过密码)
 */
+ (NSString *)getPwdNotNull
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * PwdNotNull = [df valueForKey:HLNewUserModePwdNotNull];
    return PwdNotNull;
}
/**
 *  保存用户GESTURE_VERIFICATION_REACHES_LIMIT(重新设置手势)
 */
+ (void )saveUserReSetGesture:(NSString *)reSetGesture
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:reSetGesture forKey:HLUserReSetGesture];
    [df synchronize];
}
/**
 *  移除用户GESTURE_VERIFICATION_REACHES_LIMIT(移除设置的手势)
 */
+ (void )removeUserReSetGesture
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df removeObjectForKey:HLUserReSetGesture];
    [df synchronize];
}
/**
 *  获取用户GESTURE_VERIFICATION_REACHES_LIMIT(设置的手势)
 */
+ (NSString *)getUserReSetGesture
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * ReSetGesture = [df valueForKey:HLUserReSetGesture];
    return ReSetGesture;
}

/**
 *  移除用户PWD_NOT_NULL(设置过密码)
 */
+ (void )removeUserPwdNotNull:(NSString *)pwdNotNull
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df removeObjectForKey:HLNewUserModePwdNotNull];
    [df synchronize];
}

// 保存登录
+ (void)isLogin:(BOOL)isLogin {
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
     [df setBool:isLogin forKey:@"lll_isLogin"];
    [df synchronize];
}

// 获取登录
+ (BOOL)obtainIsLogin {
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [df boolForKey:@"lll_isLogin"];
    return isLogin;
}

/**
 *  保存用户登录手机号
 */
+ (void )saveUserLoginPhone:(NSString *)LoginPhone
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:LoginPhone forKey:HLNewUserLoginPhone];
    [df synchronize];
}
/**
 *  获取用户登录手机号
 */
+ (NSString *)getLoginPhone
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * LoginPhone = [df valueForKey:HLNewUserLoginPhone];
    if (!LoginPhone.length) {
        return @"";
    }
    return LoginPhone;
}

/**
 *  保存二类户人脸标识
 */
+ (void )saveTwoClassAcountFace:(NSString *)twoClassAcountFace
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:twoClassAcountFace forKey:HLTwoClassAcountFace];
    [df synchronize];
}
/**
 *  获取二类户人脸标识
 */
+ (NSString *)getTwoClassAcountFace
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * face = [df valueForKey:HLTwoClassAcountFace];
    return face;
}
/**
 *  删除二类户人脸标识
 */
+ (void )removeTwoClassAcountFace
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df removeObjectForKey:HLTwoClassAcountFace];
    [df synchronize];
}

/**
 *  保存用户绑定的卡号
 */
+ (void )saveUserBindCardNo:(NSString *)BindCardNo
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:BindCardNo forKey:HLUserBindCardNo];
    [df synchronize];
}
/**
 *  获取用户绑定的卡号
 */
+ (NSString *)getBindCardNo
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * BindCardNo = [df valueForKey:HLUserBindCardNo];
    return BindCardNo;
}
/**
 *  移除用户用户绑定的卡号
 */
+ (void )removeUserBindCardNo
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df removeObjectForKey:HLUserBindCardNo];
    [df synchronize];
}
/**
 *  保存收益标识
 */
+ (void )saveProfitTag:(NSString *)ProfitTag
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:ProfitTag forKey:HLUserProfitTag];
    [df synchronize];
}
/**
 *  获取收益标识
 */
+ (NSString *)getProfitTag
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * ProfitTag = [df valueForKey:HLUserProfitTag];
    return ProfitTag;
}
/**
 *  保存用户绑定的银行
 */
+ (void )saveUserBindBank:(NSString *)BindBank
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:BindBank forKey:HLUserBindBank];
    [df synchronize];
}
/**
 *  获取用户绑定的银行
 */
+ (NSString *)getBindBank
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * BindBank = [df valueForKey:HLUserBindBank];
    return BindBank;
}
/**
 *  移除用户绑定的银行
 */
+ (void)removeBindBank
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df removeObjectForKey:HLUserBindBank];
    [df synchronize];
}

/**手势处理时用到*/
+ (void )saveUserGestureLoginPhone:(NSString *)GestureLoginPhone
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:GestureLoginPhone forKey:HLUserGestureLogin];
    [df synchronize];
}
+ (NSString *)getGestureLoginPhone
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString * GestureLoginPhone = [df valueForKey:HLUserGestureLogin];
    return GestureLoginPhone;
}
+ (void )removeGestureLoginPhone
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df removeObjectForKey:HLUserGestureLogin];
    [df synchronize];
}
@end


