//
//  LocationSetHeader.h
//
//  Created by apple on 2020/11/18.
//  Copyright © 2020 leimingtech. All rights reserved.
//

#ifndef LocationSetHeader_h
#define LocationSetHeader_h

#define SystemVersion ([[UIDevice currentDevice] systemVersion])

/**客服电话*/
#define CUSTOMER_SERVICE  @"0311-89246061"

#pragma mark - 数据加载条数设置 - 
# define loadDataNum 10

#pragma mark - 分段item选中颜色 -
# define itemSelectedColors RGB(74, 120, 237)

#define TUIKit_Image_Path [NSHomeDirectory() stringByAppendingString:@"/Documents/com_jyrh_data/image/"]
#define TUIKit_File_Path  [NSHomeDirectory() stringByAppendingString:@"/Documents/com_jyrh_data/file/"]
//#pragma mark - 给图片和视频各创建一个缓存目录:
#define PHOTOCACHEPATH [NSTemporaryDirectory() stringByAppendingPathComponent:@"photoCache"]
#define VIDEOCACHEPATH [NSTemporaryDirectory() stringByAppendingPathComponent:@"videoCache"]
#define CompressionVideoPaht [NSHomeDirectory() stringByAppendingFormat:@"/Documents/CompressionVideoField"]
#pragma mark - 视频存储路径
#define KVideoUrlPath   \
[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"VideoURL"]

# define saveFileTip @"文件导出完成，文件位置：iphone桌面 -> 【文件】-> 【我的iPhone】-> 【人事管理系统】中"
#define NETNOAPPLY   @"网络不可用"
#define RECAPTURE  @"重新获取"

#pragma mark - 用户token本地缓存
#define kUserToken @"access_token"

#pragma mark - 版本更新相关宏设置 -
#define App_BundleID  @"com.ukuoffer.youluwang"
#define App_AppleID  @"id1563616980"
#define CURRENT_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define BUNDLE_IDENTIFIER [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define SYSTEM_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
#define TRACK_ID @"TRACKID"
#define APP_LAST_VERSION @"APPLastVersion"
#define APP_RELEASE_NOTES @"APPReleaseNotes"
#define APP_TRACK_VIEW_URL @"APPTRACKVIEWURL"
#define SPECIAL_MODE_CHECK_URL @"https://itunes.apple.com/lookup?country=%@&bundleId=%@"
#define NORMAL_MODE_CHECK_URL @"https://itunes.apple.com/lookup?bundleId=%@"
#define SKIP_CURRENT_VERSION @"SKIPCURRENTVERSION"
#define SKIP_VERSION @"SKIPVERSION"

#pragma mark - 微信支付 -
#define KWechatAppId @""
#define KWechatAppSecret  @""

#define Color(x) ([ColorFormatter hex2Color:x])

#define WeakSelf(type)  __weak typeof(type) weakSelf = type;

/** 快速设置颜色宏 */
#define kRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
/** 颜色生成*/
#define MBBCOLOR_ALPHA(r, g, b, a)                           \
[UIColor colorWithRed:(r) / 255.0                            \
green:(g) / 255.0                                            \
blue:(b) / 255.0                                             \
alpha:a * 1.0]
#define MBBCOLOR(r, g, b)                                    \
[UIColor colorWithRed:(r) / 255.0                            \
green:(g) / 255.0                                            \
blue:(b) / 255.0                                             \
alpha:1.0]
#define MBBHEXCOLOR_ALPHA(c, a) [UIColor colorWithHexValue:c alpha:a]
#define MBBHEXCOLOR(c) [UIColor colorWithHexValue:c alpha:1.0]
/* 设置字体颜色RGB */
#define RGB(r,g,b)          RGBA(r,g,b,1)
#define RGBEqualColor(c)    RGB(c,c,c)
#define RGBRandom           RGB(arc4random()%255,arc4random()%255,arc4random()%255)
/* 设置字体颜色十六进制 */
#define ColorHex(color) [UIColor colorWithHexString:color]
#define MBBHEXCOLOR(c) [UIColor colorWithHexValue:c alpha:1.0]

// 更新内容
#define UPDATECONTENT @"最新版本来啦,请立即前往更新吧！"
// 版本控制
#define versionbuild @"v1.0.1(1)"

// Bugly
#define BUGLY_APP_ID  @""
#define AppVersion @"/operation/app/version/ios"
#define APPVersionURL @"http://itunes.apple.com/lookup?id=1066687224"
#define APPOpenURL @"https://itunes.apple.com/cn/app/id1487440680?mt=8"

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define MJWeakSelf __weak typeof(self) weakSelf = self;

#ifndef __OPTIMIZE__
    //这里执行的是debug模式下，打印日志，当前行
    #define NSLog(...) printf("%s %s 第%d行: %s\n",__TIME__, __PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
        //这里执行的是release模式下，不打印日志
    #define NSLog(...)
#endif

#endif /* LocationSetHeader_h */
