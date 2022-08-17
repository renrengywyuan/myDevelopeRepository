//
//  JYOnLineLookFilesController.m
//  FisherySystem
//
//  Created by Mr.吕 on 2022/8/9.
//  在线预览文件【Excel、pdf、word】

#import "JYOnLineLookFilesController.h"
#import <QuickLook/QuickLook.h>
#import "JYWKWebViewController.h"

@interface JYOnLineLookFilesController ()<UITableViewDelegate,UITableViewDataSource,QLPreviewControllerDataSource,QLPreviewControllerDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *datas;
// 在线预览
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *urlStr;
@property (nonatomic, strong) NSString *fileName;
@end

@implementation JYOnLineLookFilesController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"在线预览";
    
    self.datas = @[@"pdf",@"word",@"Excel",@"ppt",@"Video",@"Image"];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.frame = CGRectMake(0, ZXNavBarHeight, KScreenW, KScreenH-ZXNavBarHeight);
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 0) {
//        NSString *path = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/202208091621599312020.pdf"]];
//        BOOL isExit = [path hasSuffix:@"202208091621599312020.pdf"];
//        NSLog(@"路径：%@", path);
//        NSLog(@"判断路径中是否存在：%i", isExit);
//        if (isExit == 1) {
////             在路径中已经存在该文件
//            [self initQLPreviewControllerFileName:path];
//        }else{
////             不存在，需要下载
//            [self downloadFilesId:@"115"]; // pdf
//        }
        
        
        JYWKWebViewController *excelVc = [[JYWKWebViewController alloc]init];
        excelVc.fileID = @"115";
        [self.navigationController pushViewController:excelVc animated:YES];
        
    }else if (indexPath.row == 1){
//        NSString *path = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/人力资源项目业务需求说明书(1).doc"]];
//        BOOL isExit = [path hasSuffix:@"人力资源项目业务需求说明书(1).doc"];
//        NSLog(@"路径：%@", path);
//        NSLog(@"判断路径中是否存在：%i", isExit);
//        if (isExit == 1) {
//            // 在路径中已经存在该文件
//            [self initQLPreviewControllerFileName:path];
//        }else{
//             不存在，需要下载
//            [self downloadFilesId:@"116"]; // Word
//        }
        
        
        JYWKWebViewController *excelVc = [[JYWKWebViewController alloc]init];
        excelVc.fileID = @"116";
        [self.navigationController pushViewController:excelVc animated:YES];
        
    }else if (indexPath.row == 2){
//        [self downloadFilesId:@"117"]; // Excel
        
        JYWKWebViewController *excelVc = [[JYWKWebViewController alloc]init];
        excelVc.fileID = @"117";
        [self.navigationController pushViewController:excelVc animated:YES];


    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.000001;
}

//#pragma mark - QLPreviewController delegate
//
//- (void)downloadFilesId:(NSString *)IDStr
//{
//    BAFileDataEntity *entity = [BAFileDataEntity new];
//    entity.urlString = [NSString stringWithFormat:@"%@%@?recordId=%@",API_Interface,hr_record_po_downLoad,IDStr];
//    NSLog(@"api = %@",entity.urlString);
//    [BANetManager ba_downLoadFileWithEntity:entity successBlock:^(id response) {
//        NSLog(@"下载文件data = %@",response);
//        [self initQLPreviewControllerFileName:response];
//    } failureBlock:^(NSError *error) {
//
//    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
//
//    }];
//}
//
//- (void)initQLPreviewControllerFileName:(NSString *)fileName
//{
//    self.fileName = [fileName lastPathComponent];
//
//    QLPreviewController *qlpreVc = [[QLPreviewController alloc] init];
//    qlpreVc.delegate = self;
//    qlpreVc.dataSource = self;
//    [self addChildViewController:qlpreVc];
//    qlpreVc.view.frame = CGRectMake(0, ZXNavBarHeight, KScreenW, KScreenH-ZXNavBarHeight);
//    [self.view addSubview:qlpreVc.view];
//}
//
//- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
//{
//    return 1;
//}
//
//- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *docDir = [paths objectAtIndex:0];
//    NSURL *url =  [NSURL fileURLWithPath:[docDir stringByAppendingPathComponent:self.fileName]];
//    return url;
//}

@end
