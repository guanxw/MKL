//
//  CenterHeaderView.m
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "CenterHeaderView.h"

@implementation CenterHeaderView

- (void)initViews{
    
    [self.setBtn setBackgroundImage:[UIImage imageNamed:@"makeronly_set_n"] forState:(UIControlStateNormal)];
    [self.setBtn setBackgroundImage:[UIImage imageNamed:@"makeronly_set_p"] forState:(UIControlStateHighlighted)];
    self.iconImage.image = [UIImage imageNamed:@"icon"];
    self.iconImage.layer.cornerRadius = self.iconImage.frame.size.width/2;
    self.iconImage.layer.masksToBounds = YES;
    self.nameLabel.text = @"Jared";
//    [self setupfavoriteView];
}

- (void)setupfavoriteView{
    UIView *productView = [[UIView alloc] init];
    productView.backgroundColor = [UIColor purpleColor];
    [self addSubview:productView];
    [productView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.width.mas_equalTo(self.frame.size.width/3);
        make.height.mas_equalTo(make.width);
        make.left.equalTo(self).offset(0);
    }];
}



@end
