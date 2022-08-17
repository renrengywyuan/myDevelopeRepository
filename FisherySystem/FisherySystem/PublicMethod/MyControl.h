//
//  MyControl.h
//  Mr.吕
//
//  Created by apple on 2020/11/18.
//  Copyright © 2020 Mr.吕. All rights reserved.
//  常用相关方法

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//#import <Foundation/Foundation.h>
@interface MyControl : NSObject

#pragma mark - 根据URLScheme判断是否安装某个APP
+(BOOL)checkAPPIsExist:(NSString*)URLScheme;

#pragma mark - 读取本地JSON文件
+ (NSDictionary *)readLocalFileWithName:(NSString *)name;

#pragma mark - 创建button
+(UIButton*)createButtonFrame:(CGRect)frame Title:(NSString*)title BgImageName:(NSString*)bgImageName ImageName:(NSString*)imageName Method:(SEL)sel target:(id)target;
#pragma mark -/** 倒计时*/
+ (void)countDownSeconds:(void (^)(NSString * resultStr))resultStr;
#pragma mark - 手机正则
/** 手机正则
 * @param phoneNumber 手机号码
 */
+ (BOOL)isPhoneNumber:(NSString *)phoneNumber;
#pragma mark - 邮箱正则
/** 邮箱正则
 * @param email 邮箱
 */
+ (BOOL)validateEmail:(NSString *)email;

#pragma mark - 富文本调整颜色(由前至后) -
/** 富文本调整颜色(由前至后)
 *  @param originStr 源字符串
 *  @param position  改变颜色的位置
 *  @param color     要改变的颜色
 */
+ (NSMutableAttributedString *)originalStr:(NSString *)originStr  position:(NSInteger)position color:(UIColor *)color;

#pragma mark - 检查相机使用权限 -
/** 检查相机使用权限*/
+ (BOOL)checkCameraJurisdiction;

#pragma mark - 计算日期间隔天数 -
/** 计算日期间隔天数
 * @param serverDate 起始
 * @param endDate    结束
 */
+(NSInteger)getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate;

#pragma mark - 展示信息alert -
/** 展示信息alert*/
+ (void)alertShow:(NSString *)alertMessage;

#pragma mark - 判断是否登陆 -
/** 判断是否登陆*/
+ (BOOL)MBBisLogionSuccess;

#pragma mark - 判断当前页是否登陆 登陆并跳转下一页;  未登录时push可为nil) -
/** 判断当前页是否登陆 登陆并跳转下一页;  未登录时push可为nil)
 *  @param presentVC  当前视图控制器
 *  @param pushVC     push视图控制器
 */
+ (void)CheckOutPresentVCLogin:(UIViewController *)presentVC isLoginToPush:(UIViewController *)pushVC;

#pragma mark - 截图 -
/** 
 *  @param view     被截视图图
 */
+ (UIImage *)screenShotView:(UIView *)view;

#pragma mark - 裁剪图片 -
/**
 注：若裁剪范围超出原图尺寸，则会用背景色填充缺失部位
 *
 *  @param image     原图
 *  @param Point     坐标
 *  @param Size      大小
 *  @param backColor 背景色
 *
 *  @return 新生成的图片
 */
+(UIImage *)cutImageWithImage:(UIImage *)image
                      atPoint:(CGPoint)Point
                     withSize:(CGSize)Size
              backgroundColor:(UIColor *)backColor;

#pragma mark -/** 生成图片*/
+ (UIImage *)createImageWithColor:(UIColor *)color;

#pragma mark - Model模型转字典 -
+ (NSDictionary *)dicFromObject:(NSObject *)object;

#pragma mark - 将数组转换成json格式字符串,不含 这些符号 -
+ (NSString *)gs_jsonStringCompactFormatForNSArray:(NSArray *)arrJson;

#pragma mark - 将字典转换成json格式字符串,不含 这些符号 -
+ (NSString *)gs_jsonStringCompactFormatForDictionary:(NSDictionary *)dicJson;

#pragma mark - 将字典转换成json格式字符串,含 这些符号,便于阅读 -
+ (NSString *)gs_jsonStringPrettyPrintedFormatForDictionary:(NSDictionary *)dicJson;
#pragma mark - 将url解析成字典样式 - 提取url中参数 -
+ (NSMutableDictionary *)parseURLParameters:(NSString *)url;

#pragma mark - 将字符串内容写入txt，并存在沙盒中 -
+ (void)writeToTXTFileWithString:(NSString *)string fileName:(NSString *)fileName;

#pragma mark - 正则匹配11位手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;
#pragma mark - 正则匹配用户密码6-12位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
#pragma mark - 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName;
#pragma mark - 正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
#pragma mark - 正则匹配URL
+ (BOOL)checkURL : (NSString *) url;
#pragma mark - 正则匹配是否为纯数字
+ (BOOL)checkIsOnlyNumber:(NSString *) onlyNumber;
#pragma mark - 正则匹员工号,6位的数字
+ (BOOL)checkSixEmployeeNumber : (NSString *) number;

#pragma mark - 获取设备型号，该型号就是 设置->通用->关于手机->型号名称
+ (NSString *)getDeviceModelName;

#pragma mark - 检查是否登录iCloud -
+ (BOOL)isiCloud;

@end
