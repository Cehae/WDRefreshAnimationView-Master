//
//  WDRefreshAnimationView.m
//  WDRefreshAnimationView-Master
//
//  Created by WD on 16/10/23.
//  Copyright © 2016年 WD. All rights reserved.
//  Github:https://github.com/Cehae/WDRefreshAnimationView-Master

#import "WDRefreshAnimationView.h"

#define Margin 10
#define Count  10

@interface WDRefreshAnimationView()
@property (nonatomic, assign,getter=isAnimation) BOOL  Animation;
@property (nonatomic, strong) CAReplicatorLayer *repLayer ;
@end
@implementation WDRefreshAnimationView

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
    self.lineWidth = 5;
    self.lineColor = [UIColor redColor];
    self.Animation = NO;
}



-(void)setProgressValue:(CGFloat)progressValue {
    if (progressValue < 0) {
        return;
    }
    
    if (progressValue<1) {
        _progressValue = progressValue;
        if (!_Animation) {
            [self setNeedsDisplay];
        }
    }else
    {
        [self startAnimation];
    }

}

- (void)drawRect:(CGRect)rect {
    
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - Margin;
    CGFloat startA = -M_PI_2;
    CGFloat angle =  self.progressValue *  M_PI * 2;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    path.lineWidth = self.lineWidth;
    [self.lineColor set];
    [path stroke];
}

-(CAReplicatorLayer *)repL
{
 
    if (!_repLayer) {
        _repLayer = [CAReplicatorLayer layer];

         _repLayer.frame = self.bounds;

        CALayer *layer = [CALayer layer];
        
        
        layer.transform = CATransform3DMakeScale(0, 0, 0);

        
        layer.position = CGPointMake(self.bounds.size.width * 0.5 , Margin);
        
        layer.bounds = CGRectMake(0, 0, self.lineWidth, self.lineWidth);
        
        layer.backgroundColor = self.lineColor.CGColor;
        
        [_repLayer addSublayer:layer];
        
        
        
        CABasicAnimation *anim = [CABasicAnimation animation];
        
        anim.keyPath = @"transform.scale";
        
        anim.fromValue = @1;
        
        anim.toValue = @0;
        
        anim.repeatCount = MAXFLOAT;
        
        CGFloat duration = 1;
        
        anim.duration = duration;
        
        [layer addAnimation:anim forKey:nil];
        
        
        CGFloat angle = M_PI * 2 / Count;
        
         _repLayer.instanceCount = Count;
        
         _repLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);

         _repLayer.instanceDelay = duration / Count;

    }
    return  _repLayer;
}

-(void)startAnimation
{
    self.progressValue = 0;
    [self setNeedsDisplay];
    self.Animation = YES;
    [self.layer addSublayer:self.repL];
}
-(void)stopAnimation
{
    [self.repLayer removeFromSuperlayer];
    self.repLayer = nil;
    self.Animation = NO;

}
@end
