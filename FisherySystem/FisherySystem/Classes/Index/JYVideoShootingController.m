//
//  JYVideoShootingController.m
//  FisherySystem
//
//  Created by Mr.吕 on 2022/8/10.
//

#import "JYVideoShootingController.h"
#import "HXPhotoPicker.h"

@interface JYVideoShootingController ()<HXCustomCameraViewControllerDelegate,UIImagePickerControllerDelegate, UIDocumentPickerDelegate>
@property (strong, nonatomic) HXPhotoManager *manager;
@end

@implementation JYVideoShootingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"视频拍摄压缩上传";
    
//    UIButton *videoBtn = [[UIButton alloc]init];
//    [self.view addSubview:videoBtn];
//    videoBtn.backgroundColor = [UIColor redColor];
//    [videoBtn setTitle:@"播放▶️" forState:UIControlStateNormal];
//    [videoBtn addTarget:self action:@selector(didBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [videoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(50);
//        make.centerX.equalTo(self.view);
//        make.top.mas_equalTo(120);
//    }];
    
    UIButton *videoBtn2 = [[UIButton alloc]init];
    [self.view addSubview:videoBtn2];
    videoBtn2.backgroundColor = [UIColor redColor];
    [videoBtn2 setTitle:@"选择本地视频" forState:UIControlStateNormal];
    [videoBtn2 addTarget:self action:@selector(choosevideo) forControlEvents:UIControlEventTouchUpInside];
    [videoBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(50);
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(170);
    }];
    
    UIButton *videoBtn3 = [[UIButton alloc]init];
    [self.view addSubview:videoBtn3];
    videoBtn3.backgroundColor = [UIColor redColor];
    [videoBtn3 setTitle:@"录制视频" forState:UIControlStateNormal];
    [videoBtn3 addTarget:self action:@selector(startvideo) forControlEvents:UIControlEventTouchUpInside];
    [videoBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(50);
        make.centerX.equalTo(self.view);
        make.top.equalTo(videoBtn2.mas_bottom).offset(50);
    }];
}

//- (void)didBtnClick
//{
//    [self actionClickedButtonAtIndex];
//
//    [self.manager clearSelectedList]; // 重新进入前要清除之前的选择项
//    self.manager.configuration.photoMaxNum = 0; // 选择照片最大数
//    self.manager.configuration.videoMaxNum = 1; // 选择视频最大数
//    self.manager.configuration.maxNum = 1; // 总最大数
//    self.manager.configuration.rowCount = 4; // 设置相册最大列数
//    self.manager.configuration.saveSystemAblum = YES; // 保存到系统相册
//    self.manager.configuration.replaceCameraViewController = NO; // 替换成系统相册控制器
//    self.manager.configuration.openCamera = NO; // 是否在相册列表中显示“相机”设备
//    self.manager.configuration.photoCanEdit = NO; // 图片是否能编辑
//    self.manager.configuration.videoCanEdit = NO; // 相册是否能编辑
//    self.manager.configuration.creationDateSort = YES; // 照片列表是否按照片创建日期排序
//    self.manager.configuration.selectTogether = NO; // 图片和视频是否能够【同时选择】
//    self.manager.configuration.photoStyle = HXPhotoStyleDefault;
//}
//
//- (void)actionClickedButtonAtIndex{
//
//    [self hx_presentSelectPhotoControllerWithManager:self.manager didDone:^(NSArray<HXPhotoModel *> *allList, NSArray<HXPhotoModel *> *photoList, NSArray<HXPhotoModel *> *videoList, BOOL isOriginal, UIViewController *viewController, HXPhotoManager *manager) {
//
//        for (HXPhotoModel *photoModel in photoList) {
//
////            PHImageManager *manager = [PHImageManager defaultManager];
////            [manager requestImageDataForAsset:photoModel.asset options:nil resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
////                NSLog(@"获取imageData = %@",imageData); // {length = 2808983, bytes = 0x00000018 66747970 68656963 00000000 ... c60efd6a 6afca048 }
////                // 上传回显
////                UIImage *image = [UIImage imageWithData: imageData];
////                if ([type isEqualToString:@"frIdNumUrl"]) {
////                    self.idCardView.image = image;
////                }else if ([type isEqualToString:@"businessLicenseJpg"]){
////                    self.licenseView.image = image;
////                }
////
////                NSMutableDictionary *dict = [NSMutableDictionary dictionary];
////                dict[@"id"] = self.customerMsgListModel.id; // 客户id
////                if ([type isEqualToString:@"frIdNumUrl"]) {
////                    dict[@"frIdNumUrl"] = @"frIdNumUrl"; // 法人身份证
////                }else if ([type isEqualToString:@"businessLicenseJpg"]){
////                    dict[@"businessLicenseJpg"] = @"businessLicenseJpg"; // 营业执照
////                }
////
////                [[RequestTool sharedInstance] uploadSingleImageWithFile:imageData imageName:@"picture" parameters:dict progress:^(CGFloat completedUnitCount, CGFloat totalUnitCount) {
////
////                } completionHandler:^(id responseObject) {
////                    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
////                    NSLog(@"responseObject = %@",jsonDict);
////
////                    if ([jsonDict[@"code"]intValue] == 200) {
////                        [UKToast showWithText:@"上传成功"];
////                        // [self.navigationController popViewControllerAnimated:YES];
////                    }else{
////                        [UKToast showWithText:@"上传失败"];
////                    }
////                } failure:^(NSError *error, NSDictionary *errorDict, NSInteger httpStatusCode) {
////                    NSLog(@"error = %@",error);
////                }];
////
////            }];
//        }
//    } cancel:^(UIViewController *viewController, HXPhotoManager *manager) {
//
//    }];
//}
//
//#pragma mark - 自定义相册相关设置和处理 -
//
//- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
//    [super traitCollectionDidChange:previousTraitCollection];
//#ifdef __IPHONE_13_0
//    if (@available(iOS 13.0, *)) {
//        [self preferredStatusBarUpdateAnimation];
//        [self changeStatus];
//    }
//#endif
//}
//- (UIStatusBarStyle)preferredStatusBarStyle {
//#ifdef __IPHONE_13_0
//    if (@available(iOS 13.0, *)) {
//        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//            return UIStatusBarStyleLightContent;
//        }
//    }
//#endif
//    return UIStatusBarStyleDefault;
//}
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self changeStatus];
//}
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored"-Wdeprecated-declarations"
//- (void)changeStatus {
//#ifdef __IPHONE_13_0
//    if (@available(iOS 13.0, *)) {
//        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
//            return;
//        }
//    }
//#endif
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
//}
//#pragma clang diagnostic pop
//- (HXPhotoManager *)manager {
//    if (!_manager) {
//        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
//        _manager.configuration.type = HXConfigurationTypeWXMoment;
//        _manager.configuration.photoEditConfigur.onlyCliping = YES;
//        _manager.configuration.photoEditConfigur.aspectRatio = HXPhotoEditAspectRatioType_1x1;
//        _manager.configuration.photoEditConfigur.isRoundCliping = YES;
//    }
//    return _manager;
//}





