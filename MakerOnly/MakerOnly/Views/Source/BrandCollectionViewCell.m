//
//  BrandCollectionViewCell.m
//  MakerOnly
//
//  Created by Jared on 16/8/4.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "BrandCollectionViewCell.h"

@implementation BrandCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageView.image = [UIImage imageNamed:@"brand"];
}

@end
