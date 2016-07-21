//
//  MyProfileViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/18.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "MyProfileViewController.h"

#import "MyProfilePhotoView.h"


@interface MyProfileViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) MyProfilePhotoView *headerView;

@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) NSArray *detailArray;
@end

@implementation MyProfileViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"MyProfile";
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backBtn setImage:[UIImage imageNamed:@"back_black"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    [self initTableView];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT) style:(UITableViewStyleGrouped)];
    [self.view addSubview:self.tableView];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MyProfilePhotoView" owner:self options:nil] firstObject];
    [self.headerView initViews];
    self.tableView.tableHeaderView = self.headerView;
    
    self.listArray = @[@[@"Name", @"Gender", @"Email"],@[@"Contact", @"Postal",],@[@"Tel", @"Fax", @"Mobile"]];
    self.detailArray = @[@[@"Jared", @"male", @"guanxw@163.com"], @[@"05318866888",@"gaoxinqu"], @[@"15266375187",@"",@""]];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listArray.count;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifile = @"MyProfileCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifile];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:identifile];
    }
    cell.textLabel.text = [self.listArray[indexPath.section] objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = [self.detailArray[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

//返回按钮事件
- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
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
