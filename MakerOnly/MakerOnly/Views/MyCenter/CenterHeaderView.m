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
    [self bottomView];
}

- (void)bottomView{
    
    
}



@end
