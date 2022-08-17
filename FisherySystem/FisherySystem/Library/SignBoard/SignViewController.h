//
//  SignViewController.h
//  InvestmentAssistant
//
//  Created by Mr.吕 on 2022/8/8.
//  自定义画布 - 签字版
//

#import <UIKit/UIKit.h>

@protocol SignDelegate <NSObject>

- (void)signCompleteWithImage:(UIImage *)img base64str:(NSString *)base64str;
@optional
- (void)backMethod;

@end


@interface SignViewController : UIViewController

/** pop出栈 */
- (void)popViewController;
/** 当前NavC是否可以左滑返回，ViewDidLoad中设置 */
@property (nonatomic, assign) BOOL gesturePopEnable;

@property (nonatomic, weak) id<SignDelegate> delegate;

@end
