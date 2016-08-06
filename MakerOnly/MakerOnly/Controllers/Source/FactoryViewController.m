//
//  FactoryViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/4.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "FactoryViewController.h"

#import "FactoryCollectionViewCell.h"

static NSString *identifile = @"factoryCell";

@interface FactoryViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation FactoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FactoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifile];
}

#pragma mark - <UICollectionView布局>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat W = SCREEN_WIDTH *0.45;
    return CGSizeMake(W, W);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}



#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FactoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifile forIndexPath:indexPath];
    return cell;
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
