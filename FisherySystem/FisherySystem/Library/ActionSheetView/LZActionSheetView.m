//
//  LZActionSheetView.m
//  ActionSheet封装
//
//  Created by 李震 on 2017/5/22.
//  Copyright © 2017年 李震. All rights reserved.
//

#import "LZActionSheetView.h"

/**
 使用方式：
 
 NSArray *array = @[@"苹果地图", @"高德地图", @"百度地图"];
 LZActionSheetView *action = [[LZActionSheetView alloc] initWithTitleView:nil optionsArr: array cancelTitle:@"取消" cancelBlock:^{
     
 } selectBlock:^(NSInteger index) {
     NSLog(@"点击了第 %ld 个", index);
 }];
 [self.view addSubview:action];
 
 */

#define ScreenWidth self.bounds.size.width
#define ScreenHeight self.bounds.size.height
#define Space 10

@interface LZActionSheetView () <UITableViewDelegate, UITableViewDataSource>

/** 头部视图 */
@property (nonatomic, strong) UIView *headView;

/** 背景蒙层 */
@property (nonatomic, strong) UIView *maskView;

/** 数组元素 */
@property (nonatomic, strong) NSArray *dataSource;

/** 取消文字 */
@property (nonatomic, copy) NSString *cancelTitle;

@property (nonatomic, copy) void(^cancelBlock)(void);

@property (nonatomic, copy) void(^selectBlock)(NSInteger);

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LZActionSheetView

- (instancetype)initWithTitleView:(UIView *)titleView
                       optionsArr:(NSArray *)optionsArr
                      cancelTitle:(NSString *)cancelTitle
                      cancelBlock:(void (^)(void))cancelBlock
                      selectBlock:(void (^)(NSInteger))selectBlock
{
    
    
    if (self = [super init]) {
        
        self.dataSource = [NSArray array];
        self.headView = titleView;
        self.dataSource = optionsArr;
        self.cancelTitle = cancelTitle;
        self.cancelBlock = cancelBlock;
        self.selectBlock = selectBlock;
        
        [self createUI];
        
    }
    return self;
    
}

- (void)createUI
{
    self.frame = [UIScreen mainScreen].bounds;
    [self addSubview:self.maskView];
    [self addSubview:self.tableView];
}

- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _maskView.backgroundColor = [UIColor clearColor];
    }
    return _maskView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.rowHeight = 45.0;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, -50, 0, 0);
        _tableView.layer.cornerRadius = 10;
        _tableView.separatorStyle = 0;
    }
    return _tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    if (indexPath.section == 0) {
        
        cell.textLabel.text = self.dataSource[indexPath.row];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        cell.textLabel.font = FontRegular(16);
        
        UIView *lineView = [[UIView alloc]init];
        [cell addSubview:lineView];
        lineView.backgroundColor = [UIColor colorWithHexString:@"#EBEBEB"];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
        if (indexPath.row == self.dataSource.count-1) {
            
            UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, ScreenWidth-Space*2, cell.contentView.frame.size.height) byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
            CAShapeLayer *shaper = [[CAShapeLayer alloc] init];
            shaper.frame = cell.contentView.bounds;
            shaper.path = bezier.CGPath;
            cell.layer.mask = shaper;
        }
    }
    else
    {
        cell.textLabel.text = self.cancelTitle;
        cell.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        cell.textLabel.font = FontRegular(16);
        cell.layer.cornerRadius = 10;
        cell.layer.masksToBounds = YES;
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? self.dataSource.count : 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(Space, 10, ScreenWidth-2*Space, Space)];
    return footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return Space;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        if (self.selectBlock) {
            self.selectBlock(indexPath.row);
        }
          [self dismissView];
    }else
    {
        self.cancelBlock();
        [self dismissView];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self showView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissView];
}

- (void)showView
{
    self.tableView.frame = CGRectMake(Space, ScreenHeight, ScreenWidth-2*Space, self.tableView.rowHeight*(self.dataSource.count+1)+self.tableView.tableHeaderView.frame.size.height+2*Space);
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect rect = self.tableView.frame;
        
        rect.origin.y = ScreenHeight - self.tableView.bounds.size.height + 25;
        
        self.tableView.frame = rect;
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
    }];
}

- (void)dismissView
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.tableView.frame;
        
        rect.origin.y += self.tableView.bounds.size.height;
        
        self.tableView.frame = rect;
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
