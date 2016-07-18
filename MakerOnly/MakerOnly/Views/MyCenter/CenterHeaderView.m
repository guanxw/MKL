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
    
    self.iconImage.image = [UIImage imageNamed:@"icon"];
    self.iconImage.layer.cornerRadius = self.iconImage.frame.size.width/2;
    self.iconImage.layer.masksToBounds = YES;
    
    self.nameLabel.text = @"Jared";
    self.backgroundColor = [UIColor purpleColor];
}



@end
