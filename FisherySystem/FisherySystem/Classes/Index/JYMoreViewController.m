//
//  JYMoreViewController.m
//  FisherySystem
//
//  Created by Mr.吕 on 2022/7/12.
//

#import "JYMoreViewController.h"

#import "JYtempViewController.h"
#import "MJCSegmentInterface.h"
#import "JYNewsViewController.h"

@interface JYMoreViewController ()

@end

@implementation JYMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"更多";
    
    //实例化您需要显示的控制器对象
    JYtempViewController *vc1 = [[JYtempViewController alloc]init];
    JYtempViewController *vc2 = [[JYtempViewController alloc]init];
    JYtempViewController *vc3 = [[JYtempViewController alloc]init];
    JYtempViewController *vc4 = [[JYtempViewController alloc]init];
    JYtempViewController *vc5 = [[JYtempViewController alloc]init];
    JYtempViewController *vc6 = [[JYtempViewController alloc]init];
    JYtempViewController *vc7 = [[JYtempViewController alloc]init];
    JYNewsViewController *vc8 = [[JYNewsViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8];
    NSArray *titlesArr = @[@"最近浏览",@"全部",@"A股",@"港股",@"美股",@"基金",@"期货",@"外汇"];
    
    MJCSegmentInterface *interface = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,ZXNavBarHeight,self.view.jc_width, self.view.jc_height-ZXNavBarHeight) titlesArray:titlesArr childControllerArray:vcarrr interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle);
        jc_tools.jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width,40));
        jc_tools.jc_titlesViewBackColor(RGB(249, 250, 254));
        jc_tools.jc_childScollEnabled(YES);
        jc_tools.jc_indicatorsAnimalsEnabled(YES);
        jc_tools.jc_itemTextNormalColor(RGB(103, 104, 123));
        jc_tools.jc_itemTextSelectedColor([UIColor blackColor]);
        jc_tools.jc_itemTextFontSize(15);
        jc_tools.jc_itemTextZoomEnabled(YES, 16);
        jc_tools.jc_indicatorStyles(MJCIndicatorEqualTextEffect);
        jc_tools.jc_indicatorColor(RGB(94, 125, 232));
        jc_tools.jc_indicatorFrame(CGRectMake(0, jc_tools.titlesViewFrame.size.height-2,15,5));
        jc_tools.jc_tabItemSizeToFitIsEnabled(YES, NO, YES);
        jc_tools.jc_itemEdgeinsets(MJCItemEdgeInsetsMake(0,15, 0,15, 25));
        } hostController:self];
    [self.view addSubview:interface];
}

// 实时刷新最新数据的做法:(代理方法的使用(MJCSegmentDelegate))
- (void)mjc_ClickEvent:(UIButton *)tabItem childViewController:(UIViewController *)childViewController segmentInterface:(MJCSegmentInterface *)segmentInterface;
{
        if ([childViewController isKindOfClass:[JYtempViewController class]]) {
            //控制器提供一个刷新数据的方法,给这里刷新数据使用
//            [_testTableViewVC beginLoadNewData];
        }else{
            NSLog(@"%@",childViewController);
        }
}


@end
