//
//  MyCenterViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "MyCenterViewController.h"
#import "CenterHeaderView.h"
#import "MyProfileViewController.h"
#import "SetingViewController.h"

#import "MyOrderViewController.h"

@interface MyCenterViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) CenterHeaderView *headerView;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation MyCenterViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Center";
    [self initTableView];
//    self.dataArray = @[@[@"Manage Order",@"Buying Request",@"Inquiries"],@[@"Survey",@"My Coupon"],@[@"Help Center"]];
    self.dataArray = @[@[@"我的订单",@"已买到宝贝",@"购物车"],@[@"我的优惠券",@"积分商城", @"我的卡券"],@[@"退款管理", @"售后管理", @"投诉管理"]];
    self.imageArray = @[@[@"my_dingdan",@"my_yimai",@"my_gouwuche"], @[@"my_youhui",@"my_jifen",@"my_kajuan"], @[@"my_tuikuan",@"my_souhou",@"my_tousu"]];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, SCREENH_HEIGHT) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"CenterHeaderView" owner:self options:nil] firstObject];
    [self.headerView initViews];
    self.tableView.tableHeaderView = self.headerView;
    self.dataArray = [NSArray array];
//    self.tableView.bounces = NO;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.headerView.iconImage.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *iconTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconAction)];
    [self.headerView.iconImage addGestureRecognizer:iconTap];
    [self.headerView.setBtn addTarget:self action:@selector(setBtClick) forControlEvents:(UIControlEventTouchUpInside)];
}

// 点击设置按钮
- (void)setBtClick{
    SetingViewController *sVC = [[SetingViewController alloc] initWithNibName:@"SetingViewController" bundle:nil];
//    UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:sVC];
    [self.navigationController pushViewController:sVC animated:YES];
}

//点击用户头像
- (void)iconAction{
    MyProfileViewController *mpVC = [[MyProfileViewController alloc] initWithNibName:@"MyProfileViewController" bundle:nil];
    
    mpVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mpVC animated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CenterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.imageArray[indexPath.section] objectAtIndex:indexPath.row]];
    cell.imageView.transform = CGAffineTransformMakeScale(1, 1);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 15;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        JDLog(@"我的订单");
        MyOrderViewController *moVC = [[MyOrderViewController alloc] initWithNibName:@"MyOrderViewController" bundle:nil];
        moVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:moVC animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 1){
        JDLog(@"已购买宝贝");
    }else if (indexPath.section == 0 && indexPath.row == 2){
        JDLog(@"购物车");
    }else if (indexPath.section == 1 && indexPath.row == 0){
        JDLog(@"我的优惠券");
    }else if (indexPath.section == 1 && indexPath.row == 1){
        JDLog(@"积分商城");
    }else if (indexPath.section == 1 && indexPath.row == 2){
        JDLog(@"我的卡券");
    }else if (indexPath.section == 2 && indexPath.row == 0){
        JDLog(@"退款管理");
    }else if (indexPath.section == 2 && indexPath.row == 1){
        JDLog(@"售后管理");
    }else if (indexPath.section == 2 && indexPath.row == 2){
        JDLog(@"投诉管理");
    }
}

// 解决cell下面的分割线显示不全
-(void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
// 解决cell下面的分割线显示不全
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
