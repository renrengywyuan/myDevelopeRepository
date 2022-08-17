//
//  AYCheckManager.m
//  AYCheckVersion
//  com.ayjkdev.AYCheckVersion
//  Created by Andy on 16/4/6.
//  Copyright © 2016年 AYJkdev. All rights reserved.
//

#import "AYCheckManager.h"
#import "DFWUpdateView.h"
#import <StoreKit/StoreKit.h>
#import "AFNetworking.h"


#define REQUEST_SUCCEED 200

#define CURRENT_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define BUNDLE_IDENTIFIER [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

#define SYSTEM_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))

#define TRACK_ID @"TRACKID"

#define APP_LAST_VERSION @"APPLastVersion"

#define APP_RELEASE_NOTES @"APPReleaseNotes"

#define APP_TRACK_VIEW_URL @"APPTRACKVIEWURL"

#define SPECIAL_MODE_CHECK_URL @"https://itunes.apple.com/lookup?country=%@&bundleId=%@"

#define NORMAL_MODE_CHECK_URL @"https://itunes.apple.com/lookup?bundleId=%@"

#define SKIP_CURRENT_VERSION @"SKIPCURRENTVERSION"

#define SKIP_VERSION @"SKIPVERSION"

@interface AYCheckManager ()<SKStoreProductViewControllerDelegate>

@property (nonatomic, copy) NSString *nextTimeTitle;

@property (nonatomic, copy) NSString *confimTitle;

@property (nonatomic, copy) NSString *alertTitle;

@property (nonatomic, copy) NSString *skipVersionTitle;

@end

@implementation AYCheckManager

static AYCheckManager *checkManager = nil;
+ (instancetype)sharedCheckManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        checkManager = [[AYCheckManager alloc] init];
        checkManager.nextTimeTitle = @"稍后再说";
        checkManager.confimTitle = @"前往更新";
        checkManager.alertTitle = @"检测到新版本";
        checkManager.skipVersionTitle = nil;
    });
    return checkManager;
}

- (void)checkVersion {
    
    [self checkVersionWithAlertTitle:self.alertTitle nextTimeTitle:self.nextTimeTitle confimTitle:self.confimTitle];
}

- (void)checkVersionWithAlertTitle:(NSString *)alertTitle nextTimeTitle:(NSString *)nextTimeTitle confimTitle:(NSString *)confimTitle {
    
    [self checkVersionWithAlertTitle:alertTitle nextTimeTitle:nextTimeTitle confimTitle:confimTitle skipVersionTitle:nil];
}

- (void)checkVersionWithAlertTitle:(NSString *)alertTitle nextTimeTitle:(NSString *)nextTimeTitle confimTitle:(NSString *)confimTitle skipVersionTitle:(NSString *)skipVersionTitle {
    
    self.alertTitle = alertTitle;
    self.nextTimeTitle = nextTimeTitle;
    self.confimTitle = confimTitle;
    self.skipVersionTitle = skipVersionTitle;
    
//    [checkManager getInfoFromAppStore];
    
    [self getInfoFromTestFlight];
}

