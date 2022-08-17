//
//  AppManager.m
//  Mr.吕
//
//  Created by LWY on 2019/6/26.
//  Copyright © 2019 Mr.吕. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "AppManager.h"
#import "AppDelegate.h"
#import "RequestConstants.h"
#import <AdSupport/AdSupport.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "sys/utsname.h"

@interface AppManager ()
//@property (nonatomic ,copy)PayBlock block;
@end

@implementation AppManager
static AppManager *instance;

+(instancetype)allocWithZone:(struct _NSZone *)zone {
    return [AppManager shareInstance];
}

+(instancetype)shareInstance {
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupQYUserInfo) name:NotificationNameWithLoginSucceed object:nil];
    });
    return instance ;
}

-(id)copyWithZone:(NSZone *)zone {
    return [AppManager shareInstance] ;
}

#pragma mark - 获取系统信息
- (NSString *)getSystemVersion {
    return UIDevice.currentDevice.systemVersion;
}

#pragma mark - 获取APP版本信息
- (NSString *)getAppVersion {
    return NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"] != nil ? NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"] : @"";
}

#pragma mark - 获取UUID信息
- (NSString *)getUUID {
    return [NSString stringWithFormat:@"%@",[[[UIDevice currentDevice]identifierForVendor]UUIDString]];
}

#pragma mark -  获取IDFA
- (NSString *)getIDFA{
    NSString *idfaStr = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if (idfaStr && idfaStr.length > 0) {
        return idfaStr;
    }
    return @"";
}

#pragma mark -  网络类型
- (NSString *)getNetType{
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    NSString *networkType = @"";
    if ([info respondsToSelector:@selector(currentRadioAccessTechnology)]) {
        NSString *currentStatus = info.serviceCurrentRadioAccessTechnology;
        NSArray *network2G = @[CTRadioAccessTechnologyGPRS, CTRadioAccessTechnologyEdge, CTRadioAccessTechnologyCDMA1x];
        NSArray *network3G = @[CTRadioAccessTechnologyWCDMA, CTRadioAccessTechnologyHSDPA, CTRadioAccessTechnologyHSUPA, CTRadioAccessTechnologyCDMAEVDORev0, CTRadioAccessTechnologyCDMAEVDORevA, CTRadioAccessTechnologyCDMAEVDORevB, CTRadioAccessTechnologyeHRPD];
        NSArray *network4G = @[CTRadioAccessTechnologyLTE];

        if ([network2G containsObject:currentStatus]) {
            networkType = @"2G";
        }else if ([network3G containsObject:currentStatus]) {
            networkType = @"3G";
        }else if ([network4G containsObject:currentStatus]){
            networkType = @"4G";
        }else {
            networkType = @"WIFI";
        }
    }
    return networkType;
}

