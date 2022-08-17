//
//  LBTabBarController.m
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import "LBTabBarController.h"
// tabBar类
#import "JYIndexViewController.h"
#import "JYMineViewController.h"

@interface LBTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic,assign) NSInteger  indexFlag;
@end

@implementation LBTabBarController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = RGB(102, 102, 102);
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];

    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor blackColor];
    dictSelected[NSFontAttributeName] = FontMedium(11);

    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
    if (@available(iOS 13.0, *)) {
        [[UITabBar appearance] setUnselectedItemTintColor:[UIColor darkGrayColor]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildVc];
     self.indexFlag = 0;
    
    if (@available(iOS 13.0, *)) {
        self.tabBar.tintColor = [UIColor colorWithHexString:@"333333"];
        UITabBarAppearance *appearance = [UITabBarAppearance new];
        [appearance configureWithOpaqueBackground];
        appearance.backgroundColor = [UIColor whiteColor];
        self.tabBar.standardAppearance = appearance;
        /// 这里有点区别。导航栏是iOS13开始。这里是iOS15才有的
        if (@available(iOS 15.0, *)) {
            self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance;
        }
    }
}

- (void)setUpAllChildVc
{
    JYIndexViewController *HomeVC = [[JYIndexViewController alloc] init];
    [self setUpOneChildVcWithVc:HomeVC Image:@"nav_home_default" selectedImage:@"nav_home_selection" title:@"首页"];

    JYMineViewController *MineVC = [[JYMineViewController alloc] init];
    [self setUpOneChildVcWithVc:MineVC Image:@"nav_user_default" selectedImage:@"nav_user_selection" title:@"我的"];
}

- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    ZXNavigationBarNavigationController *nav = [[ZXNavigationBarNavigationController alloc] initWithRootViewController:Vc];
    Vc.view.backgroundColor = [UIColor whiteColor];
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.image = myImage;
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.selectedImage = mySelectedImage;
    Vc.tabBarItem.title = title;
    Vc.navigationItem.title = title;
    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
}

@end
