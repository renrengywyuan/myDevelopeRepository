//
//  JYWKWebViewController.m
//  FisherySystem
//
//  Created by Mr.吕 on 2022/8/10.
//

#import "JYWKWebViewController.h"
#import <WebKit/WebKit.h>
#import "JYLoading.h"

@interface JYWKWebViewController ()<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic, strong) WKWebView *  previewWebView;
@end

@implementation JYWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"WKWebView文件预览";
    
//    NSString *jsString = @"var script = document.createElement('meta');"
//    "script.name = 'viewport';"
//    "script.content=\"width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=yes\";"
//    "document.getElementsByTagName('head')[0].appendChild(script);";
    
    [MyProgressHUD showWithStatus:@"正在加载"];
    
    // 自适应屏幕宽度js
    NSString *jsString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width', 'height=device-height'); document.getElementsByTagName('head')[0].appendChild(meta); var imgs = document.getElementsByTagName('img');for (var i in imgs){imgs[i].style.maxWidth='100%';imgs[i].style.height='auto';}";
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:jsString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [configuration.userContentController addUserScript:userScript];
    self.previewWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, ZXNavBarHeight, KScreenW, KScreenH-ZXNavBarHeight) configuration:configuration];
    self.previewWebView.navigationDelegate = self;
    self.previewWebView.UIDelegate = self;
    [self.view addSubview:self.previewWebView];
    
    [self downloadFilesId:self.fileID];
}

- (void)downloadFilesId:(NSString *)IDStr
{
    BAFileDataEntity *entity = [BAFileDataEntity new];
    entity.urlString = [NSString stringWithFormat:@"%@%@?recordId=%@",API_Interface,hr_record_po_downLoad,IDStr];
    NSLog(@"api = %@",entity.urlString);
    [BANetManager ba_downLoadFileWithEntity:entity successBlock:^(id response) {
        NSLog(@"下载文件data = %@",response);
        
//        NSURL *fileURL = [NSURL fileURLWithPath:response];
//        NSURL *accessURL = [fileURL URLByDeletingLastPathComponent];
//        [self.webView loadFileURL:fileURL allowingReadAccessToURL:accessURL];
        
        NSURL *accessURL = [[NSURL fileURLWithPath:response] URLByDeletingLastPathComponent];
        [self.previewWebView loadFileURL:[NSURL fileURLWithPath:response] allowingReadAccessToURL:accessURL];
        
    } failureBlock:^(NSError *error) {

    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {

    }];
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"页面开始加载时调用");
//    [MyProgressHUD showWithStatus:@"正在加载"];
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"当内容开始返回时调用");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"页面加载完成之后调用");
    [MyProgressHUD dismiss];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"页面加载失败时调用");
}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView
{
//    [self.previewWebView reload];
    NSLog(@"webViewWebContentProcessDidTerminate");
    exit(0);
}

@end
