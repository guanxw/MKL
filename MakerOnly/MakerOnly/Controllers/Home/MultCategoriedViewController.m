//
//  MultCategoriedViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/8.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "MultCategoriedViewController.h"

@interface MultCategoriedViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *groupArray;
@property (nonatomic, strong) NSMutableArray *memberArray;

@property (nonatomic, strong) NSMutableDictionary *showDic;


@end

#define CELL_HEIGHT 50.0f

@implementation MultCategoriedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
    
    [self loadData];
}

- (void)setUpView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREENH_HEIGHT) style:(UITableViewStyleGrouped)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
}

// 模拟数据加载
- (void)loadData{
    self.groupArray = [NSMutableArray arrayWithObjects:@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目",@"二级类目", nil];
    self.memberArray = [NSMutableArray arrayWithObjects:@"商品",@"商品",@"商品",@"商品",@"商品",@"商品",@"商品", nil];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.memberArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifile = @"MultCatcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifile];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifile];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.memberArray[indexPath.row]];
    cell.clipsToBounds = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.showDic objectForKey:[NSString stringWithFormat:@"%ld", indexPath.section]]) {
        return 65;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    header.backgroundColor = [UIColor whiteColor];
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, [UIScreen mainScreen].bounds.size.width-20, 20)];
    myLabel.text = [NSString stringWithFormat:@"%@",self.groupArray[section]];
    myLabel.textColor = [UIColor blackColor];
    [header addSubview:myLabel];
    UIButton *markBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    markBtn.backgroundColor = [UIColor whiteColor];
    
    [header addSubview:markBtn];
    
    header.tag = section;
    /**
     *  分组头展开搜索图标
     */
    if (!self.showDic) {
        self.showDic = [[NSMutableDictionary alloc] init];
    }
    NSString *key = [NSString stringWithFormat:@"%ld",section];
    if (![self.showDic objectForKey:key]) {
        [markBtn setBackgroundImage:[UIImage imageNamed:@"mark_up"] forState:(UIControlStateNormal)];
    }else{
        [markBtn setBackgroundImage:[UIImage imageNamed:@"mark_down"] forState:(UIControlStateNormal)];
    }
    /**
     添加分组头触摸手势
     
     - parameter singleTap: 触摸事件
     
     - returns: 注册触摸事件响应者
     */
    UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    
    [header addGestureRecognizer:singleRecognizer];
    
    return header;
}
#pragma mark - 点击头部展开伸缩
- (void)singleTap:(UITapGestureRecognizer *)recognizer{
    NSInteger didSection = recognizer.view.tag;
    
    if (!self.showDic) {
        self.showDic = [[NSMutableDictionary alloc] init];
    }
    NSString *key = [NSString stringWithFormat:@"%ld",didSection];
    if (![self.showDic objectForKey:key]) {
        [self.showDic setObject:@"1" forKey:key];
    }else{
        [self.showDic removeObjectForKey:key];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:didSection] withRowAnimation:(UITableViewRowAnimationFade)];
    
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
