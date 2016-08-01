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

@interface HomeViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *search;
@end

static NSString * const TopSlideCell = @"TopSlideCell";
static NSString * const CategoryCell = @"CategoryCell";
static NSString * const QualityFactory = @"QualityFactory";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyBoardHide)];
    [self.view addGestureRecognizer:tap];
    
    //注册cell
    [self registerCell];
    
    //初始化搜索框
    [self initSearchView];
}

#pragma mark -UICollectionViewFlowLayout
- (instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

#pragma mark - 初始化搜索框
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

#pragma mark - 注册Cell
- (void)registerCell{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CategoryViewCell class]) bundle:nil] forCellWithReuseIdentifier:CategoryCell];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([QualityFactoryViewCell class]) bundle:nil] forCellWithReuseIdentifier:QualityFactory];
    
    [self.collectionView registerClass:[TopSlideView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TopSlideCell];
    self.collectionView.showsVerticalScrollIndicator = NO;
}

#pragma mark - UIcollectionView 布局
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CGFloat W = SCREEN_WIDTH / (4 + 0.8);
        return CGSizeMake(SCREEN_WIDTH, W);
    }else if(indexPath.section == 1)
    {
        return CGSizeMake(SCREEN_WIDTH * 0.48,SCREEN_WIDTH * 0.4);
    }else{
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.5);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 2) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }else{
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeZero;
    if (section == 0) {
        size = CGSizeMake(SCREEN_WIDTH, SCREENH_HEIGHT *0.25);
    }else if (section == 2){
        size = CGSizeMake(SCREEN_WIDTH, 40);
    }
    return size;
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 8;
    }else{
        return 3;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CategoryViewCell *catgoryCell = [collectionView dequeueReusableCellWithReuseIdentifier:CategoryCell forIndexPath:indexPath];
        return catgoryCell;
    }else{
        QualityFactoryViewCell *qualityCell = [collectionView dequeueReusableCellWithReuseIdentifier:QualityFactory forIndexPath:indexPath];
        return qualityCell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headerView = nil;
    if (indexPath.section == 0) {
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:TopSlideCell forIndexPath:indexPath];
    }
    return headerView;
}

- (void)keyBoardHide{
    [self.search endEditing:YES];
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
