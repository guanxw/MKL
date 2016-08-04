//
//  AllCategorysViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/4.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "AllCategorysViewController.h"

@interface AllCategorysViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation AllCategorysViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //模拟数据加载
    [self loadDataArray];
}

- (void)loadDataArray{
    
//    for (int i=0; i<20; i++) {
//        NSString *name = [NSString stringWithFormat:@"Agriculture & Chemicals%d", i];
//        
//        _nameArray = [NSMutableArray arrayWithObject:name];
//        JDLog(@"%@", _nameArray);
//        [self.nameArray addObject:name];
//        JDLog(@"%@", _nameArray);
//    }
    
//    _nameArray = @[@"Agriculture & Chemicals1",@"Agriculture & Chemicals2",@"Agriculture & Chemicals3",@"Agriculture & Chemicals4",@"Agriculture & Chemicals5",@"Agriculture & Chemicals6",];
    _nameArray = [NSMutableArray arrayWithObjects:@"Agriculture & Chemicals1",@"Agriculture & Chemicals2",@"Agriculture & Chemicals3",@"Agriculture & Chemicals4",@"Agriculture & Chemicals5",@"Agriculture & Chemicals6",@"Agriculture & Chemicals1",@"Agriculture & Chemicals2",@"Agriculture & Chemicals3",@"Agriculture & Chemicals4",@"Agriculture & Chemicals5",@"Agriculture & Chemicals6",@"Agriculture & Chemicals1",@"Agriculture & Chemicals2",@"Agriculture & Chemicals3",@"Agriculture & Chemicals4",@"Agriculture & Chemicals5",@"Agriculture & Chemicals6", nil];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifile = @"AllCategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifile];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifile];
    }
    
    cell.textLabel.text = _nameArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"category"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
