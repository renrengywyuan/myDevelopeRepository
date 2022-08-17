//
//  ZWPullMenuModel.h
//  ZWPullMenuDemo
//
//  Created by 王子武 on 2017/8/28.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ZWPullMenuStyle) {
    PullMenuDarkStyle = 0,  //类微信、黑底白字
    PullMenuLightStyle = 1, //类支付宝、白底黑字
    PullMenuTransparentStyle = 2 // 蒙版透明->但须添加底部阴影
};
@interface ZWPullMenuModel : NSObject
/** 
 * 文字
 */
@property (nonatomic, copy) NSString *title;
/** 
 * 图片
 */
@property (nonatomic, copy) NSString *imageName;
/**
 * 分隔线
 */
@property (nonatomic, copy) NSString *lineColor;
@end
NS_ASSUME_NONNULL_END
