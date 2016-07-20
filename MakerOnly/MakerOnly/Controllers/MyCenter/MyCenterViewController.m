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

@interface MyCenterViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) CenterHeaderView *headerView;

@property (nonatomic, strong) NSArray *dataArray;


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
    self.dataArray = @[@[@"Manage Order",@"Buying Request",@"Inquiries"],@[@"Survey",@"My Coupon"],@[@"Help Center"]];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, SCREENH_HEIGHT) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"CenterHeaderView" owner:self options:nil] firstObject];
    [self.headerView initViews];
    self.tableView.tableHeaderView = self.headerView;
    self.dataArray = [NSArray array];
    self.tableView.bounces = NO;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.headerView.iconImage.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *iconTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconAction)];
    [self.headerView.iconImage addGestureRecognizer:iconTap];
}

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
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    JDLog(@"选择cell");
    if (indexPath.section == 0 && indexPath.row == 0) {
        JDLog(@"Manager Orde");
    }else if (indexPath.section == 0 && indexPath.row == 1){
        JDLog(@"Buying Request");
    }else if (indexPath.section == 0 && indexPath.row == 2){
        JDLog(@"Inquiries");
    }else if (indexPath.section == 1 && indexPath.row == 0){
        JDLog(@"Survey");
    }else if (indexPath.section == 1 && indexPath.row == 1){
        JDLog(@"My Coupon");
    }else if (indexPath.section == 2 && indexPath.row == 0){
        JDLog(@"Help Center");
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