#pragma mark -  手机型号
-(NSString*)getIphoneType {
    //导入#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    //iPhone 系列
    if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([deviceModel isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([deviceModel isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([deviceModel isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([deviceModel isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";

    return @"iPhone";
}

#pragma mark -  验证手机号码格式
- (BOOL)validatePhone:(NSString *)phone {
    NSString * mobile = @"^1+[3578]+\\d{9}";//@"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    BOOL isMatch = [pred evaluateWithObject:phone];
    return isMatch;
}

#pragma mark -  获取屏幕分辨率
- (void)verificationTokenStatus {
    [[self getCurrentViewController].navigationController popToRootViewControllerAnimated:NO];
    [self getCurrentViewController].tabBarController.selectedIndex = 4;
}

#pragma mark -  获取当前控制器
- (UIViewController *)getCurrentViewController {
    UIViewController* currentViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            
            currentViewController = currentViewController.presentedViewController;
        } else if ([currentViewController isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];
            
        } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
            
            UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
        } else {
            
            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                
                currentViewController = currentViewController.childViewControllers.lastObject;
                
                return currentViewController;
            } else {
                
                return currentViewController;
            }
        }
        
    }
    return currentViewController;
}

#pragma mark -  获取屏幕分辨率
- (CGFloat)getScreenScaleX {
    float scaleX = 3.0;
    if([[UIScreen mainScreen] respondsToSelector:@selector(scale)]){
        if ([[UIScreen mainScreen] scale]==1.0) {
            scaleX=3;
        }
        if ([[UIScreen mainScreen] scale]==2.0) {
            scaleX=3;
        }
        if ([[UIScreen mainScreen] scale]==3.0) {
            scaleX=3;
        }
    }
    return scaleX;
}

#pragma mark -  获取当前时间
- (NSString *)getTimeStringForNow
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 设置日期格式带毫秒格式
    NSString *destString = [dateFormat stringFromDate:[NSDate date]];
    return destString;
}

#pragma mark -  获取当前时间差
- (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//根据自己的需求定义格式
    NSDate* startDate = [formater dateFromString:starTime];
    NSDate* endDate = [formater dateFromString:endTime];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}

#pragma mark -  将NSDictionary转化为NSString -
+ (NSString *)translateDictionaryToString:(NSDictionary *)dict {
    
    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
//                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
//                                                         error:&error];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:&error];
    NSString *jsonString = @"";
    
    if (! jsonData)
    {
        NSLog(@"Got an error: %@", error);
    }else
    {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return jsonString;
}

#pragma mark - 图片进行AES加密后，再进行base64加密 -
+ (NSString *)ansixData:(NSData *)imgData
{
    NSString *key = @"dcmsdcmsdcmsdcms";
    // 要加密的图片
    NSData *sourceData = imgData;
    // 对图片进行AES加密
    NSData *ansix923Data = [sourceData cc_encryptUsingAlgorithm:CcCryptoAlgorithmAES key:key Mode:CcCryptorECBMode Padding:CcCryptorZeroPadding];
    // 将AES加密后的数据，再进行base64加密
    NSString *ansix923String = [ansix923Data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSLog(@"最终加密后的数据 = %@",ansix923String);
    
    return ansix923String;
}
/**
 获取视频的第一帧截图, 返回UIImage
 需要导入AVFoundation.h
 */
#pragma mark - 获取视频的第一帧截图, 返回UIImage -
+ (UIImage*) getVideoPreViewImageWithPath:(NSURL *)videoPath
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoPath options:nil];
    
    AVAssetImageGenerator *gen         = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    
    CMTime time      = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error   = nil;
    
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *img     = [[UIImage alloc] initWithCGImage:image];
    
    return img;
}

#pragma mark - 从缓存路径获取照片 -
+ (UIImage *)getImageFromPath:(NSString *)path {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        return [UIImage imageWithContentsOfFile:path];
    }
    return nil;
}

#pragma mark - 将Image保存到缓存路径中 -
+ (void)saveImage:(UIImage *)image toCachePath:(NSString *)path {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:PHOTOCACHEPATH]) {
        
        NSLog(@"路径不存在, 创建路径");
        [fileManager createDirectoryAtPath:PHOTOCACHEPATH
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    } else {
        NSLog(@"路径存在");
    }
    //[UIImagePNGRepresentation(image) writeToFile:path atomically:YES];
    [UIImageJPEGRepresentation(image, 1) writeToFile:path atomically:YES];
}

#pragma mark - 将视频保存到缓存路径中 -
+ (void)saveVideoFromPath:(NSString *)videoPath toCachePath:(NSString *)path {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:VIDEOCACHEPATH]) {
        
        NSLog(@"路径不存在, 创建路径");
        [fileManager createDirectoryAtPath:VIDEOCACHEPATH
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    } else {
        
        NSLog(@"路径存在");
    }
    
    NSError *error;
    [fileManager copyItemAtPath:videoPath toPath:path error:&error];
    if (error) {
        
        NSLog(@"文件保存到缓存失败");
    }
}

#pragma mark - 视频压缩转码处理 -
/*
 参数 sourceVideoURL ：被压缩视频的URL
 参数 compressionType ： 压缩可选类型
 参数 resultPathBlock ： 返回压缩后的视频路径
 
 *  AVAssetExportPresetLowQuality
 *  AVAssetExportPresetMediumQuality
 *  AVAssetExportPresetHighestQuality
 *  AVAssetExportPreset640x480
 *  AVAssetExportPreset960x540
 *  AVAssetExportPreset1280x720
 *   AVAssetExportPreset1920x1080
 *   AVAssetExportPreset3840x2160
 
 */