#pragma mark - TestFlight 专用 -
- (void)getInfoFromTestFlight
{
    //获取app版本信息
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString *currentVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//
//    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
//    dict[@"currentVersion"] = currentVersion;
//    dict[@"appId"] = @"UKUOfferMainIOS1"; // 后台自定义的固定appId
//    [[RequestTool sharedInstance] RequestURL:checkLatestVersion HttpMethod:@"POST" Parameters:dict Success:^(id responseObject) {
//        if ([responseObject[@"status"] intValue] == 200) {
//
//            NSLog(@"TestFlight版本更新 = %@",responseObject);
//
//            NSString *versionService = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"version"]]; // 更新版本
//            NSString *updateUrlService = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"updateUrl"]]; // 更新地址
//
////            NSString *descriptionService = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"description"]]; // 更新描述
////            NSString *forceUpdateService = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"forceUpdate"]]; // 前置更新
//
//            if ([currentVersion isEqualToString:versionService]) {
//                NSLog(@"版本相同 不用更新");
//                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"updateVersion"];
//                [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"updateVersion"];
//            }else
//            {   NSArray * newVerAry = [versionService componentsSeparatedByString:@"."];
//                NSArray * curVerAry = [currentVersion componentsSeparatedByString:@"."];
//                for (int i = 0; i < [newVerAry count] || i < [curVerAry count]; i++)
//                {
//                    int newSubVer, curSubVer;
//
//                    if (i >= [newVerAry count])
//                    {
//                        newSubVer = 0;
//                    }
//                    else
//                    {
//                        newSubVer = [[newVerAry objectAtIndex:i] intValue];
//                    }
//
//                    if( i >= [curVerAry count])
//                    {
//                        curSubVer = 0;
//                    }
//                    else
//                    {
//                        curSubVer = [[curVerAry objectAtIndex:i] intValue];
//                    }
//
//                    if( newSubVer > curSubVer)
//                    {
//                        NSLog(@"当前版本低 ，需要更新");
//
//                        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"updateVersion"];
//                        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"updateVersion"];
//                        NSLog(@"version == yes");
//
//                        NSString *updateMessage = UPDATECONTENT;
//                        DFWUpdateView *updateView = [[DFWUpdateView alloc] init];
//                        @weakify(self);
//                        [updateView showWithVersion:@"" message:updateMessage tapBlock:^(BOOL isUpdate) {
//                            @strongify(self);
//                            if (isUpdate == YES) {
//                                [self openAPPStore:updateUrlService];
//                            }
//                        }];
//
//                        // 更新时清除启动页缓存
//                        NSError *error;
//                        [NSFileManager.defaultManager removeItemAtPath:[NSString stringWithFormat:@"%@/Library/SplashBoard",NSHomeDirectory()] error:&error];
//                        if (error) {
//                            NSLog(@"Failed to delete launch screen cache: %@",error);
//                        }
//
//                        return;
//                    }
//                    else if(newSubVer < curSubVer)
//                    {
//                        NSLog(@"当前版本高 不需要更新");
//                        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"updateVersion"];
//                        [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"updateVersion"];
//                        return;
//                    }
//                }
//            }
//        }else{
//            [LEEAlert alert].config
//            .LeeTitle(@"提示")
//            .LeeContent(@"版本获取失败")
//            .LeeAction(@"确定", ^{
//
//            })
//            .LeeShow();
//        }
//        } Failure:^(NSError *error, NSDictionary *errorDict, NSInteger httpStatusCode) {
//            [LEEAlert alert].config
//            .LeeTitle(@"提示")
//            .LeeContent(@"版本获取失败")
//            .LeeAction(@"确定", ^{
//
//            })
//            .LeeShow();
//        }];
    
 
}

