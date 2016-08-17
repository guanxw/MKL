//
//  TradeViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/8.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "TradeViewController.h"

#import "HomeHeaderView.h"

#import "HomeViewController.h"

@interface TradeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) HomeHeaderView *headerView;

@property(nonatomic,strong) HomeViewController *homeVC;

@end

@implementation TradeViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
//    self.navigationController.navigationBarHidden = YES;
    
//    _homeVC.search.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HomeHeaderView" owner:self options:nil] firstObject];
    [self.headerView initViews];
    self.tableView.tableHeaderView = self.headerView;
//    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, SCREENH_HEIGHT, 120);
    
    #pragma mark --- ECEdit0
    /**
     *  设置控制器标题
     */
    self.navigationItem.title = @"Trade Show";
    
#pragma mark --- ECEdit1
    
//    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
//    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_black"] forState:(UIControlStateNormal)];
//    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = leftBtnItem;
//
////    _homeVC.search.hidden = YES;
    
    
    
}
//实现点击方法
//-(void)backBtnClick{
//    
//
//    [self.navigationController popViewControllerAnimated:YES];
//
//    _homeVC.navigationController.navigationBarHidden = NO;
//    _homeVC.search.hidden = YES;
//    

//}
//}
//
//- (IBAction)searchTrade:(UIButton *)sender {
//    
//    
////    [self dismissViewControllerAnimated:YES completion:nil];
//}
//- (IBAction)Back:(UIButton *)sender {
////    [self dismissViewControllerAnimated:YES completion:nil];
//    
//    [self.navigationController popViewControllerAnimated:YES];
//
////    self.navigationController.navigationBarHidden = NO;
//
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifile = @"tradeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifile];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifile];
    }
    cell.textLabel.text = @"TradeShow";
    return cell;
}




//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 60;
//}

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