+ (void)compressedVideoOtherMethodWithURL:(NSURL *)sourceVideoURL
                          compressionType:(NSString *)compressionType
                          compressionResultPath:(CompressionSuccessBlock)resultPathBlock {
    
    NSString *resultPath;
//    NSData *data = [NSData dataWithContentsOfURL:sourceVideoURL];
//    CGFloat totalSize = (float)data.length / 1024 / 1024;
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:sourceVideoURL options:nil];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    // 所支持的压缩格式中是否有 所选的压缩格式
    if ([compatiblePresets containsObject:compressionType]) {
        
        // 用时间, 给文件重新命名, 防止视频存储覆盖,
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
        
        // 回调重新命名的文件名
        NSString * fileName = [NSString stringWithFormat:@"outputVideo-%@.mp4", [formater stringFromDate:[NSDate date]]];
        
        NSFileManager *manager = [NSFileManager defaultManager];
        BOOL isExists = [manager fileExistsAtPath:CompressionVideoPaht];
        if (!isExists) {
            [manager createDirectoryAtPath:CompressionVideoPaht withIntermediateDirectories:YES attributes:nil error:nil];
        }
        resultPath = [CompressionVideoPaht stringByAppendingPathComponent:fileName];
        
        NSLog(@"resultPath = %@",resultPath);
        
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:compressionType];
        exportSession.outputURL = [NSURL fileURLWithPath:resultPath];
        exportSession.outputFileType = AVFileTypeMPEG4;
        exportSession.shouldOptimizeForNetworkUse = YES;
        [exportSession exportAsynchronouslyWithCompletionHandler:^(void) {
             if (exportSession.status == AVAssetExportSessionStatusCompleted) {
                 
                 NSData *data = [NSData dataWithContentsOfFile:resultPath];
                 float memorySize = (float)data.length / 1024 / 1024;
                 NSLog(@"视频压缩后大小 %f", memorySize);
                 resultPathBlock (resultPath, memorySize, fileName);
                 
             } else {
                 NSLog(@"压缩失败");
                 [UKToast showWithText:@"压缩失败" bottomOffset:100 duration:1.5];
             }
         }];
    } else {
        NSLog(@"不支持 %@ 格式的压缩", compressionType);
        [UKToast showWithText:[NSString stringWithFormat:@"不支持 %@ 格式的压缩",compressionType] bottomOffset:100 duration:1.5];
    }
}

#pragma mark - 清除沙盒文件中, 压缩后的视频所有, 在使用过压缩文件后, 不进行再次使用时, 可调用该方法, 进行删除 -
+ (void)removeCompressedVideoFromDocuments {
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:CompressionVideoPaht]) {
        [[NSFileManager defaultManager] removeItemAtPath:CompressionVideoPaht error:nil];
    }
}

#pragma mark - 获取视频的大小
+ (float)countVideoTotalMemorySizeWithURL:(NSURL *)url {
    NSData *data = [NSData dataWithContentsOfURL:url];
    CGFloat totalSize = (float)data.length / 1024 / 1024;
    
    return totalSize;
}

#pragma mark - 短信倒计时设置 -
+ (void)countDownSeconds:(void (^)(NSString * resultStr))resultStr{
    __block int timeout = 60; // 倒计时时间60秒
    dispatch_queue_t queue =
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer =
    dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0),
                              1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if (timeout <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                resultStr(RECAPTURE); // 重新获取
            });
        } else {
            int seconds = timeout % 61;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                resultStr([NSString stringWithFormat:@"剩余%.2ds",seconds]);
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark - 富文本调整颜色(由前至后) -
/** 富文本调整颜色(由前至后)
 *  @param originStr 源字符串
 *  @param position  改变颜色的位置
 *  @param color     要改变的颜色
 */
+ (NSMutableAttributedString *)originalStr:(NSString *)originStr
                                  position:(NSInteger)position
                                     color:(UIColor *)color
{
    NSUInteger length = [originStr length];
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc]initWithString:originStr];
    if ([originStr length] > 0) {
        /** 调整颜色*/
        [attriStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, length-position)];
    }
    return attriStr;
}

#pragma mark 判断是否登陆 -
+ (BOOL)isLogionSuccess
{
    if ([WYSaveTool objectForKey:kUserToken]) {
        
        NSLog(@"AppManager - Token = %@",[WYSaveTool objectForKey:kUserToken]);
        
        return YES;
    }else{
        return NO;
    }
}

#pragma mark 判断当前页是否登陆 -
+ (void)CheckOutPresentVCLogin:(UIViewController *)presentVC isLoginToPush:(UIViewController *)pushVC{
    
    if ([self isLogionSuccess]) {
        [presentVC.navigationController pushViewController:pushVC animated:YES];
    
    }else{
//        HXLoginViewController *login = [[HXLoginViewController alloc] init];
//        login.modalPresentationStyle = UIModalPresentationFullScreen;
//        [presentVC.navigationController presentViewController:[[LBNavigationController alloc]initWithRootViewController:login]
//                                                            animated:NO
//                                                          completion:nil];
        return;
    }
}

#pragma mark 支付 -
//- (NSData *)getHttpDataFromParam:(NSDictionary*)params
//{
//    NSMutableString * mstr = [[NSMutableString alloc] init];
//    for (NSString * key in params.allKeys) {
//        [mstr appendFormat:@"%@=%@&",key,params[key]];
//    }
//    return [[mstr substringToIndex:mstr.length-1] dataUsingEncoding:NSUTF8StringEncoding];
//}
/**
 *  支付(微信支付/支付宝支付)
 *  @param paramDic     订单基本信息
 *  @param resBlock      支付结果回调Block
 */
