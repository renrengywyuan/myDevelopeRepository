//
//  AppManager.h
//  Mr.吕
//
//  Created by LWY on 2019/6/26.
//  Copyright © 2019 Mr.吕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

/**
 *  压缩成功Block
 *
 *  @param resultPath 返回压缩成功的视频路径
 */
typedef void (^CompressionSuccessBlock)(NSString *resultPath, float memorySize, NSString *fileName); // 定义成功的Block 函数
/**
 支付方式
 */
//typedef NS_ENUM(NSUInteger, PayType) {
//    Alipay = 1,//支付宝支付
//    WXPay,//微信支付
//    OtherPay
//};
//typedef void(^PayBlock)(BOOL success,NSString * msg);

@interface AppManager : NSObject

+(instancetype)shareInstance;

#pragma mark - 获取系统信息
-(NSString *) getSystemVersion;

#pragma mark - 获取APP版本信息
-(NSString *) getAppVersion;

#pragma mark - 获取UUID信息
-(NSString *) getUUID;

#pragma mark -  获取IDFA
-(NSString *) getIDFA;

#pragma mark -  网络类型
- (NSString *)getNetType;

#pragma mark -  手机型号
-(NSString*)getIphoneType;

#pragma mark -  验证手机号码格式
- (BOOL)validatePhone:(NSString *)phone;

#pragma mark -  获取屏幕分辨率
- (CGFloat)getScreenScaleX;

#pragma mark -  获取当前时间
- (NSString *)getTimeStringForNow;

#pragma mark -  获取当前控制器
- (UIViewController *)getCurrentViewController;

#pragma mark -  获取时间差
 - (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime;

#pragma mark -  将NSDictionary转化为NSString -
/**
 将NSDictionary转化为NSString
 @param dict 字典
 @return 转化后的字符串
 */
+ (NSString *)translateDictionaryToString:(NSDictionary *)dict;

#pragma mark -  图片进行AES加密后，再进行base64加密
+ (NSString *)ansixData:(NSData *)imgData;

#pragma mark - 获取视频的第一帧截图, 返回UIImage - 需要导入AVFoundation.h
+ (UIImage*) getVideoPreViewImageWithPath:(NSURL *)videoPath;

#pragma mark - 从缓存路径获取照片
+ (UIImage *)getImageFromPath:(NSString *)path;

#pragma mark - 将Image保存到缓存路径中
+ (void)saveImage:(UIImage *)image toCachePath:(NSString *)path;

#pragma mark - 将视频保存到缓存路径中
+ (void)saveVideoFromPath:(NSString *)videoPath toCachePath:(NSString *)path;

#pragma mark - 视频压缩转码处理
/*
参数 sourceVideoURL ：被压缩视频的URL
参数 compressionType ： 压缩可选类型
参数 resultPathBlock ： 返回压缩后的视频路径
*/
+ (void)compressedVideoOtherMethodWithURL:(NSURL *)sourceVideoURL
                          compressionType:(NSString *)compressionType
                          compressionResultPath:(CompressionSuccessBlock)resultPathBlock;

#pragma mark - 清除沙盒文件中, 压缩后的视频所有, 在使用过压缩文件后, 不进行再次使用时, 可调用该方法, 进行删除 -
+ (void)removeCompressedVideoFromDocuments;

#pragma mark - 获取视频的大小
/**
 *  获取视频的大小
 *  @return 返回视频的大小 float 类型
 */
+ (float)countVideoTotalMemorySizeWithURL:(NSURL *)url;

#pragma mark - 短信倒计时设置 -
/**
 使用方法：
 
 // 发送验证码
 [MyControl countDownSeconds:^(NSString *resultStr) {
   if ([resultStr isEqualToString:@"重新获取"]) {
       sender.enabled = YES;
   }
 }];
 */
+ (void)countDownSeconds:(void (^)(NSString * resultStr))resultStr;

#pragma mark - 富文本调整颜色(由前至后) - 
/** 富文本调整颜色(由前至后)
 *  @param originStr 源字符串
 *  @param position  改变颜色的位置
 *  @param color     要改变的颜色
 */
+ (NSMutableAttributedString *)originalStr:(NSString *)originStr  position:(NSInteger)position color:(UIColor *)color;

#pragma mark 判断是否登陆 -
+ (BOOL)isLogionSuccess;

#pragma mark 判断当前页是否登陆 -
/**
 使用方法：
 UIViewController *VC = [[UIViewController alloc] init];
 [self.navigationController pushViewController:VC animated:NO];
 */
+ (void)CheckOutPresentVCLogin:(UIViewController *)presentVC
                 isLoginToPush:(UIViewController *)pushVC;

//#pragma mark 支付 -
///**
// *  支付(微信支付/支付宝支付)
// *  @param paramDic              订单基本信息
// *  @param resBlock      支付结果回调Block(成功:success,失败返回:failure)
// */
//- (void)PayOrderChandelWithOrderInfo:(NSDictionary *)paramDic
//                                      WithType:(PayType)type
//                                        Block:(PayBlock)resBlock;
//// 支付宝回调处理
//// @param resultDic 响应结果
//- (void)alipayResp:(NSDictionary *)resultDic;

@end

