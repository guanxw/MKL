//
//  HomeViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/29.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "HomeViewController.h"

#import "CategoryViewCell.h"
#import "TopSlideView.h"
#import "QualityFactoryViewCell.h"
#import "NowArrivalsViewCell.h"
#import "AllCategorysViewController.h"
#import "InquiryViewController.h"
#import "TradeShowViewCell.h"
#import "TradeViewController.h"

#import "SDCycleScrollView.h"
#import "MJRefresh.h"

#import "BaseNavigationViewController.h"

#import "SearchViewController.h"

@interface HomeViewController ()<UISearchBarDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UISearchBar *search;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) CategoryViewCell *categoryViewCell;

@end

static NSString * const TopSlideCell = @"TopSlideCell";
static NSString * const CategoryCell = @"CategoryCell";
static NSString * const QualityFactory = @"QualityFactory";
static NSString * const NowArrivals = @"NowArrivals";
static NSString * const TradeShow = @"TradeShowCell";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /**
     * 创建搜索按钮
     */
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(tagClick)];
    self.navigationItem.title = @"Home Page";
    
    /**
     *  修改搜索按钮颜色
     */
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyBoardHide)];
    [self.view addGestureRecognizer:tap];
    tap.delegate = self;
    //注册cell
    [self registerCell];
    
    //初始化搜索框
//    [self initSearchView];
    
    //轮播图加载图片
    [self addSDcycleView];
    
    //下拉刷新
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.collectionView.mj_header beginRefreshing];
        JDLog(@"下拉刷新");
        [self.collectionView.mj_header endRefreshing];
    }];
    //上拉加载
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.collectionView.mj_footer beginRefreshing];
        JDLog(@"上拉加载");
        [self.collectionView.mj_footer endRefreshing];
        //数据为空时
//        self.collectionView.mj_footer.hidden = YES;
    }];
}
/**
 *  添加搜索跳转事件
 */
-(void)tagClick{
    
    SearchViewController *SVC = [[SearchViewController alloc]init];
    
    [self.navigationController pushViewController:SVC animated:YES];

}

#pragma mark -UICollectionViewFlowLayout
- (instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

#pragma mark - 初始化搜索框
//- (void)initSearchView{
////    CGRect navRact = self.navigationController.view.bounds;
////    _search = [[UISearchBar alloc] init];
////    _search.frame = CGRectMake(CGRectGetMinX(navRact),
////                               CGRectGetMinY(navRact)+20,
////                               navRact.size.width,
////                               44);
////    _search.delegate = self;
//////    [self.navigationController.view addSubview:_search];
////    // 设置搜索框后面的背景
////    [_search setBackgroundImage:[UIImage new]];
////    self.search.keyboardType = UIKeyboardTypeASCIICapable;
////    _search.placeholder = @"搜索商品";
//    
//    
//    
//}

#pragma mark - 注册Cell
- (void)registerCell{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CategoryViewCell class]) bundle:nil] forCellWithReuseIdentifier:CategoryCell];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([QualityFactoryViewCell class]) bundle:nil] forCellWithReuseIdentifier:QualityFactory];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NowArrivalsViewCell class]) bundle:nil] forCellWithReuseIdentifier:NowArrivals];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([TradeShowViewCell class]) bundle:nil] forCellWithReuseIdentifier:TradeShow];
    
    [self.collectionView registerClass:[TopSlideView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TopSlideCell];
    self.collectionView.showsVerticalScrollIndicator = NO;
}

#pragma mark - <UIcollectionView 布局>
#pragma mark - 返回每一个collectionView里面Section的宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CGFloat W = SCREEN_WIDTH / (4 + 0.8);
        return CGSizeMake(W, W);
    }
    else if(indexPath.section == 1){
        return CGSizeMake(SCREEN_WIDTH * 0.3,SCREEN_WIDTH * 0.3);
    }
    else if (indexPath.section == 2){
        return CGSizeMake(SCREEN_WIDTH *0.45, SCREEN_WIDTH *0.45);
    }
    else{
        return CGSizeMake(SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.3);
    }
}

#pragma mark - 返回每个item里的Cell的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(8, 8, 8, 8);
    }else{
        return UIEdgeInsetsMake(5, 5, 5, 5);
    }
}

