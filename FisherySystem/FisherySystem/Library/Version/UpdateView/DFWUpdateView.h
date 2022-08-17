//
//  DFWUpdateView.h
//  RenRenCiShanJia
//
//  Created by 吕文苑 on 2017/4/21.
//  Copyright © 2017年 sugarskylove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFWUpdateView : UIView

- (void)showWithVersion:(NSString *)version message:(NSString *)message tapBlock:(void (^)(BOOL isUpdate))tapBlock;

@end
