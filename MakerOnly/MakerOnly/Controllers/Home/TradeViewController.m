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
@property (nonatomic, strong) HomeViewController *homeVC;

@end

@implementation TradeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HomeHeaderView" owner:self options:nil] firstObject];
    [self.headerView initViews];
    self.tableView.tableHeaderView = self.headerView;
//    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, SCREENH_HEIGHT, 120);
    _homeVC.search.hidden = YES;
    
//    [self setUpViews];
}

- (void)setUpViews{
    JaredButton *backBtn = [JaredButton shareButton];
    self.navigationItem.leftBarButtonItem = [backBtn setBarButtonItemWithBackButton:backBtn imageName:@"back_black"];
    [backBtn addTarget:^{
//        HomeViewController *hVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
//        hVC.search.hidden = NO;
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}

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
