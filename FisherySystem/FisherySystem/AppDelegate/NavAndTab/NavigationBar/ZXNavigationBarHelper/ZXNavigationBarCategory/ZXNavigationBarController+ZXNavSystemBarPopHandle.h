//
//  ZXNavigationBarController+ZXNavSystemBarPopHandle.h
//  ZXNavigationBar
//
//  Created by Mr.吕 on 2020/5/29.
//  Copyright © 2020 北京聚源融合通讯科技有限公司. All rights reserved.
//  V1.4.1

//Thanks to @onegray https://github.com/onegray/UIViewController-BackButtonHandler Respect!

#import "ZXNavigationBarController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ZXBackButtonHandlerProtocol <NSObject>
@optional

-(BOOL)zx_navSystemBarPopHandle;
@end
@interface UIViewController (ZXNavSystemBarPopHandle)<ZXBackButtonHandlerProtocol>

@end

NS_ASSUME_NONNULL_END