#pragma mark - 返回section头的宽高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeZero;
    if (section == 0) {
        size = CGSizeMake(SCREEN_WIDTH, SCREENH_HEIGHT *0.25);
    }
//    else if (section == 2){
//        size = CGSizeMake(SCREEN_WIDTH, 40);
//    }
//    else if (section == 1){
//        size = CGSizeMake(SCREEN_WIDTH, 40);
//    }
    return size;
}

//每个item之间的间距
//- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 5;
//}

#pragma mark - 每个section中不同的行之间的行间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


#pragma mark <UICollectionViewDataSource>
#pragma mark - 返回section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}
#pragma mark - 返回每个Section里的item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        //分类模块
        return 8;
    }else if (section == 1){
        //新产品模块
        return 12;
    }
//    else if(section == 2){
//        //贸易和物流模块
//        return 3;
//    }
    else if(section ==2){
        return 2;
    }
    else{
        return 18;
    }
}

#pragma mark - 给每个section添加元素
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CategoryViewCell *catgoryCell = [collectionView dequeueReusableCellWithReuseIdentifier:CategoryCell forIndexPath:indexPath];
    
        return catgoryCell;
    }
    else if(indexPath.section == 1){
        NowArrivalsViewCell *nowArrivalsCell = [collectionView dequeueReusableCellWithReuseIdentifier:NowArrivals forIndexPath:indexPath];
        return nowArrivalsCell;
    }
    else if(indexPath.section == 2){
        TradeShowViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TradeShow forIndexPath:indexPath];
        return cell;
        
    }
    else{
        QualityFactoryViewCell *qualityCell = [collectionView dequeueReusableCellWithReuseIdentifier:QualityFactory forIndexPath:indexPath];
        return qualityCell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headerView = nil;
    if (indexPath.section == 0) {
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:TopSlideCell forIndexPath:indexPath];
        [headerView addSubview:self.cycleScrollView];
    }
    return headerView;
}

#pragma mark - 点击section和cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            AllCategorysViewController *aCVC = [[AllCategorysViewController alloc] initWithNibName:@"AllCategorysViewController" bundle:nil];
            aCVC.hidesBottomBarWhenPushed = YES;
            /**
             * 隐藏搜索栏
             */
            
//            _search.hidden = NO;
            
            [aCVC.navigationItem.titleView removeFromSuperview];
            [self.navigationController pushViewController:aCVC animated:YES];
        }
        
    }else if (indexPath.section == 1 && indexPath.row ==0){
        InquiryViewController *iVC = [[InquiryViewController alloc] initWithNibName:@"InquiryViewController" bundle:nil];
        iVC.hidesBottomBarWhenPushed = YES;
        /**
         * 隐藏搜索栏
         */
//        _search.hidden = NO;

        [self.navigationController pushViewController:iVC animated:YES];
    }else if (indexPath.section == 2){
        TradeViewController *tVC = [[TradeViewController alloc] initWithNibName:@"TradeViewController" bundle:nil];
        tVC.hidesBottomBarWhenPushed = YES;
        
        /**
         * 隐藏搜索栏
         */
//        _search.hidden = YES;
        
        [self.navigationController pushViewController:tVC animated:YES];
        
    }
}
/*
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 输出点击的view的类名
    NSLog(@"%@", NSStringFromClass([touch.view class]));
    
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}
 */

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    //获取点击的View的类名
//    JDLog(@"%@", NSStringFromClass([touch.view class]));
    if ([NSStringFromClass([touch.view class])isEqualToString:@"UIView"]) {
        return NO;
    }
    return YES;
}

- (void)keyBoardHide{
    [self.search endEditing:YES];
}

#pragma mark - 内部方法(添加banner轮播图)

- (void)addSDcycleView{
    //计算尺寸
    CGFloat cycleX = 0;
    CGFloat cycleY = 0;
    CGFloat cycleW = SCREEN_WIDTH;
    CGFloat cycleH = SCREENH_HEIGHT *0.25;
    CGRect rect = CGRectMake(cycleX, cycleY, cycleW, cycleH);
    
    NSArray *imageArray = @[@"makeronly_01_banner.jpg",@"makeronly_01_banner.jpg",@"makeronly_01_banner.jpg"];
    
    
    //轮播图banner加载图片
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:rect imageNamesGroup:imageArray];
    self.cycleScrollView = cycleScrollView;
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

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
