//
//  DrawingBoardView.h
//  Quartz2D
//
//  Created by Mr.吕 on 2022/8/8.
//  自定义画布 - 签字版

#import <UIKit/UIKit.h>

typedef void(^drawState)(BOOL isFinished);

@interface DrawingBoardView : UIView

@property (strong , nonatomic) UIColor *pathColor;
@property (assign , nonatomic) CGFloat lineWidth;
@property (strong , nonatomic) UIImage *image;
@property (nonatomic,strong) drawState drawCallBack ;

//清除绘画内容
-(void) clearContent;

//撤销
- (void) Undo;

@end
