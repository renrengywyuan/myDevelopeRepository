//
//  ZXNavHistoryStackModel.h
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/12/22.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//
//  V1.4.1

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum {
    ZXNavHistoryStackViewStyleLight = 0x00,    // 历史堆栈浅色模式
    ZXNavHistoryStackViewStyleDark = 0x01,    // 历史堆栈深色模式
}ZXNavHistoryStackViewStyle;
NS_ASSUME_NONNULL_BEGIN

@interface ZXNavHistoryStackModel : NSObject
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UIViewController *viewController;
@property (assign, nonatomic) BOOL isSelected;
@property (assign, nonatomic) BOOL isLast;
@end

NS_ASSUME_NONNULL_END
