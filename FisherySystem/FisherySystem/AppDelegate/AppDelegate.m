//
//  AppDelegate.m
//  FisherySystem
//
//  Created by Mr.吕 on 2022/7/8.
//

#import "AppDelegate.h"
#import "JYIndexViewController.h"
// AvoidCrash崩溃全面拦截工具
//#import "WOCrashProtectorManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#pragma mark - Crash安全防护系统 -
//    [WOCrashProtectorManager makeAllEffective];
#pragma mark - 根控制初始化控制 -
    [self oa_initWithRootViewController];
    
    return YES;
}

- (void)oa_initWithRootViewController
{
//    [NSThread sleepForTimeInterval:1.0];
    // 屏蔽约束警告⚠️
    [[NSUserDefaults standardUserDefaults] setValue:@(NO) forKey:@"_UIConstraintBasedLayoutLogUnsatisfiable"];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    JYIndexViewController *rootVC = [[JYIndexViewController alloc]init];
    ZXNavigationBarNavigationController *nav = [[ZXNavigationBarNavigationController alloc]initWithRootViewController:rootVC];
    LBTabBarController *tabBarVC = [[LBTabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
}

-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (self.allowRotation) {//当允许时，支持所有方向
        return UIInterfaceOrientationMaskAll;
    }
    //否则 就只有竖屏
    return UIInterfaceOrientationMaskPortrait;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//- (void)reciveCrashMessage:(NSNotification *)noti
//{
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    NSString *CrashLogStr = [NSString stringWithFormat:@"%@%@ CrashTime：%@ %@ %@ Crash_User_Message = %@ %@ errorPlace = %@ %@ errorReason = %@ %@ callStackSymbolsArr = %@",@"\n",@"========================日志======",noti.userInfo[@"CrashTime"],@"================================================================================================================",@"\n",noti.userInfo[@"Crash_User_Message"],@"\n",noti.userInfo[@"errorPlace"],@"\n",noti.userInfo[@"errorReason"],@"\n",noti.userInfo[@"callStackSymbolsArr"]];
//    dict[@"dateStr"] = CrashLogStr;
//    [[RequestTool sharedInstance] RequestURL:hr_writeDate_log HttpMethod:@"POST" Parameters:dict Success:^(id responseObject) {
//        if ([responseObject[@"code"]intValue]==200 || [responseObject[@"code"]intValue]==0) {
//            NSLog(@"日志上传成功！");
//        }else{
//            NSLog(@"日志上传失败！");
//        }
//    } Failure:^(NSError *error, NSDictionary *errorDict, NSInteger httpStatusCode) {
//
//    }];
//}


@end
