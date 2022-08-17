//
//  ZWPullMenuConfig.h
//  ZWPullMenuDemo
//
//  Created by 王子武 on 2019/2/15.
//  Copyright © 2019 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

#define MenuContentMargin       15          //默认文本图片边距
#define MenuImageWidth          20          //默认图片最小尺寸
#define MenuBorderMinMargin     10          //默认下拉框边界围栏
#define MenuTitleFontSize       15          //默认文本字体大小

@interface ZWPullMenuConfig : NSObject
//文本图片边距
@property (nonatomic, assign) CGFloat zw_menuContentMargin;
//图片最小尺寸
@property (nonatomic, assign) CGFloat zw_menuImageWidth;
//下拉框边界围栏
@property (nonatomic, assign) CGFloat zw_menuBorderMinMargin;
//文本字体大小
@property (nonatomic, assign) CGFloat zw_menuTitleFontSize;

@end

/**
 使用方法：
 导入头文件
 #import "ZWPullMenuView.h"
 #import "UIView+LXShadowPath.h"
 
 使用
 - (void)chandleBtn:(UIButton *)sender
 {
     NSArray *titleArray = @[@"批量移入回收站",@"导入",@"导出",@"新增客户"];
     NSArray *imageArray = @[@"pl_shanchu",@"icon-test-2",@"icon-test",@"tianjia-2"];
     ZWPullMenuView *menuView = [ZWPullMenuView pullMenuAnchorView:sender
                             titleArray:titleArray
                             imageArray:imageArray];
     menuView.zwPullMenuStyle = 2;
     menuView.blockSelectedMenu = ^(NSInteger menuRow) {
 //        NSLog(@"index = %ld",(long)menuRow);
         if (menuRow == 0) {
             // 批量移入回收站
             [self po_batchHsz];
         }else if (menuRow == 1){
             // 导入
             [self uploadFileBtn];
         }else if(menuRow == 2){
             // 导出
             [self downloadFile];
         }else{
             // 新增客户信息
             JYAddCustomerController *addCustomerVc = [[JYAddCustomerController alloc]init];
     //        addCustomerVc.customerMsgListModel = self.customerMsgListModel; // 因为是直接新增信息，所以不需要回显传值
             addCustomerVc.customerMsgListModel = [[JYCustomerMsgListModel alloc]init];
             addCustomerVc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:addCustomerVc animated:YES];
         }
     };
 }
 
 */

NS_ASSUME_NONNULL_END
