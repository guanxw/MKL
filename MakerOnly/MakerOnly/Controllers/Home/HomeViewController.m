//
//  HomeViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderView.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) HomeHeaderView *headerView;

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Home";
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HomeHeaderView" owner:self options:nil] firstObject];
    [self.headerView initViews];
    self.tableView.tableHeaderView = self.headerView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifile = @"homeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifile];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifile];
    }
    
    cell.textLabel.text = @"名客来名客来名客来";
    return cell;
}
 
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
