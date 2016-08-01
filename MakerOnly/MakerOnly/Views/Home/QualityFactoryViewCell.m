//
//  QualityFactoryViewCell.m
//  MakerOnly
//
//  Created by Jared on 16/7/29.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "QualityFactoryViewCell.h"

@implementation QualityFactoryViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor orangeColor];
    self.imageView.image = [UIImage imageNamed:@"makeronly_01_img360.jpg"];
}

@end
