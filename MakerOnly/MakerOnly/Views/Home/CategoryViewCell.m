//
//  CategoryViewCell.m
//  MakerOnly
//
//  Created by Jared on 16/8/3.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "CategoryViewCell.h"

@implementation CategoryViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.image = [UIImage imageNamed:@"allCategories"];
}

@end
