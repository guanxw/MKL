//
//  GuideViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/20.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "GuideViewController.h"
#import "Masonry.h"
#import "AppDelegate.h"
#import "MainViewController.h"

#define Image_Count 3
@interface GuideViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic ,strong) UIPageControl *pageControl;

@property (nonatomic, strong) UIButton *btn;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(Image_Count * SCREEN_WIDTH, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.tag = 101;
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREENH_HEIGHT - 80, self.view.frame.size.width, 20)];
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = Image_Count;
    self.pageControl.enabled = NO;
    self.pageControl.tag = 201;
    
    CGFloat imageW = SCREEN_WIDTH;
    CGFloat imageH = SCREENH_HEIGHT;
    CGFloat imageY = 0;
    for (int i = 0; i < Image_Count; i++) {
        CGFloat imageX = i * imageW;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"yindao%d", i+1]];
        [self.scrollView addSubview:imageView];
    }
}

#pragma mark --UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int currpage = self.scrollView.contentOffset.x/SCREEN_WIDTH;
    self.pageControl.currentPage = currpage;
    
    UIPageControl *page = [self.view viewWithTag:201];
    if (page.currentPage == Image_Count -1) {
        [self scrollViewDisappear];
    }else{
        if (self.btn) {
            [self.btn removeFromSuperview];
            self.btn = nil;
        }
        page.hidden = NO;
    }
    
}

- (void)scrollViewDisappear{
    UIPageControl *page = [self.view viewWithTag:201];
    page.hidden = YES;
    if (self.btn) {
        return;
    }
    _btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [_btn setBackgroundImage:[UIImage imageNamed:@"kaishi"] forState:(UIControlStateNormal)];
    [_btn setBackgroundImage:[UIImage imageNamed:@"kaishixiaoguo"] forState:(UIControlStateHighlighted)];
    [_btn addTarget:self action:@selector(btnAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        make.width.equalTo(@150);
        make.height.equalTo(@50);
    }];
}

- (void)btnAction{
    MainViewController *mVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = mVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