#pragma mark - App Store 专用 -
- (void)getInfoFromAppStore
{
    NSString *requestURL;
    if (self.countryAbbreviation == nil) {
        requestURL = [NSString stringWithFormat:NORMAL_MODE_CHECK_URL,BUNDLE_IDENTIFIER];
    } else {
        requestURL = [NSString stringWithFormat:SPECIAL_MODE_CHECK_URL,self.countryAbbreviation,@"com.ukuoffer.youluwang"];
    }
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 60;
    [manager POST:requestURL parameters:nil headers:@{} progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"resultCount"] intValue] == 1) {
            NSArray *resultsArr = responseObject[@"results"];
            NSMutableDictionary *infodic = [resultsArr objectAtIndex:0];
            NSString *latestVersion = [infodic objectForKey:@"version"];
            NSString *trackViewUrl = [infodic objectForKey:@"trackViewUrl"];
            NSLog(@"App下载地址:%@",trackViewUrl);
            NSLog(@"LatestVersion=%@",latestVersion);
            
            [[NSUserDefaults standardUserDefaults]setObject:trackViewUrl forKey:@"trackViewUrl"];
            NSLog(@"DownloadUrl = %@",trackViewUrl);
            NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
            NSString *currentVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
            NSLog(@"当前版本号是%@",currentVersion);
            NSLog(@"DoubleCurrent=%@",currentVersion);
            if ([currentVersion isEqualToString:latestVersion]) {
                NSLog(@"版本相同 不用更新");
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"updateVersion"];
                [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"updateVersion"];
            }else
            {   NSArray * newVerAry = [latestVersion componentsSeparatedByString:@"."];
                NSArray * curVerAry = [currentVersion componentsSeparatedByString:@"."];
                for (int i = 0; i < [newVerAry count] || i < [curVerAry count]; i++)
                {
                    int newSubVer, curSubVer;
                    
                    if (i >= [newVerAry count])
                    {
                        newSubVer = 0;
                    }
                    else
                    {
                        newSubVer = [[newVerAry objectAtIndex:i] intValue];
                    }
                    
                    if( i >= [curVerAry count])
                    {
                        curSubVer = 0;
                    }
                    else
                    {
                        curSubVer = [[curVerAry objectAtIndex:i] intValue];
                    }
                    
                    if( newSubVer > curSubVer)
                    {
                        NSLog(@"当前版本低 ，需要更新");
                        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"updateVersion"];
                        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"updateVersion"];
                        NSLog(@"version == yes");
                        
                        NSString *updateMessage = [NSString stringWithFormat:@"%@",[infodic objectForKey:@"releaseNotes"]];
                        DFWUpdateView *updateView = [[DFWUpdateView alloc] init];
                        @weakify(self);
                        [updateView showWithVersion:latestVersion message:updateMessage tapBlock:^(BOOL isUpdate) {
                            @strongify(self);
                            if (isUpdate == YES) {
                                [self openAPPStore:@"itms-apps://itunes.apple.com/cn/app/id1563616980?mt=8"];
                            }
                        }];
                        
                        // 版本更新后重新登录
//                        [MBBToolMethod cleanUserInfoLogOut];
//                        [HLNewUserManger clearUserInfor];
                        return;
                    }
                    else if(newSubVer < curSubVer)
                    {
                        NSLog(@"当前版本高 不需要更新");
                        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"updateVersion"];
                        [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"updateVersion"];
                        return;
                    }
                }
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)openAPPStore:(NSString *)updateUrl {
    
    /**
     
     综合信息
     
     套装 ID 套装 ID 必须与您在 Xcode 中使用的 ID 相符。该 ID 在您上传第一个构建版本后便无法更改。
      com.leimingtech.jinzu
     
     SKU 您 App 专有的 ID，此 ID 不会在 App Store 中显示。
     com.leimingtech.jinzu
     
     Apple ID 为您的 App 自动生成的 ID。
     1515218128
     
     **/
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if (!self.openAPPStoreInsideAPP) {
        
//        NSString *str = updateUrl; // App Store 跳转只需更换id即可
        
        NSString *str = updateUrl; // TestFlight 跳转
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    } else {
        SKStoreProductViewController *storeViewController = [[SKStoreProductViewController alloc] init];
        storeViewController.delegate = self;
        
        NSDictionary *parametersDic = @{SKStoreProductParameterITunesItemIdentifier:[userDefault objectForKey:TRACK_ID]};
        [storeViewController loadProductWithParameters:parametersDic completionBlock:^(BOOL result, NSError * _Nullable error) {
            
            if (result) {
                [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:storeViewController animated:YES completion:^{
                    
                }];
            }
        }];
    }
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    
    [[UIApplication sharedApplication].delegate.window.rootViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end

// 有路网正式包名下载链接：itms-apps://itunes.apple.com/cn/app/id1563616980?mt=8


/*
 
 ios的下载链接中?mt=8||?mt=12的含义
 
 1   Music
 2   Podcasts
 3   Audiobooks
 4   TV Shows
 5   Music Videos
 6   Movies
 7   iPod Games
 8   Mobile Software Applications
 9   Ringtones
 10  iTunes U
 11  E-Books
 12  Desktop Apps
 
 */






