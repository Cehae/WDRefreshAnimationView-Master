//
//  WDRefreshView.h
//  WDRefreshAnimationView-Master
//
//  Created by WD on 16/10/23.
//  Copyright © 2016年 WD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDRefreshView : UIView
/*
 * 线宽，默认5
 */
@property (nonatomic, assign) CGFloat lineWidth;
/*
 * 线的颜色，默认为红色
 */
@property (nonatomic, strong) UIColor  * lineColor;
/*
 * 取值范围：0.0 - 1.0
 */
@property (nonatomic, assign) CGFloat progressValue;
/*
 * 停止动画
 */
-(void)stopAnimation;
@end
