//
//  WDRefreshView.m
//  WDRefreshAnimationView-Master
//
//  Created by WD on 16/10/23.
//  Copyright © 2016年 WD. All rights reserved.
//  Github:https://github.com/Cehae/WDRefreshAnimationView-Master

#import "WDRefreshView.h"
#import "WDRefreshAnimationView.h"

@interface WDRefreshView()
@property (nonatomic, strong) WDRefreshAnimationView * animationView ;
@end
@implementation WDRefreshView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}


-(void)setUp
{
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    self.animationView = [[WDRefreshAnimationView alloc]initWithFrame:CGRectMake((w - h) * 0.5 , 0,h,h)];
    _animationView.backgroundColor = [UIColor clearColor];
    
    self.animationView.lineWidth = 8;
    self.animationView.lineColor =[UIColor redColor];
    
    [self addSubview:self.animationView];
}
-(void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    self.animationView.lineColor = lineColor;
}
-(void)setlineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    self.animationView.lineWidth = lineWidth;
}
-(void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    self.animationView.progressValue = progressValue;
}
-(void)stopAnimation
{
    [self.animationView stopAnimation];
}

@end
