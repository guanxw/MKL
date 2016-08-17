//
//  SetingViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/18.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "SetingViewController.h"

@interface SetingViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation SetingViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Settings";
    JaredButton *backbtn = [JaredButton shareButton];
    self.navigationItem.leftBarButtonItem = [backbtn setBarButtonItemWithBackButton:backbtn imageName:@"back_black"];
    //返回按钮点击事件
    [backbtn addTarget:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self initTableView];
}
#pragma mark -初始化tableView
- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark -tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *idetifile = @"settingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifile];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:idetifile];
    }
    cell.textLabel.text = @"MakeOnly";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
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
