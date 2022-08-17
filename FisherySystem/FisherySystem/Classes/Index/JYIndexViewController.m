//
//  JYIndexViewController.m
//  FisherySystem
//
//  Created by Mr.吕 on 2022/7/12.
//

#import "JYIndexViewController.h"
#import "UIView+ZXNavFrameExtension.h"
#import "JYMoreViewController.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
/**签字版*/
#import "JYSignBoardViewController.h"
/**在线预览*/
#import "JYOnLineLookFilesController.h"
/**视频拍摄压缩上传*/
#import "JYVideoShootingController.h"

@interface JYIndexViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *datas;
@property (strong, nonatomic) NSArray *imagesURLStrings;
@property (strong, nonatomic) SDCycleScrollView *customCellScrollView;
@end

@implementation JYIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    [self setUpViewAndData];
}

- (void)setUpNav{
    //设置导航栏背景色RGB中Alpha为0
    self.zx_navBarBackgroundColorAlpha = 0;
    //设置最右侧按钮的图片和点击事件
    __weak typeof(self) weakSelf = self;
    self.zx_navItemSize = (25,25);
    [self zx_setRightBtnWithImgName:@"p_c" clickedBlock:^(ZXNavItemBtn * _Nonnull btn) {
        JYMoreViewController *vc = [[JYMoreViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    self.zx_navEnableSmoothFromSystemNavBar = YES;
    [self setLightNav];
    
    [self setPostRequestData];
    
//    [self NSArray_Test_InstanceArray];
}

// 崩溃测试
- (void)NSArray_Test_InstanceArray {
    
    NSString *nilStr = nil;
    NSArray *array = @[@"chenfanfang", nilStr, @"iOSDeveloper"];
    NSLog(@"%@",array);
}

/**post请求模拟*/
- (void)setPostRequestData
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"username"] = @"admin";
    dict[@"password"] = @"admin";
    
    BADataEntity *entity = [BADataEntity new];
    entity.urlString = sys_login;
    entity.needCache = NO;
    entity.parameters = dict;

    [BANetManager ba_request_POSTWithEntity:entity successBlock:^(id response) {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"post 请求数据结果：response *** %@", jsonDict);
        [self setGetRequestData];
    } failureBlock:^(NSError *error) {
        NSLog(@"post 请求数据结果：error *** %@", error);
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}

/**get请求模拟*/
- (void)setGetRequestData
{
    BADataEntity *entity = [BADataEntity new];
    entity.urlString = sys_appLogin_loginUser;
    entity.needCache = NO;
    [BANetManager ba_request_GETWithEntity:entity successBlock:^(id response) {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"get 请求数据结果：response *** %@", jsonDict);
    } failureBlock:^(NSError *error) {
        
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
    
}

- (void)setUpViewAndData{
    
    self.datas = @[@"01-在线签字版",@"02-在线预览文件【Excel、pdf、Word】",@"03-视频拍摄[或本地视频]，压缩、上传",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合",@"聚源融合，聚源融合999"];
    
    NSArray *imagesURLStrings = @[
                           @"https://s2.loli.net/2022/07/22/sBMOFgiAj5pL4DP.jpg",
                           @"https://s2.loli.net/2022/07/22/LsX5UCZVIbvSHPa.jpg",
                           @"https://s2.loli.net/2022/07/22/zK31SQRE6y4ftUA.jpg",
                           @"https://s2.loli.net/2022/07/22/F8hfEBAGeknMiuI.jpg",
                           @"https://s2.loli.net/2022/07/22/6riW9H8cOVZGzjv.jpg",
                           @"https://s2.loli.net/2022/07/22/5bDepwsHVzIYdOE.jpg"
                           ];
    self.imagesURLStrings = imagesURLStrings;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = [self CycleScrollViewUI];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0, KScreenW, KScreenH-ZXNavBarHeightNotIncludeStatusBar);
}

#pragma mark 设置导航栏为黑色
- (void)setDarkNav{
    //设置导航栏文字标题和两侧按钮的颜色为黑色
    [self setZx_navTintColor:[UIColor blackColor]];
    //设置导航栏文字标题按钮的颜色
    [self setZx_navTitleColor:[UIColor clearColor]];
    //设置导航栏文字标题
    self.title = @"首页";
    //隐藏分割线
    self.zx_navLineView.hidden = NO;
    //设置状态栏为黑色
    self.zx_navStatusBarStyle = ZXNavStatusBarStyleDefault;
}

#pragma mark 设置导航栏为白色
- (void)setLightNav{
    //设置导航栏文字标题和两侧按钮的颜色为白色
    [self setZx_navTintColor:[UIColor whiteColor]];
    //设置导航栏文字标题按钮的颜色
    [self setZx_navTitleColor:[UIColor clearColor]];
    //设置导航栏文字标题
    self.title = @"首页";
    //显示分割线
    self.zx_navLineView.hidden = YES;
    //设置状态栏为白色
    self.zx_navStatusBarStyle = ZXNavStatusBarStyleLight;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self zx_setNavTransparentGradientsWithScrollView:scrollView fullChangeHeight:100 changeLimitNavAlphe:0.7 transparentGradientsTransparentBlock:^{
        [self setLightNav];
    } transparentGradientsOpaqueBlock:^{
        [self setDarkNav];
    }];
}

#pragma mark - 轮播图 -
- (UIView *)CycleScrollViewUI
{
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenW, 250) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    cycleScrollView.imageURLStringsGroup = self.imagesURLStrings;
    cycleScrollView.autoScrollTimeInterval = 3.0;
    return cycleScrollView;
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
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
        JYSignBoardViewController *signVC = [[JYSignBoardViewController alloc]init];
        [self.navigationController pushViewController:signVC animated:YES];
    }else if (indexPath.row == 1){
        JYOnLineLookFilesController *lookFilesVc = [[JYOnLineLookFilesController alloc]init];
        [self.navigationController pushViewController:lookFilesVc animated:YES];
    }else if (indexPath.row == 2){
        JYVideoShootingController *videoShootVc = [[JYVideoShootingController alloc]init];
        [self.navigationController pushViewController:videoShootVc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenW, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
//    cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
//    cycleScrollView.imageURLStringsGroup = self.imagesURLStrings;
//    cycleScrollView.hidesForSinglePage = YES;
//    if (self.imagesURLStrings.count==0 || self.imagesURLStrings.count==1) {
//        cycleScrollView.autoScroll = NO;
//    }
//    cycleScrollView.autoScrollTimeInterval = 3.0;
//    return cycleScrollView;
    
    return [[UIView alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.000001;
}
@end
