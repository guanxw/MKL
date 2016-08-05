//
//  SourceViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "SourceViewController.h"

#import "BrandViewController.h"
#import "FactoryViewController.h"

@interface SourceViewController ()<UIScrollViewDelegate>
{
    BrandViewController *brandVC;
    FactoryViewController *factoryVC;
}

@end

@implementation SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Source";
    self.navigationController.navigationBar.translucent = NO;
    
    //初始化界面
    [self setUpView];
}

//初始化界面
- (void)setUpView{
    
    //设置滚动视图
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, -64);
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollsToTop = NO;
    
    // 添加ScrollView内容视图
    brandVC = [[BrandViewController alloc] init];
    brandVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height -100);
    [self addChildViewController:brandVC];
    [self.scrollView addSubview:brandVC.view];
    
    factoryVC = [[FactoryViewController alloc] init];
    factoryVC.view.frame = CGRectMake(SCREEN_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height-100);
    [self addChildViewController:factoryVC];
    [self.scrollView addSubview:factoryVC.view];
    
    //添加按钮事件
    [self.BrandBtn addTarget:self action:@selector(rollClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.QualityFacBtn addTarget:self action:@selector(rollClick:) forControlEvents:(UIControlEventTouchUpInside)];
    self.BrandBtn.tag = 100;
    self.QualityFacBtn.tag = 101;
    
}

#pragma mark - 按钮点击事件
- (void)rollClick:(UIButton *)btn{
    for (int i=0; i<2; i++) {
//        UIButton *tempBtn = (UIButton *)[self.view viewWithTag:100 + i];
        
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.rollView.frame = CGRectMake(((SCREEN_WIDTH-2)/2+1)*(btn.tag-100), 50, (SCREEN_WIDTH-2)/2, 3);
        self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH *(btn.tag - 100), 0);
    }];
}

#pragma mark - scrollView开始滑动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.scrollView) {
        CGPoint currentPoint = self.scrollView.contentOffset;
        for (int i=0; i<2; i++) {
            UIButton *tempBtn = (UIButton *)[self.view viewWithTag:100 +i];
            if (tempBtn.tag == currentPoint.x/SCREEN_WIDTH + 100) {
                
            }
        }
        self.rollView.frame = CGRectMake(((SCREEN_WIDTH-2)/2+1)*(currentPoint.x/SCREEN_WIDTH), 50, (SCREEN_WIDTH-2)/2, 3);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
