//
//  BrowsingViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/1.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "BrowsingViewController.h"

#import "BrowingTableViewCell.h"



static NSString *identifile = @"browingCell";
@interface BrowsingViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BrowsingViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Browsing History";
    JaredButton *backBtn = [JaredButton shareButton];
    self.navigationItem.leftBarButtonItem = [backBtn setBarButtonItemWithBackButton:backBtn imageName:@"back_black"];
    [backBtn addTarget:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BrowingTableViewCell" bundle:nil] forCellReuseIdentifier:identifile];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BrowingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifile];
    if (!cell) {
        cell = [[BrowingTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifile];
    }
    cell.imageViewCell.image = [UIImage imageNamed:@"makeronly_01_img360.jpg"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
