//
//  FactoryDetailsViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/10.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "FactoryDetailsViewController.h"

#import "FactoryHomeViewController.h"
#import "FactoryProductViewController.h"
#import "FactoryProfileViewController.h"
#import "FactoryContactsViewController.h"

@interface FactoryDetailsViewController ()<UIScrollViewDelegate>
{
    FactoryHomeViewController *factoryHomeVC;
    FactoryProductViewController *factoryProductVC;
    FactoryProfileViewController *factoryPrifileVC;
    FactoryContactsViewController *factoryContactsVC;
}

@end

@implementation FactoryDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.contentSize = self.view.frame.size;
    self.navigationController.navigationBar.translucent = NO;
    [self setUpViews];
}

- (void)setUpViews{
    
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 4, 0);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.bounces = NO;
    self.contentScrollView.scrollsToTop = NO;
//    self.contentScrollView.scrollEnabled = YES;
    //添加scrollView内容视图
    factoryHomeVC = [[FactoryHomeViewController alloc] init];
    factoryHomeVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:factoryHomeVC];
    [self.contentScrollView addSubview:factoryHomeVC.view];
    
    factoryProductVC = [[FactoryProductViewController alloc] init];
    factoryProductVC.view.frame = CGRectMake(SCREEN_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:factoryProductVC];
    [self.contentScrollView addSubview:factoryProductVC.view];
    
    factoryPrifileVC = [[FactoryProfileViewController alloc] init];
    factoryPrifileVC.view.frame = CGRectMake(SCREEN_WIDTH *2, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:factoryPrifileVC];
    [self.contentScrollView addSubview:factoryPrifileVC.view];
    
    factoryContactsVC = [[FactoryContactsViewController alloc] init];
    factoryContactsVC.view.frame = CGRectMake(SCREEN_WIDTH *3, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:factoryContactsVC];
    [self.contentScrollView addSubview:factoryContactsVC.view];
    
    self.homeBtn.tag = 10;
    self.productBtn.tag = 11;
    self.profileBtn.tag = 12;
    self.contactsBtn.tag = 13;
    
    [self.homeBtn addTarget:self action:@selector(rolledClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.productBtn addTarget:self action:@selector(rolledClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.profileBtn addTarget:self action:@selector(rolledClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contactsBtn addTarget:self action:@selector(rolledClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)rolledClick:(UIButton *)btn{
    for (int i=0; i<4; i++) {
        
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.rollView.frame = CGRectMake(((SCREEN_WIDTH -2)/4+1)*(btn.tag-10), 80, (SCREEN_WIDTH -2)/4, 1);
        self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH *(btn.tag - 10), 0);
    }];
}

#pragma mark - scrollView开始滑动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.contentScrollView) {
        CGPoint currentPoint = self.contentScrollView.contentOffset;
        for (int i=0; i<4; i++) {
            UIButton *tempBtn = (UIButton *)[self.view viewWithTag:10 +i];
            if (tempBtn.tag == currentPoint.x/SCREEN_WIDTH + 10) {
                
            }
        }
        self.rollView.frame = CGRectMake(((SCREEN_WIDTH-2)/4+1)*(currentPoint.x/SCREEN_WIDTH), 80, (SCREEN_WIDTH-2)/4, 1);
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
