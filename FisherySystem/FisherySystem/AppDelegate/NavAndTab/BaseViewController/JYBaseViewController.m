//
//  JYBaseViewController.m
//  FisherySystem
//
//  Created by Mr.吕 on 2022/7/12.
//

#import "JYBaseViewController.h"

@interface JYBaseViewController ()

@end

@implementation JYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.zx_navStatusBarStyle = ZXNavStatusBarStyleDefault;
    self.zx_showNavHistoryStackContentView = YES;
    self.zx_navBarBackgroundColor = [UIColor whiteColor];
}

- (void)dealloc{
//    NSLog(@"%@-dealloc",[self class]);
}

@end
