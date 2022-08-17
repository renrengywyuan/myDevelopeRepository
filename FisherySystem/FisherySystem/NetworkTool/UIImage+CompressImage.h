
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 * 简书    : http://www.jianshu.com/users/95c9800fdf47/latest_articles
 * 简书专题 : http://www.jianshu.com/collection/072d578bf782
 
 *********************************************************************************
 
 */


#import <UIKit/UIKit.h>

typedef UIImage JPEGImage;
typedef UIImage PNGImage;
typedef NSData JPEGData;
typedef NSData PNGData;

@interface UIImage (CompressImage)
/**
 *  传入图片,需要的大小,比例,得到压缩图片大小
 *      
 *      @prama image 需要压缩的图片
 *      @prama size  压缩后图片的大小
 *      @prama scale 压缩的比例 0.0 - 1.0
 *
 *      @return 返回新的图片
 */
+ (JPEGImage *)needCompressImage:(UIImage *)image size:(CGSize )size scale:(CGFloat )scale;
+ (JPEGImage *)needCompressImageData:(NSData *)imageData size:(CGSize )size scale:(CGFloat )scale;

/**
 *  传入图片,获取中间部分,需要的大小,压缩比例
 *
 *      @prama image 需要压缩的图片
 *      @prama size  压缩后图片的大小
 *      @prama scale 压缩的比例 0.0 - 1.0
 *
 *      @return 返回新的图片
 */
+ (JPEGImage *)needCenterImage:(UIImage *)image size:(CGSize )size scale:(CGFloat )scale;


/**
 *  png图片转为jpeg(jpg)图片
 *
 *      @prama image 需要转为jpeg的png图片
 *      
 *      @return 返回一张jpeg图片
 */
+ (JPEGImage *)jpegImageWithPNGImage:(PNGImage *)pngImage;
+ (JPEGImage *)jpegImageWithPNGData:(PNGData *)pngData;
+ (JPEGData *)jpegDataWithPNGData:(PNGData *)pngData;
+ (JPEGData *)jpegDataWithPNGImage:(PNGImage *)pngImage;

@end