//选择本地视频
- (void)choosevideo
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    //sourcetype有三种分别是camera，photoLibrary和photoAlbum
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //Camera所支持的Media格式都有哪些,共有两个分别是@"public.image",@"public.movie"
    NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    //设置媒体类型为public.movie
    ipc.mediaTypes = [NSArray arrayWithObject:availableMedia[1]];
    [self presentViewController:ipc animated:YES completion:nil];
    //设置委托
    ipc.delegate = self;
    
}
 
//录制视频
- (void)startvideo
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    //sourcetype有三种分别是camera，photoLibrary和photoAlbum
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    //Camera所支持的Media格式都有哪些,共有两个分别是@"public.image",@"public.movie"
    NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    //设置媒体类型为public.movie
    ipc.mediaTypes = [NSArray arrayWithObject:availableMedia[1]];
    [self presentViewController:ipc animated:YES completion:nil];
    ipc.videoMaximumDuration = 100.0f;//30秒
    //设置委托
    ipc.delegate = self;
    
}

//完成视频录制，并压缩后显示大小、时长
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSURL *inputURL = [info objectForKey:UIImagePickerControllerMediaURL]; // 生成.MOV格式视频
    [picker dismissViewControllerAnimated:YES completion:nil];
    // 上传视频
    [self uploadVideoRequestWithInputURL:inputURL];
}

- (void)uploadVideoRequestWithInputURL:(NSURL*)inputURL
{
    BAFileDataEntity *videoEntity = [BAFileDataEntity new];
    videoEntity.urlString = @"/sys/upload";
    videoEntity.fileName = @"";
    videoEntity.filePath = inputURL;
//    videoEntity.parameters = @{};
    
    [BANetManager ba_uploadVideoWithEntity:videoEntity successBlock:^(id response) {
        
    } failureBlock:^(NSError *error) {
        
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}




@end

/*
 lazy var pickerController: UIImagePickerController = {
     let pickerController = UIImagePickerController()
     // 设置图像选取控制器的来源模式为相机模式 相机、相册
     pickerController.sourceType = UIImagePickerController.SourceType.camera
     // 设置相机的类型 public.image  public.movie
     pickerController.mediaTypes = ["public.movie",]
     // 设置摄像头 前、后
     pickerController.cameraDevice = UIImagePickerController.CameraDevice.rear;
     // 设置摄像头闪光灯模式
     // pickerController.cameraFlashMode = UIImagePickerController.CameraFlashMode.auto
     // 设置摄像图像品质
     pickerController.videoQuality = UIImagePickerController.QualityType.typeHigh
     // 设置最长摄像时间
     pickerController.videoMaximumDuration = 30
     // 允许用户进行编辑
     pickerController.allowsEditing = false
     // 设置委托对象
     pickerController.delegate = self
     return pickerController
 }()

*/
