//
//  MessangerViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "MessangerViewController.h"

#import "RecentViewController.h"
#import "ContactsViewController.h"

@interface MessangerViewController ()
@property (nonatomic, strong) UISegmentedControl *segmentCtr;
@property (nonatomic, strong) RecentViewController *recentVC;
@property (nonatomic, strong) ContactsViewController *contactsVC;
@end

@implementation MessangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化标签选择器
    [self setUpSegmented];
    //设置内容视图
    [self setUpScrollView];
}

#pragma mark - 设置内容视图
- (void)setUpScrollView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *2, -64);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    
    _recentVC = [[RecentViewController alloc] init];
    _recentVC.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREENH_HEIGHT);
    [self addChildViewController:_recentVC];
    [self.scrollView addSubview:_recentVC.view];
    
    _contactsVC = [[ContactsViewController alloc] init];
    _contactsVC.view.frame = CGRectMake(SCREEN_WIDTH, 64, SCREEN_WIDTH, SCREENH_HEIGHT);
    [self addChildViewController:_contactsVC];
    [self.scrollView addSubview:_contactsVC.view];
    self.scrollView.scrollsToTop = NO;
    
}
#pragma mark - 初始化标签选择器
- (void)setUpSegmented{
    _segmentCtr = [[UISegmentedControl alloc] initWithItems:@[@"Recent", @"Contacts"]];
    _segmentCtr.frame = CGRectMake(0, 0, VIEWFRAME/1.5, 30);
    self.navigationItem.titleView = _segmentCtr;
    _segmentCtr.selectedSegmentIndex = 0;
    _segmentCtr.tintColor = [UIColor orangeColor];
    [_segmentCtr addTarget:self action:@selector(changeSegment:) forControlEvents:(UIControlEventValueChanged)];
    
}

#pragma mark - 标签选择器点击事件
- (void)changeSegment:(UISegmentedControl *)segmentCtr{
    
    switch (segmentCtr.selectedSegmentIndex) {
        case 0:
            
            self.scrollView.contentOffset = CGPointMake(0, 0);
            
            break;
        case 1:
            self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
            break;
        default:
            break;
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
