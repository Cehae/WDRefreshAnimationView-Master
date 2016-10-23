//
//  ViewController.m
//  WDRefreshAnimationView-Master
//
//  Created by WD on 16/10/23.
//  Copyright © 2016年 WD. All rights reserved.
//  Github:https://github.com/Cehae/WDRefreshAnimationView-Master

#import "ViewController.h"
#import "WDRefreshView.h"
//头部View的高度
#define HeaderH 100

@interface ViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic)WDRefreshView * AnimationView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.tableview.contentInset = UIEdgeInsetsMake(HeaderH, 0, 0, 0);
    self.tableview.delegate = self;

    
    self.AnimationView = [[WDRefreshView alloc]initWithFrame:CGRectMake(0,-HeaderH,[UIScreen mainScreen].bounds.size.width,HeaderH)];
    self.AnimationView.backgroundColor = [UIColor whiteColor];
    [self.tableview addSubview:self.AnimationView];
}

//只要tableView滚动时,就会调用这个方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //计算滚动的便宜量
    CGFloat offSetY = (-scrollView.contentOffset.y  - HeaderH)  / 100.0;
    NSLog(@"%f -- %f",-scrollView.contentOffset.y, offSetY);
    self.AnimationView.progressValue = offSetY;

}
//完成拖拽

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

{
//    [self.AnimationView startAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.AnimationView stopAnimation];
    });
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.AnimationView stopAnimation];
}
@end
