//
//  FactoryCollectionViewCell.m
//  MakerOnly
//
//  Created by Jared on 16/8/4.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "FactoryCollectionViewCell.h"

@implementation FactoryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.image = [UIImage imageNamed:@"makeronly_01_img360.jpg"];
    self.productName.text = @"江诗丹顿";
}

@end
