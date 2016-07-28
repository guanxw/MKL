//
//  HomeViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderView.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) HomeHeaderView *headerView;
//导航栏背景图片;
@property (nonatomic, strong) UIImageView *navBarImageView;

@property (nonatomic, strong) UISearchBar *search;

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HomeHeaderView" owner:self options:nil] firstObject];
    [self.headerView initViews];
    self.tableView.tableHeaderView = self.headerView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyBoardHide)];
    [self.view addGestureRecognizer:tap];
    //初始化搜索框
    [self initSearchView];
}
//初始化搜索框
- (void)initSearchView{
    CGRect navRact = self.navigationController.view.bounds;
    _search = [[UISearchBar alloc] init];
    _search.frame = CGRectMake(CGRectGetMinX(navRact),
                              CGRectGetMinY(navRact)+20,
                              navRact.size.width,
                              44);
    _search.delegate = self;
    [self.navigationController.view addSubview:_search];
    // 设置搜索框后面的背景
    [_search setBackgroundImage:[UIImage new]];
    self.search.keyboardType = UIKeyboardTypeASCIICapable;
    _search.placeholder = @"搜索商品";
}

#pragma mark --tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
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

- (void)keyBoardHide{
    [self.search endEditing:YES];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    UIColor *color = [UIColor orangeColor];
//    CGFloat offset = scrollView.contentOffset.y;
//    if (offset<0) {
//        self.navigationController.navigationBar.backgroundColor = [color  colorWithAlphaComponent:0];
//    }else{
//        CGFloat alpha=1-((90-offset)/90);
//        self.navigationController.navigationBar.backgroundColor=[color colorWithAlphaComponent:alpha];
//    }
////    CGFloat minAlphaOffset = - 64;
////    CGFloat maxAlphaOffset = 200;
////    CGFloat offset = scrollView.contentOffset.y;
////    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
////    _navBarImageView.alpha = alpha;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