//- (void)PayOrderChandelWithOrderInfo:(NSDictionary *)paramDic
//                                      WithType:(PayType)type
//                                    Block:(PayBlock)resBlock
//{
//    NSString *payUrlStr = @"此处为后台提供的支付接口";
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:payUrlStr]];
//    request.HTTPMethod = @"POST";
//    request.HTTPBody = [self getHttpDataFromParam:paramDic];
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        MJWeakSelf;
//        if (error == nil){
//
//            if (type == Alipay) { //支付宝支付
//                NSLog(@"%@",data);
//                NSString *result =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                NSLog(@"支付宝拉起信息:%@",result);
//
//                NSString *appScheme = @"aidingdongalipay";
//
//                if (@available(iOS 13.0,*)) {
//                    [[AlipaySDK defaultService] payOrder:result
//                                           dynamicLaunch:YES
//                                              fromScheme:appScheme
//                                                callback:^(NSDictionary *resultDic) {
//                        [weakSelf alipayResp:resultDic];
//                    }];
//                }else{
//                    [[AlipaySDK defaultService] payOrder:result
//                                              fromScheme:appScheme
//                                                callback:^(NSDictionary *resultDic) {
//                        [weakSelf alipayResp:resultDic];
//                    }];
//                }
//            }else if (type == WXPay){ // 微信支付
//
//                NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//                NSLog(@"%@",responseObject);
//                NSDictionary * WXdic = [NSDictionary dictionary];
//                WXdic = responseObject;
//                 //调用TenPaySdk进行支付
//                 NSString *stamp = WXdic[@"timestamp"];
//                 //调起微信支付
//                 PayReq * req = [[PayReq alloc] init];
//                 req.openID = WXdic[@"appid"];
//                 req.partnerId = WXdic[@"partnerid"]; // 商户号
//                 req.prepayId = WXdic[@"prepayid"]; // 预支付交易会话ID
//                 req.nonceStr = WXdic[@"noncestr"]; // 随机字符串
//                 req.timeStamp = stamp.intValue; // 时间戳
//                 /** 微信版本不同,该字段可能不同*/
//                 req.package = @"Sign=WXPay"; //扩展字段
//                 req.sign = WXdic[@"sign"]; //签名
//
////                    [WXApi sendReq:req completion:^(BOOL success) {
////                        if (!success) {
////                           resBlock(NO,@"没有安装微信");
////                        }
////                    }];
//                [WXApi sendReq:req];
//            }
//
//        }else{
//
//        }
//        self.block = resBlock;
//     } ] resume];
//}
//#pragma mark - 支付宝回调处理 -
//- (void)alipayResp:(NSDictionary *)resultDic{
//    NSString *resultStatus = resultDic[@"resultStatus"];
//    switch ([resultStatus integerValue]) {
//        case 9000: //订单支付成功
//        {
//            self.block(YES,@"订单支付成功");
//        }
//            break;
//        case 8000: //正在处理中，支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态
//        {
//            self.block(NO,@"订单处理中，请稍后查询订单列表");
//        }
//            break;
//        case 4000: //订单支付失败
//        {
//            self.block(NO,@"订单支付失败");
//        }
//            break;
//        case 5000: //重复请求
//        {
//            self.block(NO,@"请勿重复请求支付");
//        }
//            break;
//        case 6001: //用户中途取消
//        {
//            self.block(NO,@"中途取消支付");
//        }
//            break;
//        case 6002: //网络连接出错
//        {
//            self.block(NO,@"网络连接出错,请检查网络");
//        }
//            break;
//        case 6004: //支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态
//        {
//            self.block(NO,@"订单处理中，请稍后查询订单列表");
//        }
//            break;
//
//        default:{
//
//        }
//            break;
//    }
//}

//#pragma mark - 微信支付回调 -
//#pragma mark - WXApiDelegate
//- (void)onResp:(BaseResp*)resp{
//    if([resp isKindOfClass:[PayResp class]])
//    {
//        // 支付返回结果，实际支付结果需要去微信服务器端查询
//        PayResp *response = (PayResp*)resp;
//        switch (response.errCode) {
//            case WXSuccess:
//            {
//                NSLog(@"微信支付-成功");
//                self.block(YES,@"订单支付成功");
//                break;
//            }
//            case WXErrCodeUserCancel:
//            {
//                NSLog(@"微信支付-用户点击取消");
//                self.block(NO,@"中途取消支付");
//                break;
//            }
//            default:
//                self.block(NO,@"订单处理中，订单状态未知");
//                break;
//        }
//    }
//}



@end
